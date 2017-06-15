//
//  Message.h
//  WCDBDemo
//
//  Created by keith on 2017/6/13.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <WCDB/WCDB.h>

@interface Message : NSObject <WCTTableCoding>

@property int localID;
@property(retain) NSString *content;
@property(retain) NSDate *createTime;
@property(retain) NSDate *modifiedTime;
@property(assign) int unused; 

// WCDB_PROPERTY声明绑定到数据库表的字段
WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)

@end
