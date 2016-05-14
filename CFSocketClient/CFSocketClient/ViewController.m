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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    int ret = getaddrinfo("www.baidu.com", "80",&hint, &answer);
    if (ret != 0) {
        
        return;
    }
    
    for (curr = answer; curr != NULL; curr = curr->ai_next) {
        switch (curr->ai_family){
            case AF_UNSPEC:
                //do something here
                break;
            case AF_INET:
                sockaddr_ipv4 = (struct sockaddr_in *)( curr->ai_addr);
                inet_ntop(AF_INET, &sockaddr_ipv4->sin_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
                break;
            case AF_INET6:
                sockaddr_ipv6 = (struct sockaddr_in6 *)( curr->ai_addr);
                inet_ntop(AF_INET6, &sockaddr_ipv6->sin6_addr, ipstr2,sizeof(ipstr2));
                printf("%s\n",ipstr2);
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
            break;
        }
        //没有链接成功，就继续尝试下一个
        close(sock);
        sock=-1;
        addr=addr->ai_next;
    }

    
    
    
    
    freeaddrinfo(answer);
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
