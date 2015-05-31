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
    UINib *nib = [UINib nibWithNibName:@"DouBanTableViewCell" bundle:nil];
    [self.tabView registerNib:nib forCellReuseIdentifier:@"DouBanTableViewCell"];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    DouBanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DouBanTableViewCell" forIndexPath:indexPath];
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
