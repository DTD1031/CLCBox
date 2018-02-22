//
//  CBXXmlParsingTool.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "CBXXmlParsingTool.h"

@interface CBXXmlParsingTool()<NSXMLParserDelegate>

@property(nonatomic, strong) NSString* currentElement; //当前正在查询的节点
@end

@implementation CBXXmlParsingTool

static CBXXmlParsingTool* onceTool = nil;

+ (instancetype)tool{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        onceTool = [[CBXXmlParsingTool alloc] init];
    });
    
    return onceTool;
}

- (NSDictionary *)parsingXML:(NSString *)inputString{
    
    if (!inputString || [inputString isEqualToString:@""]){
        
        NSDictionary* dict = [NSDictionary dictionary];
        return dict;
    }
    
    NSData* inputData = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:inputData];
    parser.delegate = self;
    
    BOOL success = [parser parse];
    
    if (success) {
        
        NSLog(@"Return Now");
        return [NSDictionary dictionary]; //返回成功解析内容  （待完善
    }else{
        
        NSLog(@"Return Now");
        return [NSDictionary dictionary];
    }
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    
    NSLog(@"begin parsing ........ ");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    if (parser.parserError){
        
        NSLog(@"parse Error !!! ErrorCode = %ld", parser.parserError.code);
    }else{
    
        NSLog(@"================finished parsing================");
    }
}

- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model{
    
    NSLog(@"name --- %@, model --- %@", elementName, model);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    NSLog(@" characters ---%@---", string);
}

@end

















