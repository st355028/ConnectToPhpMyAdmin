//
//  ViewController.m
//  ConnectServer
//
//  Created by MinYeh on 2016/8/21.
//  Copyright © 2016年 MINYEH. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "ConnectServer.h"


@interface ViewController ()
{
    ConnectServer * comm;
}
@property (weak, nonatomic) IBOutlet UITextField *inputAccount;
@property (weak, nonatomic) IBOutlet UITextField *inputCost;
@property (weak, nonatomic) IBOutlet UITextField *inputMoney;
@property (weak, nonatomic) IBOutlet UITextField *inputNotes;

@property (weak, nonatomic) IBOutlet UILabel *showAccount;
@property (weak, nonatomic) IBOutlet UILabel *showCost;
@property (weak, nonatomic) IBOutlet UILabel *showMoney;
@property (weak, nonatomic) IBOutlet UILabel *showTimes;
@property (weak, nonatomic) IBOutlet UILabel *showNotes;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    comm = [ConnectServer sharedInstance];
    
}
- (IBAction)uploadData:(UIButton *)sender {
    
    
    [self.inputAccount resignFirstResponder];
    [self.inputMoney resignFirstResponder];
    [self.inputCost resignFirstResponder];
    [self.inputNotes resignFirstResponder];
    
//    NSNumberFormatter * formatter = [NSNumberFormatter new];
//    NSNumber * money = [formatter numberFromString:self.inputMoney.text];
    
    [comm sendShoppingInfo:self.inputAccount.text notes:self.inputNotes.text Money:self.inputMoney.text cost:self.inputCost.text completion:^(NSError *error, id result) {
        if(error){
            NSLog(@"上傳失敗");
        }else{
            NSLog(@"上傳成功");
        }
    }];
}
- (IBAction)downloadData:(UIButton *)sender {
    
    [comm downloadShoppingInfo:^(NSError *error, id result) {
        if(error){
            NSLog(@"%@",error);
        }else{
            //將載回來的資料解析
            NSDictionary * ShoppingInfoArray = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingAllowFragments error:&error];
            
            
            NSLog(@"123:%@",ShoppingInfoArray);
            self.showAccount.text = [NSString stringWithFormat:@"%@",ShoppingInfoArray[@"account"]];
            self.showCost.text = [NSString stringWithFormat:@"%@",ShoppingInfoArray[@"cost"]];
            self.showNotes.text = [NSString stringWithFormat:@"%@",ShoppingInfoArray[@"notes"]];
           self.showMoney.text = [NSString stringWithFormat:@"%@",ShoppingInfoArray[@"money"]];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
