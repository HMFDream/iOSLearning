//
//  ViewController.m
//  CFSocketClient
//
//  Created by 黄梦妃 on 16/5/14.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import "ViewController.h"
#include <unistd.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>


#define SERVERSTR "www.baidu.com"
//#define SERVERSTR "115.239.211.112"
//#define SERVERSTR "64:ff9b::73ef:d370"


#define PORT "80"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UITextView *ipStr;
@property (strong,nonatomic) NSMutableArray *serverArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [self connect];
//    return;
    
    self.serverArr = [NSMutableArray arrayWithCapacity:5];
    
    struct addrinfo *answer, hint, *curr;
    bzero(&hint, sizeof(hint));
    hint.ai_family = AF_UNSPEC;
    hint.ai_socktype = SOCK_STREAM;
    hint.ai_flags = AI_DEFAULT;
    char ipstr2[128];
    struct sockaddr_in  *sockaddr_ipv4;
    struct sockaddr_in6 *sockaddr_ipv6;
    //64:ff9b::73ef:d21b
    //64:ff9b::73ef:d370
    int ret = getaddrinfo(SERVERSTR, PORT,&hint, &answer);
    if (ret != 0) {
        
        return;
    }
    
    for (curr = answer; curr != NULL; curr = curr->ai_next) {
        switch (curr->ai_family){
            case AF_INET:
            {
                sockaddr_ipv4 = (struct sockaddr_in *)( curr->ai_addr);
                inet_ntop(AF_INET, &sockaddr_ipv4->sin_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
                NSString *s = [self.ipStr.text stringByAppendingString:[NSString stringWithUTF8String:ipstr2]];
                self.ipStr.text = [s stringByAppendingString:@"\n"];
                [self.serverArr addObject:[NSString stringWithUTF8String:ipstr2]];
            }
                
                break;
            case AF_INET6:
            {
                sockaddr_ipv6 = (struct sockaddr_in6 *)( curr->ai_addr);
                inet_ntop(AF_INET6, &sockaddr_ipv6->sin6_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
                NSString *s = [self.ipStr.text stringByAppendingString:[NSString stringWithUTF8String:ipstr2]];
                self.ipStr.text = [s stringByAppendingString:@"\n"];
                [self.serverArr addObject:[NSString stringWithUTF8String:ipstr2]];
            }
                break;
        }
    }
    freeaddrinfo(answer);

    
    for (NSString *s in self.serverArr) {
        
        if([self createAnConnect:s] == 0)
        {
            break;
        }
    }
    
    
    
}

- (NSInteger)createAnConnect:(NSString *)serverStr
{
    NSInteger success = -1;
    
    CFSocketContext sockContext = {0,NULL,NULL,NULL, NULL};
    CFSocketRef socketRef = NULL;
    CFDataRef address;
    
    struct addrinfo *answer, hint, *curr;
    bzero(&hint, sizeof(hint));
    hint.ai_family = AF_UNSPEC;
    hint.ai_socktype = SOCK_STREAM;
    hint.ai_flags = AI_DEFAULT;
    struct sockaddr_in  *sockaddr_ipv4;
    struct sockaddr_in6 *sockaddr_ipv6;

    NSLog(@"%s",[serverStr UTF8String]);
    
    int ret = getaddrinfo(SERVERSTR, PORT,&hint, &answer);
    if (ret != 0) {
        return -1;
    }
    
    for (curr = answer; curr != NULL; curr = curr->ai_next) {
        switch (curr->ai_family){
            case AF_INET:
            {
                sockaddr_ipv4 = (struct sockaddr_in *)(curr->ai_addr);
                sockaddr_ipv4->sin_family = AF_INET;
                sockaddr_ipv4->sin_port = htons(80);
                socketRef = CFSocketCreate(kCFAllocatorDefault, AF_INET,SOCK_STREAM,0,kCFSocketConnectCallBack,NULL,&sockContext);
                if(socketRef != nil)
                {
                    address = CFDataCreate(kCFAllocatorDefault, (UInt8 *)&sockaddr_ipv4, sizeof(sockaddr_ipv4));
                }
                
            }
                break;
            case AF_INET6:
            {
                sockaddr_ipv6 = (struct sockaddr_in6 *)( curr->ai_addr);
                socketRef = CFSocketCreate(kCFAllocatorDefault, AF_INET6,SOCK_STREAM,0,kCFSocketConnectCallBack,NULL,&sockContext);
                if(socketRef != nil)
                {
                    address = CFDataCreate(kCFAllocatorDefault, (UInt8 *)&sockaddr_ipv6, sizeof(sockaddr_ipv6));
                }
            }
                break;
        }
        
        if(CFSocketConnectToAddress(socketRef,address,-1) == 0)
        {
            CFRunLoopRef cRunRef = CFRunLoopGetCurrent();    // 获取当前线程的循环
            // 创建一个循环，但并没有真正加如到循环中，需要调用CFRunLoopAddSource
            CFRunLoopSourceRef sourceRef = CFSocketCreateRunLoopSource(kCFAllocatorDefault, socketRef, 0);
            CFRunLoopAddSource(cRunRef, // 运行循环
                               sourceRef,  // 增加的运行循环源, 它会被retain一次
                               kCFRunLoopCommonModes  // 增加的运行循环源的模式
                               );
            CFRelease(sourceRef);
            NSLog(@"连接成功");
            self.result.text = @"连接成功";
            success = 0;
            break;
        }
    }
    
    freeaddrinfo(answer);
    return success;
}

void BSDSocket(struct addrinfo *answer)
{
    int sock=-1;
    struct addrinfo *addr=answer;
    while(addr!=NULL)
    {
        //建立socket
        sock=socket(addr->ai_family,addr->ai_socktype,addr->ai_protocol);
        if(sock<0)
            continue;
        if(connect(sock,addr->ai_addr,addr->ai_addrlen)==0)
        {
            NSLog(@"连接成功");
            break;
        }
        //没有链接成功，就继续尝试下一个
        close(sock);
        sock=-1;
        addr=addr->ai_next;
    }
    
    freeaddrinfo(answer);
}


- (void)connect
{
    struct addrinfo *answer, hint, *curr;
    bzero(&hint, sizeof(hint));
    hint.ai_family = AF_UNSPEC;
    hint.ai_socktype = SOCK_STREAM;
    hint.ai_flags = AI_DEFAULT;
    char ipstr2[128];
    struct sockaddr_in  *sockaddr_ipv4;
    struct sockaddr_in6 *sockaddr_ipv6;
    //64:ff9b::73ef:d21b
    //64:ff9b::73ef:d370
    int ret = getaddrinfo(SERVERSTR, PORT,&hint, &answer);
    if (ret != 0) {
        
        return;
    }
    
    for (curr = answer; curr != NULL; curr = curr->ai_next) {
        switch (curr->ai_family){
            case AF_INET:
            {
                sockaddr_ipv4 = (struct sockaddr_in *)( curr->ai_addr);
                inet_ntop(AF_INET, &sockaddr_ipv4->sin_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
                NSString *s = [self.ipStr.text stringByAppendingString:[NSString stringWithUTF8String:ipstr2]];
                self.ipStr.text = [s stringByAppendingString:@"\n"];
                [self.serverArr addObject:[NSString stringWithUTF8String:ipstr2]];
            }
                
                break;
            case AF_INET6:
            {
                sockaddr_ipv6 = (struct sockaddr_in6 *)( curr->ai_addr);
                inet_ntop(AF_INET6, &sockaddr_ipv6->sin6_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
                NSString *s = [self.ipStr.text stringByAppendingString:[NSString stringWithUTF8String:ipstr2]];
                self.ipStr.text = [s stringByAppendingString:@"\n"];
                [self.serverArr addObject:[NSString stringWithUTF8String:ipstr2]];
            }
                break;
        }
    }
    
    int sock=-1;
    struct addrinfo *addr=answer;
    while(addr!=NULL)
    {
        //建立socket
        sock=socket(addr->ai_family,addr->ai_socktype,addr->ai_protocol);
        if(sock<0)
            continue;
        if(connect(sock,addr->ai_addr,addr->ai_addrlen)==0)
        {
            NSLog(@"连接成功");
            self.result.text = @"连接成功";
            break;
        }
        //没有链接成功，就继续尝试下一个
        close(sock);
        sock=-1;
        addr=addr->ai_next;
    }
    
    freeaddrinfo(answer);
}




void TCPServerConnectCallBack(CFSocketRef socket, CFSocketCallBackType type, CFDataRef address, const void *data, void *info){
    if (data != NULL) {
        // 当socket为kCFSocketConnectCallBack时，失败时回调失败会返回一个错误代码指针，其他情况返回NULL
        NSLog(@"连接失败");
        return;
    }
}

@end
