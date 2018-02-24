//
//  MainViewController.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "MainViewController.h"
#import "NSString+JSON.h"
#import "MainViewController+ViewCreator.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray* configure; //页面主配置
@property (nonatomic, strong) UIScrollView* mainView;

@property (nonatomic, assign) CGFloat cursor; //当前插入位置的y轴坐标

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.7 alpha:1];
    [self getConfigure];    //获取配置
    [self createMainView];  //创建主View（容器
    
}

- (void)createMainView{
    
    
    
    self.mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height)] ;
    [self.view addSubview:self.mainView];
    self.cursor = 0;
    [self loadConfigure];
}

- (void)loadConfigure{
    
    NSArray* configure = self.configure;
    if (configure && configure.count >= 1) {
        //开始遍历配置生成页面布局内容
        for (NSDictionary* dict in configure) {

            NSString* type = [dict objectForKey:@"type"];
            if (!type || [type isEqualToString:@""]) { continue; } //异常数据忽略，保证当前显示正确
            
            UIView* sectionView = [self getViewWithDataInfo:dict];   //对应type创建View
            [self.mainView addSubview:sectionView];
            _cursor += sectionView.frame.size.height;
            NSLog(@"%@",dict);
        }
    }
    
    [self.mainView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, _cursor)];
}


- (void)insertView:(UIView *)view{
    //向容器中加入视图块
    CGRect frame = view.frame;
    frame.origin.y = _cursor;
    
    view.frame = frame;
    [self.mainView addSubview:view];
}

- (void)getConfigure{
    //读取配置相关文件 转为json对象
    NSString* path = [[NSBundle mainBundle] pathForResource:@"json_exp" ofType:@"json"];
    NSString* jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray* array = [jsonString getJSONObject];
    if (array && array.count >= 1) {
        self.configure = array;
    }
}



@end
