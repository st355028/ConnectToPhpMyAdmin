//
//  ConnectServer.m
//  ConnectServer
//
//  Created by MinYeh on 2016/8/21.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import "ConnectServer.h"
#import <AFNetworking.h>
@implementation ConnectServer

static ConnectServer * _singtonConnectServer = nil;

+(instancetype) sharedInstance{
    
    if(_singtonConnectServer == nil){
        _singtonConnectServer = [ConnectServer new];
    }
    
    return _singtonConnectServer;
}

-(void) sendShoppingInfo:(NSString*) account notes:(NSString*)notes Money:(NSString*)money cost:(NSString*)cost completion:(DoneHandler) doneHandler{
    
    NSDictionary * jsonObj = @{USER_ACCOUNT:account,USER_NOTES:notes,USER_MONEY:money,USER_COST:cost};
    NSLog(@"123:%@",jsonObj);
    [self doPost:UPLOADDATA_URL parameters:jsonObj completion:doneHandler];
}

-(void) downloadShoppingInfo:(DoneHandler) doneHandler{
    
    [self doPost:DOWNLOADDATA_URL parameters:nil completion:doneHandler];
    
}


//連接各PHP檔案的模組
-(void) doPost:(NSString*) urlString parameters:(NSDictionary*)parameters completion:(DoneHandler) doneHandle{
    //AFNetwork使用框架
    //parameters 把dictionary內容包成json
    //progress 查看進度用
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //配合目前使用的server的content-type ，如果不支援會錯誤
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:urlString parameters:parameters progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              NSLog(@"doPOST ok result:%@",responseObject);
              doneHandle(nil,responseObject);
              
          }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              NSLog(@"doPOST Error: %@",error);
              doneHandle(error,nil);
              
          }];

}
@end
