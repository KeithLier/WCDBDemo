//
//  Message.mm
//  WCDBDemo
//
//  Created by keith on 2017/6/13.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "Message.h"

@implementation Message

// WCDB_IMPLEMENTATION，用于在类文件中定义绑定到数据库表的类
WCDB_IMPLEMENTATION(Message)

// WCDB_SYNTHESIZE，用于在类文件中定义绑定到数据库表的字段
WCDB_SYNTHESIZE(Message, localID)
WCDB_SYNTHESIZE(Message, content)
WCDB_SYNTHESIZE(Message, createTime)
WCDB_SYNTHESIZE(Message, modifiedTime)

// WCDB_PRIMARY用于定义主键
WCDB_PRIMARY(Message, localID)

// WCDB_INDEX用于定义索引
WCDB_INDEX(Message, "_index", createTime)

// WCDB_UNIQUE用于定义唯一约束
// WCDB_NOT_NULL用于定义非空约束

@end
