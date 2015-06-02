//
//  ImageViewController.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/6/1.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "ImageViewController.h"
#import "DouBanClass.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DouBanClass *douban = self.douban;
    self.image.image = douban.movieImage;
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
