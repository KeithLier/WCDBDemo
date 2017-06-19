//
//  Order.mm
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "Order.h"

@implementation Order

WCDB_IMPLEMENTATION(Order)

WCDB_SYNTHESIZE(Order, orderID)
WCDB_SYNTHESIZE(Order, userID)
WCDB_SYNTHESIZE(Order, goodsID)
WCDB_SYNTHESIZE(Order, qty)
WCDB_SYNTHESIZE(Order, price)


@end
