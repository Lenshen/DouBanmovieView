//
//  ImageViewController.h
//  DouBanMovie
//
//  Created by 鲍先生 on 15/6/1.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DouBanClass;
@interface ImageViewController : UIViewController
@property (nonatomic,strong)DouBanClass *douban;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
