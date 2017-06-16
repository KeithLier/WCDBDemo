//
//  Goods.h
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <WCDB/WCDB.h>
#import <UIKit/UIKit.h>

@interface Goods : NSObject <WCTTableCoding>

@property (nonatomic, assign) int goodsID;
@property (nonatomic, retain) NSString *sku;
@property (nonatomic, retain) NSString *goodsName;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, strong) NSArray *sizes;
@property (nonatomic, strong) NSArray *colors;

@property (retain) NSDate *createTime;
@property (retain) NSDate *modifiedTime;

WCDB_PROPERTY(goodsID)
WCDB_PROPERTY(sku)
WCDB_PROPERTY(goodsName)
WCDB_PROPERTY(price)
WCDB_PROPERTY(imageUrl)
WCDB_PROPERTY(sizes)
WCDB_PROPERTY(colors)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)

@end
