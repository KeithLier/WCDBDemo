//
//  Model.h
//  WCDBDemo
//
//  Created by keith on 2017/6/19.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <WCDB/WCDB.h>

@interface Model : NSObject <WCTTableCoding>

@property(nonatomic, assign) int rowid;

@end
