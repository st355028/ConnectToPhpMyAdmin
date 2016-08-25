//
//  ConnectServer.h
//  ConnectServer
//
//  Created by MinYeh on 2016/8/21.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#define USER_ACCOUNT  @"user_account"
#define USER_COST @"user_cost"
#define USER_MONEY @"user_money"
#define USER_NOTES @"user_notes"

#define BASE_URL @"http://localhost:8888"
#define UPLOADDATA_URL [BASE_URL stringByAppendingPathComponent:@"TestUoload.php"]
#define DOWNLOADDATA_URL [BASE_URL stringByAppendingPathComponent:@"Test_Download.php"]


//將void(^)(NSError *error,id result) 改名成DoneHandler
typedef void (^DoneHandler)(NSError *error,id result);


@interface ConnectServer : NSObject

+(instancetype) sharedInstance;


-(void) sendShoppingInfo:(NSString*) account notes:(NSString*)notes Money:(NSString*)money cost:(NSString*)cost completion:(DoneHandler) doneHandler;

-(void) downloadShoppingInfo:(DoneHandler) doneHandler;

@end
