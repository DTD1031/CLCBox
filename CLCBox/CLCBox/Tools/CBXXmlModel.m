//
//  CBXXmlModel.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/23.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "CBXXmlModel.h"

@implementation CBXXmlModel


- (instancetype)init{
    
    if (self = [super init]) {
        
        self.childrens = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (NSDictionary *)getDictionary{
    //递归获取NSDictionary形式数据
    NSMutableDictionary* resultDic = [[NSMutableDictionary alloc] init];
    
    if (self.childrens && self.childrens.count > 0) {
        
        for (NSString* key in self.childrens) {
            
            if ([[self.childrens objectForKey:key] isKindOfClass:[CBXXmlModel class]]) {
                
                CBXXmlModel* object = [self.childrens objectForKey:key];
                [resultDic setObject:[object getDictionary] forKey:key];
            }else{
                
                [resultDic setObject:[self.childrens objectForKey:key] forKey:key];
            }
        }
    }
    
    return resultDic;
}
@end
