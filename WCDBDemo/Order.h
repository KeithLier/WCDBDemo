//
//  Order.h
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "Model.h"
#import <UIKit/UIKit.h>

@interface Order : Model


@property (nonatomic, assign) int orderID;
@property (nonatomic, assign) int userID;
@property (nonatomic, assign) int goodsID;
@property (nonatomic, assign) int qty;
@property (nonatomic, assign) CGFloat price;


WCDB_PROPERTY(orderID)
WCDB_PROPERTY(userID)
WCDB_PROPERTY(goodsID)
WCDB_PROPERTY(qty)
WCDB_PROPERTY(price)

@end
