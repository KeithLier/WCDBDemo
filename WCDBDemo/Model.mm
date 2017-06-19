//
//  Model.mm
//  WCDBDemo
//
//  Created by keith on 2017/6/19.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "Model.h"

@implementation Model


WCDB_IMPLEMENTATION(Model)

WCDB_SYNTHESIZE(Model, rowid)
WCDB_PRIMARY_AUTO_INCREMENT(Model, rowid)
WCDB_UNIQUE(Model, rowid)

@end
