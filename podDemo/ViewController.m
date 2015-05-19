//
//  ViewController.m
//  podDemo
//
//  Created by ccguo on 15/5/3.
//  Copyright (c) 2015年 ccguo. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFHTTPRequestOperation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"%@",[responseObject class]);
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"error..");
    }];
    
    [operation setCacheResponseBlock:^NSCachedURLResponse *(NSURLConnection *connection, NSCachedURLResponse *cachedResponse) {
        
        NSLog(@"%@",cachedResponse.userInfo);
        return nil;
    }];
    
    [operation start];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
