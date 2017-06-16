//
//  Order.h
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <WCDB/WCDB.h>
#import <UIKit/UIKit.h>

@interface Order : NSObject <WCTTableCoding>


@property (nonatomic, assign) int orderID;
@property (nonatomic, assign) int userID;
@property (nonatomic, assign) int goodsID;
@property (nonatomic, assign) int qty;
@property (nonatomic, assign) CGFloat price;



WCDB_PROPERTY(orderID)
//Property With Index
WCDB_PROPERTY(userID)
//Propery With Specified Column Name
WCDB_PROPERTY(goodsID)
//Propery With Default Value
WCDB_PROPERTY(qty)
//Properies With Multi-Indexes
WCDB_PROPERTY(price)

@end
