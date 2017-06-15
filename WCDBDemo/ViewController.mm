//
//  ViewController.m
//  WCDBDemo
//
//  Created by keith on 2017/6/13.
//  Copyright © 2017年 keith. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import <FMDB/FMDB.h>

@interface ViewController ()

@property (nonatomic, strong) WCTDatabase *wcdb;
@property (nonatomic, strong) FMDatabase *fmdb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //create table
    [self createTable];
//    //insert
//    [self insertObject];
//    //query
//    [self queryObject];
//    //update
//    [self updateObject];
    //delete
//    [self deleteObject];
    
//    [self winQueryObject];
//    [self encryptDataBase];
//    [self backupDataBase];
}

//创建新表
- (void)createTable {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *path = [paths firstObject];
    NSLog(@"path = %@",path);
    //WCDB
    NSString *wcdbPath = [path stringByAppendingPathComponent:@"wcdb.db"];
    self.wcdb = [[WCTDatabase alloc] initWithPath:wcdbPath];
    if (![self.wcdb isTableExists:@"message"]) {
        // WCDB创建表的形式
        BOOL result = [self.wcdb createTableAndIndexesOfName:@"message"
                                                   withClass:Message.class];
        if (result) {
            NSLog(@"create table success");
        }
    }
    
    //FMDB
    NSString *fmdbPath = [path stringByAppendingPathComponent:@"fmdb.db"];
    self.fmdb = [FMDatabase databaseWithPath:fmdbPath];
    [self.fmdb open];
    if (![self isTableExist:@"message"]) {
        // FMDB创建表的形式 写SQL语句的形式
        NSString *sql = @"create table message (localID integer primary key, content text,createTime integer,modifyTime integer);";
        BOOL result = [self.fmdb executeStatements:sql];
        if (result) {
            NSLog(@"create table success");
        }
    }
    [self.fmdb close];
}

//FMDB 表是否存在
- (BOOL)isTableExist:(NSString *)table {
    
    NSMutableArray *tables = [NSMutableArray array];
    FMResultSet *set = [self.fmdb getSchema];
    while ([set next]) {
        NSDictionary *row = set.resultDictionary;
        NSString *name = row[@"name"];
        if (name.length) {
            [tables addObject:name];
        }
    }
    return [tables containsObject:table];
}

//查询数据
- (void)queryObject {
    
    //WCDB
    NSArray <Message *>*messages = [self.wcdb getObjectsOfClass:Message.class fromTable:@"message" orderBy:Message.localID.order()];
    for (Message *msg in messages) {
        NSLog(@"%@\n",msg.content);
    }
    
    //FMDB
    NSString *sql = @"select * from message";
    [self.fmdb open];
    FMResultSet *s = [self.fmdb executeQuery:sql];
    NSMutableArray *arr = [NSMutableArray array];
    while ([s next]) {
        NSDictionary *d = [s resultDictionary];
        [arr addObject:d];
    }
    NSLog(@"%@",arr);
    [self.fmdb close];
}

//新增数据
- (void)insertObject {
    
    int localID = 1;
    NSString *content = @"Hello DataBase";
    NSDate *createDate = [NSDate date];
    NSDate *modifyDate = [NSDate date];
    
    //WCDB
    Message *msg = [[Message alloc] init];
    msg.localID = localID;
    msg.content = content;
    msg.createTime = createDate;
    msg.modifiedTime = modifyDate;
    BOOL result = [self.wcdb insertObject:msg into:@"message"];
    if (result) {
        NSLog(@"insert success");
    }
    
    //FMDB
    [self.fmdb open];
    NSString *sql = [NSString stringWithFormat:@"insert into message (localID, content, createTime, modifyTime) values (%d,'%@',%@,%@)",localID,content,@([createDate timeIntervalSince1970]),@([modifyDate timeIntervalSince1970])];
    result = [self.fmdb executeUpdate:sql];
    if (result) {
        NSLog(@"insert success");
    }
    [self.fmdb close];
}

