//
//  MainViewController+ViewCreator.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/24.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "MainViewController+ViewCreator.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


@implementation MainViewController (ViewCreator)

- (UIView *)getViewWithDataInfo:(NSDictionary* )info{
    
    if (!info || info.count <= 0 ) { return [[UIView alloc] init];}
    
    NSString* type = [info objectForKey:@"type"];
    if (!type || [type isEqualToString:@""]) {return [[UIView alloc] init];}
    
    NSInteger typeCode = [type integerValue];
    switch (typeCode) {
        case ViewTypeTable:{
            
        }break;
        case ViewTypeItems:
            
            return [self createItemsWithData:info];
        case ViewTypeTicket:
            
            break;
        case ViewTypePackage:
            
            break;
        case ViewTypeList:
            
            break;
        default:
            break;
    }
    return [[UIView alloc] init];
}

- (UIView *)createItemsWithData:(NSDictionary *)data{
    
    //创建子容器
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 0)];
    
    NSArray* itemsArray = [data objectForKey:@"items"];
    NSInteger num = [[data objectForKey:@"num"] integerValue];
    
    if (!itemsArray || itemsArray.count == 0) {return [[UIView alloc] init];}
    
    for (NSInteger i = 0 ; i < num; i ++){
        
        BOOL isRight = i%2;
        UIView* view = [[UIView alloc] init];
        CGFloat h = 120;
        CGFloat w = (kWidth - 45)/2;  //左中右三个间距的和为 15+15+15 = 45
        CGFloat x = isRight ? (kWidth/2 + 7.5) : 15;
        CGFloat y = (i/2 * (h + 15)) + 15;
        
        if (i%2){
            //右
            [view setBackgroundColor:[UIColor redColor]];
        }else{
            //左
            [view setBackgroundColor:[UIColor blueColor]];
        }
        
        [view setFrame:CGRectMake(x, y, w, h)];
        [contentView addSubview:view];
    }
    
    return contentView;
}


@end
