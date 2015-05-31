//
//  ViewController.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "ViewController.h"
#import "DouBanTableViewCell.h"

@interface ViewController ()
//添加了一个tabview属性
@property (weak, nonatomic) IBOutlet UITableView *tabView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注册了个cell
    UINib *nib = [UINib nibWithNibName:@"DouBanTableViewCell.h" bundle:nil];
    [self.tabView registerNib:nib forCellReuseIdentifier:@"DouBanTableViewCell.h"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
