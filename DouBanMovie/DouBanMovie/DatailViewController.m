//
//  DatailViewController.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "DatailViewController.h"
#import "DouBanClass.h"
#import "ImageViewController.h"

@interface DatailViewController ()

@end

@implementation DatailViewController
- (IBAction)addViewBotto:(UIButton *)sender
{
    ImageViewController *image = [[ImageViewController alloc]init];
    [self.navigationController pushViewController:image animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.detialImage.image = [UIImage imageNamed:@"yuan"];
    self.detialImage.layer.cornerRadius = 20;
    self.detialImage.layer.masksToBounds = YES;
    
    
    DouBanClass *douban = self.douban;
    

    
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
