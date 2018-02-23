//
//  CBXXmlParsingTool.m
//  CLCBox
//
//  Created by 陈乐诚 on 2018/2/22.
//  Copyright © 2018年 陈乐诚. All rights reserved.
//

#import "CBXXmlParsingTool.h"
#import "CBXXmlModel.h"

@interface CBXXmlParsingTool()<NSXMLParserDelegate>

@property (nonatomic, strong) NSString* currentElement; //当前正在查询的节点

@property (nonatomic, assign) BOOL nodeStart; //开始一个节点
@property (nonatomic, assign) BOOL nodeEnd; //结束一个节点

@property (nonatomic, strong) CBXXmlModel* currentNode;  //当前正在操作的节点
@property (nonatomic, strong) CBXXmlModel* rootNode;   //根节点

@end

@implementation CBXXmlParsingTool

- (NSDictionary *)parsingXML:(NSString *)inputString{
    
    if (!inputString || [inputString isEqualToString:@""]){
        
        NSDictionary* dict = [NSDictionary dictionary];
        return dict;
    }
    
    //输入转为data准备解析
    NSData* inputData = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData:inputData];
    parser.delegate = self;
    
    //初始化判断位
    [self resetFlags];
    
    //启动解析
    BOOL success = [parser parse];
    
    //结果处理
    if (success) {
        
        NSLog(@"%@",[_rootNode getDictionary]);
        return [_rootNode getDictionary]; //返回成功解析内容  （待完善
    }else{
        
        NSLog(@"Return Error !!!");
        return [NSDictionary dictionary];   //
    }
}

- (void)resetFlags{
    
    _nodeStart = NO;
    _nodeEnd = NO;
    
    _currentNode = [[CBXXmlModel alloc] init];
    _rootNode = _currentNode;
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

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    //开始处理一个节点
    if (!elementName || [elementName isEqualToString:@""]) {
        
        elementName = @"unknown";
    }
    
    if (_nodeStart){
        //一个子节点(dict)
        
        CBXXmlModel* newNode = [[CBXXmlModel alloc] init];
        newNode.parentNode = _currentNode;
        [_currentNode.childrens setObject:newNode forKey:_currentElement];
        _currentNode = newNode;
        
    }else{
        //一个子属性(str)
        
    }
    
    _currentElement = elementName;
    _nodeStart = YES;
    _nodeEnd = NO;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //结束一个节点
    
    if (_nodeEnd) {
        //结束一个节点，返回上一层
        
        _currentNode = _currentNode.parentNode;

    }else{
        //结束一个属性，继续下一个
        
    }
    
    _nodeStart = NO;
    _nodeEnd = YES;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if (string.length <= 0 || [string characterAtIndex:0] == '\n') {
        
        return;
    }
    
    [_currentNode.childrens setObject:string forKey:_currentElement];
}

@end

















