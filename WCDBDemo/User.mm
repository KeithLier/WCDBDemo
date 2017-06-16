//
//  User.mm
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "User.h"

@implementation User


//The order of the definitions is the order of the fields in the database
WCDB_IMPLEMENTATION(User)

WCDB_SYNTHESIZE(User, userID)
WCDB_SYNTHESIZE(User, username)
WCDB_SYNTHESIZE(User, address)
WCDB_SYNTHESIZE(User, birth)
WCDB_SYNTHESIZE(User, email)
WCDB_SYNTHESIZE(User, phone)
WCDB_SYNTHESIZE(User, createTime)
WCDB_SYNTHESIZE(User, modifiedTime)

//Primary Key
WCDB_PRIMARY(User, userID)
//Index
WCDB_INDEX_DESC(User, "index_user_name", username)


@end
