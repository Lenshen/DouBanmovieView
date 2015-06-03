//
//  CollectionClass.h
//  CollectView
//
//  Created by 鲍先生 on 15/6/3.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CollectionClass : NSObject
@property (nonatomic , strong)UIImage *image;
@property (nonatomic , strong)NSString *movieName;
@property (nonatomic , assign)float moviescore;
@property (nonatomic ,strong)NSDate *movieDate;
@property (nonatomic ,strong)NSString *descrition;


-(void)initWithDictionary:(NSDictionary *)dic;
@end
