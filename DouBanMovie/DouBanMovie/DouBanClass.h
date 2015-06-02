//
//  DouBanClass.h
//  DouBanMovie
//
//  Created by 鲍先生 on 15/6/1.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DouBanClass : NSObject
@property (nonatomic , strong)UIImage *movieImage;
@property (nonatomic , strong)NSString *movieName;
@property (nonatomic , strong)NSString *postPath;
@property (nonatomic , assign)float movieScore;
@property (nonatomic , strong)NSString *movieDescrition;
@property (nonatomic , strong)NSDate *movieDate;
-(instancetype)initWithDictionary : (NSDictionary *)dict;


@end
