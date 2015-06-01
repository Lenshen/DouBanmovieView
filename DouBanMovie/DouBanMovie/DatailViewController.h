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
@property (weak, nonatomic) IBOutlet UIButton *viewButton;
@property (weak, nonatomic) IBOutlet UIImageView *detialImage;
@property (weak, nonatomic) DouBanClass *douban;

@end
