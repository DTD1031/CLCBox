//
//  CBXXmlParsingTool.h
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBXXmlParsingTool : NSObject

+ (instancetype)tool;
- (NSDictionary *)parsingXML:(NSString *)xmlString;

@end
