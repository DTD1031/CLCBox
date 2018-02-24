//
//  MainViewController.h
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
typedef enum : NSUInteger {
    ViewTypeTable = 0,
    ViewTypeItems = 1,
    ViewTypeTicket = 2,
    ViewTypePackage = 3,
    ViewTypeList = 4
} viewType;


@end
