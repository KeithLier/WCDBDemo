//
//  Goods.mm
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "Goods.h"

@implementation Goods

WCDB_IMPLEMENTATION(Goods)

WCDB_SYNTHESIZE(Goods, goodsID)
WCDB_SYNTHESIZE(Goods, sku)
WCDB_SYNTHESIZE(Goods, goodsName)
WCDB_SYNTHESIZE(Goods, price)
WCDB_SYNTHESIZE(Goods, imageUrl)
WCDB_SYNTHESIZE(Goods, sizes)
WCDB_SYNTHESIZE(Goods, colors)
WCDB_SYNTHESIZE(Goods, createTime)
WCDB_SYNTHESIZE(Goods, modifiedTime)

//Primary Key
WCDB_PRIMARY(Goods, goodsID)
//Index
WCDB_INDEX_DESC(Goods, "index_user_name", sku)

@end
