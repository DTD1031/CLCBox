//
//  NSString+JSON.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/24.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)

- (id)getJSONObject{

    NSError *error;
    id obj = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    
    return obj;
}

@end
