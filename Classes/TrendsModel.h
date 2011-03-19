//
//  TrendsModel.h
//  TTURLRequestModelSample
//
//  Created by Savanah Cummings on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>


@interface TrendsModel : TTURLRequestModel {
	NSMutableArray * _trends;
}

@property (nonatomic, retain) NSMutableArray* trends;

@end
