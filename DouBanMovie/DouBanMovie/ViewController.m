//
//  ViewController.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "ViewController.h"
#import "DouBanTableViewCell.h"
#import "DatailViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
//添加了一个tabview属性
@property (strong, nonatomic)UITableView *tabView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //注册了个cell
    
    self.tabView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview: _tabView];
    self.tabView.dataSource = self;
    
    self.tabView.delegate = self;
    self.tabView.rowHeight = 148;
    self.navigationItem.title = @"豆瓣最新电影";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(lookAll)];
    self.navigationItem.rightBarButtonItem = rightButton;

    UINib *nib = [UINib nibWithNibName:@"DouBanTableViewCell" bundle:nil];
    [self.tabView registerNib:nib forCellReuseIdentifier:@"DouBanTableViewCell"];
   
}
-(void)lookAll
{
    DatailViewController *datail = [[DatailViewController alloc]init];
    [self.navigationController pushViewController:datail animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    DouBanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DouBanTableViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    cell.cellImage.image = [UIImage imageNamed:@"yuan"];
    cell.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.nameLabel.numberOfLines = 0;
    [cell.nameLabel sizeToFit];
    cell.descritionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.descritionLabel.numberOfLines = 0;
    [cell.descritionLabel sizeToFit];
   return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DatailViewController *datail = [[DatailViewController alloc]init];
    [self.navigationController pushViewController:datail animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
