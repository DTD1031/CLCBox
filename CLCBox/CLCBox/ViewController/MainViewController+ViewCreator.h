//
//  MainViewController+ViewCreator.h
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/24.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (ViewCreator)

- (UIView *)getViewWithDataInfo:(NSDictionary* )info;
@end
