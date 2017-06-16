//
//  WCDBManager.h
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface WCDBManager : NSObject

@property (nonatomic, strong) WCTDatabase *database;

+ (instancetype)wcdbManager;
- (void)openDatabase:(NSString *)filePath;
- (BOOL)createTableOfName:(NSString *)tableName withClass:(Class)className;

@end
