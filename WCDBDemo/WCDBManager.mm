//
//  WCDBManager.m
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "WCDBManager.h"

@implementation WCDBManager

+ (instancetype)wcdbManager {
    static WCDBManager *mgr;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[WCDBManager alloc] init];
    });
    return mgr;
}

- (void)openDatabase:(NSString *)filePath {
    WCTDatabase *wcdb = [[WCTDatabase alloc] initWithPath:filePath];
    self.database = wcdb;
}

- (BOOL)createTableOfName:(NSString *)tableName withClass:(Class)className {
    
    if (![self.database isTableExists:tableName]) {
        return [self.database createTableAndIndexesOfName:tableName withClass:className];
    }
    return YES;
}

@end
