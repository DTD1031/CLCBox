//
//  CBXXmlModel.h
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/23.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBXXmlModel : NSObject

@property (nonatomic, strong) CBXXmlModel* parentNode;  //父数组
@property (nonatomic, strong) NSMutableDictionary* childrens;   //本节点下的字节点


- (instancetype)init;
- (NSDictionary *)getDictionary;
@end
