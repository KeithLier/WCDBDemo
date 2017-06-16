//
//  User.h
//  WCDBDemo
//
//  Created by keith on 2017/6/16.
//  Copyright © 2017年 keith. All rights reserved.
//

#import <WCDB/WCDB.h>

@interface User : NSObject <WCTTableCoding>

@property (nonatomic, assign) int userID;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *birth;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phone;
@property (retain) NSDate *createTime;
@property (retain) NSDate *modifiedTime;

@property(assign) int unused;

WCDB_PROPERTY(userID)
WCDB_PROPERTY(username)
WCDB_PROPERTY(address)
WCDB_PROPERTY(birth)
WCDB_PROPERTY(email)
WCDB_PROPERTY(phone)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(modifiedTime)


@end
