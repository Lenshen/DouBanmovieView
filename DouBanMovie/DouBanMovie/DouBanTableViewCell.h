//
//  DouBanTableViewCell.h
//  DouBanMovie
//
//  Created by 鲍先生 on 15/5/31.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DouBanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descritionLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
