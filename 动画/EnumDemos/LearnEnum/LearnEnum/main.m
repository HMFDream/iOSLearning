//
//  main.m
//  LearnEnum
//
//  Created by 黄梦妃 on 16/3/24.
//  Copyright © 2016年 黄梦妃. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  枚举类型的定义方式之一，V1从0开始
 */
void enum1()
{
    enum temp1{
        V1,
        V2,
        V3
    };
    
    enum temp1 tep = V1;
    
    NSLog(@"%u",tep);
}

/**
 *  枚举类型的定义方式之一，V1从1开始,递增1
 */
void enum2()
{
    enum temp1{
        V1 = 1,
        V2,
        V3
    };
    
    typedef enum temp1 enumTemp;
    
    enumTemp r = V1;
    enumTemp r1 = V2;
    enumTemp r2 = V3;
    NSLog(@"%u",r);
    NSLog(@"%u",r1);
    NSLog(@"%u",r2);
    
}

/**
 *  枚举类型的定义方式之一，比较简单的定义方式
 */
void enum3()
{
    typedef enum : NSUInteger {
        VA,
        VB,
        VC
    } temp1;
    
    temp1 t= VA;
    NSLog(@"%lu",(unsigned long)t);
}

/**
 *  枚举类型的定义方式之一，辅助宏定义，一般选项
 */
void enum4()
{
    typedef NS_ENUM(NSUInteger,temp)
    {
        VA,
        VB,
        VC
    };
    temp t=VA;
    NSLog(@"%lu",(unsigned long)t);
    
    
}


/**
 *  枚举类型的定义方式之一，辅助宏定义，组合选项
    按位与操作可以判断出是否已启用某个选项
 */
void enum5()
{
    typedef NS_OPTIONS(NSUInteger,temp)
    {
        VA=1<<0,
        VB=1<<1,
        VC=1<<2
    };
    temp t=VA;
    //NSLog(@"%lu",(unsigned long)t);
    
    NSLog(@"%lu",t&VA);
    NSLog(@"%lu",t&VB);
    
    if(t & VA)
    {
        NSLog(@"有VA");
    }else
    {
        NSLog(@"没有VA");
    }
    

}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        enum1();
        enum2();
        enum3();
        enum4();
        enum5();
    }
    return 0;
}
