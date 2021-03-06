//
//  DatailViewController.h
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "DouBanClass.h"



@interface DatailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *moviewTime;
@property (weak, nonatomic) IBOutlet UILabel *moviewScore;

@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *viewButton;
@property (strong, nonatomic) IBOutlet UIImageView *detialImage;
@property (weak, nonatomic) IBOutlet UILabel *descirtionLable;
@property (weak, nonatomic) DouBanClass *douban;

@end
