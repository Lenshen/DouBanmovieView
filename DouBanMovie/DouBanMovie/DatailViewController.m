//
//  DatailViewController.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "DatailViewController.h"
#import "DouBanClass.h"
#import "ImageViewController.h"'
#import "ViewController.h"

@interface DatailViewController ()

@end

@implementation DatailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DouBanClass *douban = self.douban;
    
    self.backgroundView.image =  [UIImage imageNamed:@"b.jpg"];
    
    self.detialImage.image = douban.movieImage;
    self.movieName.text = douban.movieName;
    self.movieName.lineBreakMode = NSLineBreakByCharWrapping;
    self.movieName.numberOfLines = 0;
    self.descirtionLable.text = douban.movieDescrition;
    self.descirtionLable.lineBreakMode = NSLineBreakByCharWrapping;
    self.descirtionLable.numberOfLines = 0;
    
    self.moviewTime.text= [NSString stringWithFormat:@"%@",douban.movieDate ];
    self.moviewScore.text = [NSString stringWithFormat:@"%.1f",douban.movieScore];
    self.detialImage.layer.cornerRadius = 20;
    self.detialImage.layer.masksToBounds = YES;
    
    

    
}
- (IBAction)addViewBotto:(UIButton *)sender
{
  
    ImageViewController *image = [[ImageViewController alloc]init];
    ViewController *v = [[ViewController alloc]init];
    image.douban = v.json[v.index];
    [self.navigationController pushViewController:image animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
