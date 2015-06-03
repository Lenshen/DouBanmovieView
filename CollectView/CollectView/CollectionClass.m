//
//  CollectionClass.m
//  CollectView
//
//  Created by 鲍先生 on 15/6/3.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "CollectionClass.h"


@implementation CollectionClass
-(void)initWithDictionary:(NSDictionary *)dic
{
    self.movieName = dic[@"original_title"];
    self.movieDate = dic[@"release_date"];
    self.moviescore = [dic[@"vote_average"]floatValue];
    self.descrition = dic[@"overview"];
    
    
    NSString *postPath = dic[@"poster_path"];
    NSString *URL = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w342%@",postPath];
    NSURL *url1 = [NSURL URLWithString:URL];
    NSMutableData *postData = [NSMutableData dataWithContentsOfURL:url1];
    self.image = [UIImage imageWithData:postData];
    
}

@end