//删除数据
- (void)deleteObject {
    
    //WCDB
    BOOL result = [self.wcdb deleteObjectsFromTable:@"message" where:Message.localID == 1];
    if (result) {
        NSLog(@"delete success");
    }
    
    //FMDB
    [self.fmdb open];
    NSString *sql = @"delete from message where localID = 1";
    result = [self.fmdb executeUpdate:sql];
    if (result) {
        NSLog(@"delete success");
    }
    [self.fmdb close];
}

//更新数据
- (void)updateObject {
    
    //WCDB
    Message *msg = [[Message alloc] init];
    msg.content = @"Hello,WeChat";
    BOOL result = [self.wcdb updateTable:@"message" onProperty:Message.content withObject:msg where:Message.localID == 1];
    if (result) {
        NSLog(@"update success");
    }
    
    //FMDB
    [self.fmdb open];
    NSString *sql = @"update message set content = 'hello,database' where localID = 1";
    result = [self.fmdb executeUpdate:sql];
    if (result) {
        NSLog(@"update success");
    }
    [self.fmdb close];
}

//事物处理
- (void)transactionObject {
    
    Message *msg = [[Message alloc] init];
    msg.localID = 11;
    msg.content = @"content";
    msg.createTime = [NSDate date];
    msg.modifiedTime = [NSDate date];
    
    //接口直接处理
    BOOL commit = [self.wcdb runTransaction:^BOOL{
        [self.wcdb insertObject:msg into:@"message"];
        return YES;
    }];
    if (commit) {
        NSLog(@"commit success");
    }


    msg.localID = 12;
    //获取对象进行处理
    WCTTransaction *transaction = [self.wcdb getTransaction];
    BOOL result = [transaction begin];
    [transaction insertObject:msg into:@"message"];
    result = [transaction commit];
    if (!result) {
        //不成功，回滚
        [transaction rollback];
        NSLog(@"%@",[transaction error]);
    }
}

//WINQ集成查询
- (void)winQueryObject {
    
   NSArray <Message *>*messages = [self.wcdb getObjectsOnResults:{Message.createTime.max(),Message.createTime.min()}
                         fromTable:@"message"
                             where:Message.localID > 2 && Message.content.isNull()];
    for (Message *msg in messages) {
        NSLog(@"%@\n",msg.createTime);
    }
    
    [self.wcdb deleteObjectsFromTable:@"message" where:Message.localID.between(1, 2)];
}


//数据库加密
- (void)encryptDataBase {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *path = [paths firstObject];
    NSString *wcdbPath = [path stringByAppendingPathComponent:@"encript.db"];
    WCTDatabase *db = [[WCTDatabase alloc] initWithPath:wcdbPath];
    NSData *password = [@"password" dataUsingEncoding:NSASCIIStringEncoding];
    [db setCipherKey:password];
    BOOL result = [db createTableAndIndexesOfName:@"message"
                                               withClass:Message.class];
    if (result) {
        NSLog(@"encrypt success");
    }

}

- (void)backupDataBase {
    NSData *backup = [@"backup" dataUsingEncoding:NSASCIIStringEncoding];
    [self.wcdb backupWithCipher:backup];
    
//    dispatch_async(DISPATCH_QUEUE_PRIORITY_BACKGROUND, ^{
//        WCTDatabase *recover = [[WCTDatabase alloc] initWithPath:recoverPath];
//        NSData *password = [@"backup" dataUsingEncoding:NSASCIIStringEncoding];
//        NSData *backupPassword = [@"backup" dataUsingEncoding:NSASCIIStringEncoding];
//        int pageSize = 4096;//Default to 4096 on iOS and 1024 on macOS.
//        [database close:^{
//            [recover recoverFromPath:path
//                        withPageSize:pageSize
//                        backupCipher:cipher
//                      databaseCipher:password];
//        }];
//    });
}

@end
