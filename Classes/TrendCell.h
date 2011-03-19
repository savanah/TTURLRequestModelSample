//
//  TrendCell.h
//  TTURLRequestModelSample
//
//  Created by Savanah Cummings on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import "Three20UI/TTTableViewCell.h"

@interface TrendCell : TTTableViewCell {
  UILabel* _trendLabel;
  NSDictionary * _trendObject;
}

@property (nonatomic, retain) NSDictionary * trendObject;
@property (nonatomic, retain) UILabel * trendLabel;

@end
