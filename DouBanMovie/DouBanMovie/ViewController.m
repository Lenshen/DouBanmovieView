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
#import "AFNetworking.h"
#import "DouBanClass.h"

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
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.91 green:0.08 blue:0.52 alpha:0.0];
    
    self.navigationItem.title = @"豆瓣最新电影";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(viewlook)];
    self.navigationItem.rightBarButtonItem = rightButton;

    UINib *nib = [UINib nibWithNibName:@"DouBanTableViewCell" bundle:nil];
    [self.tabView registerNib:nib forCellReuseIdentifier:@"DouBanTableViewCell"];
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
  

    [self loadReview];

    
  
}
-(void)viewlook
{
    DatailViewController *datail = [[DatailViewController alloc]init];
    [self.navigationController pushViewController:datail animated:YES];
    
}
-(void) loadReview
{
    self.json = [[NSArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *getURL = @"http://api.themoviedb.org/3/movie/now_playing?api_key=e55425032d3d0f371fc776f302e7c09b";
    
    [manager GET:getURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if (responseObject)
         {
             NSArray *objectsFromResponse = responseObject[@"results"];
             NSMutableArray *arrayM = [[NSMutableArray alloc]init];
             for (int i = 0; i < [objectsFromResponse count]; i++)
             {
                 NSDictionary *dic= [[NSDictionary alloc]init];
                dic = objectsFromResponse[i];
                DouBanClass *douban = [[DouBanClass alloc]initWithDictionary:dic];
                 [arrayM addObject:douban];
                 
             }
             self.json = [arrayM copy];
             [self.tabView reloadData];

             
             NSLog(@"%@",objectsFromResponse);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@  %@",operation,error);
     }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.json.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    DouBanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DouBanTableViewCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = 20;
    cell.layer.masksToBounds = YES;
    
    
    
    //背景图片颜色
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lin.jpg"]];
    backgroundImage.alpha = 1;
    cell.backgroundView = backgroundImage;
//    
    DouBanClass *douban = self.json[indexPath.row];
    cell.nameLabel.text = douban.movieName;
    [cell.nameLabel sizeToFit];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@",douban.movieDate ];
    cell.movieScoreLabel.text = [NSString stringWithFormat:@"%.1f",douban.movieScore];
    
    cell.cellImage.image = douban.movieImage;

    
    
    
    
    //图片设置边框有弧度
    cell.cellImage.layer.cornerRadius = 20;
    cell.cellImage.layer.masksToBounds = YES;
    
    cell.nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.nameLabel.numberOfLines = 0;
    [cell.nameLabel sizeToFit];
  
   return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DatailViewController *datail = [[DatailViewController alloc]init];
    datail.douban = self.json[indexPath.row];
  
    [self.navigationController pushViewController:datail animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
