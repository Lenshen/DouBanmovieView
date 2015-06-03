//
//  ViewController.m
//  CollectView
//
//  Created by 鲍先生 on 15/6/3.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "AFNetworking.h"
#import "CollectionClass.h"
#import "DatailViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic ,strong)UICollectionView *colloctionView;
@property (nonatomic ,strong)NSArray *json;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"d.jpg"]];
    self.title = @"最新电影";
   
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(150, 245);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.colloctionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [self.view addSubview:_colloctionView];
    
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.colloctionView registerNib:nib
          forCellWithReuseIdentifier:@"CollectionViewCell"];
    self.colloctionView.delegate = self;
    self.colloctionView.dataSource =self;
    [self lookReview];
    
}
-(void)lookReview
{
    self.json = [[NSArray alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *getURL =@"http://api.themoviedb.org/3/movie/now_playing?api_key=e55425032d3d0f371fc776f302e7c09b";
    [manager GET:getURL parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSMutableArray *arrayM = [[NSMutableArray alloc]init];

        if (responseObject)
            
        {
            NSArray *resposeArray = [[NSArray alloc]init];
            resposeArray = responseObject[@"results"];
            for (int i = 0; i < [resposeArray count]; i++)
            {
                NSDictionary *dict = [[NSDictionary alloc]init];
                
                dict = resposeArray[i];
                
                
                CollectionClass *class1 = [[CollectionClass alloc]init];
                [class1 initWithDictionary:dict];
                [arrayM addObject:class1];

            }
            
        }
        self.json = [arrayM copy];
        NSLog(@"%@",responseObject);
        [self.colloctionView reloadData];

        
    }

     failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
    }];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.json.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    CollectionClass *class2 = self.json[indexPath.row];
    cell.cellImage.image = class2.image;
    return cell;
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DatailViewController *datial = [[DatailViewController alloc]init];
    datial.douban = self.json[indexPath.row];
    [self.navigationController pushViewController:datial animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
