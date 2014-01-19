//
//  ViewController.m
//  demo
//
//  Created by 周渊 on 14-1-18.
//  Copyright (c) 2014年 周渊. All rights reserved.
//

#import "ViewController.h"
#import "THLevelDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"leveldb_demo.ldb"];
    
    THLevelDB *db = [THLevelDB levelDBWithPath:dbPath];
    
    //存储字符串
    [db setString:@"成都" forKey:@"city"];
//
//    //存储基本类型
//    [db setInt:13579 forKey:@"count"];
//    [db setFloat:30.2 forKey:@"temperature"];
//    
//    //存储Data数据
//    NSData *data = [@"天府之国" dataUsingEncoding:NSUTF8StringEncoding];
//    [db setData:data forKey:@"data"];
//    
//    //存储任意对象(实现了NSCoding协议的对象)
//    [db setObject:[NSDate date] forKey:@"object"];
//    
//    
//    NSLog(@"城市:%@",[db stringForKey:@"city"]);
//   // NSLog(@"数量:%ld",[db intForKey:@"count"]);
//    NSLog(@"Data:%@",[db dataForKey:@"data"]);
//    NSLog(@"对象:%@",[db objectForKey:@"object"]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
