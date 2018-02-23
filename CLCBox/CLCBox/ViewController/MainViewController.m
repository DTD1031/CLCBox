//
//  MainViewController.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "MainViewController.h"
#import "CBXXmlParsingTool.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.7 alpha:1];
    [self tryXML];
    // Do any additional setup after loading the view.
}

- (void)tryXML{

    NSString* path = [[NSBundle mainBundle] pathForResource:@"exp" ofType:@"xml"];
    NSString* xmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"\n--------------\
          \n %@ \n \
          ---------------",xmlString);
    [[[CBXXmlParsingTool alloc] init] parsingXML:xmlString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
