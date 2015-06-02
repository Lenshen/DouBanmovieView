//
//  DouBanClass.m
//  DouBanMovie
//
//  Created by 鲍先生 on 15/6/1.
//  Copyright (c) 2015年 鲍先生. All rights reserved.
//

#import "DouBanClass.h"

@implementation DouBanClass
-(instancetype)initWithDictionary : (NSDictionary *)dict
{
    self = [super init];
    if (self)
    {
        self.movieName = dict[@"original_title"];
        self.movieDate = dict[@"release_date"];
        self.movieScore = [dict[@"vote_average"] floatValue];
        self.postPath = dict[@"poster_path"];
        NSString *URL1 = [NSString stringWithFormat:@"http://image.tmdb.org/t/p/w342%@",self.postPath];
        NSURL *posterURL = [NSURL URLWithString:URL1];
        NSMutableData *posterData = [NSMutableData dataWithContentsOfURL:posterURL];
        self.movieImage = [UIImage imageWithData:posterData];
    
        
        
        
    }
    return self;
}


@end
