//
//  TrendsModel.m
//  TTURLRequestModelSample
//
//  Created by Savanah Cummings on 3/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <extThree20JSON/extThree20JSON.h>
#import "TrendsModel.h"


@implementation TrendsModel

@synthesize trends = _trends;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc {
  TT_RELEASE_SAFELY(_trends);
  [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
  if (!self.isLoading) {

    NSString * urlString = @"http://api.twitter.com/1/trends/current.json";

    TTDPRINT(@"loading %@", urlString);
    TTURLRequest* request = [TTURLRequest
                             requestWithURL: urlString
                             delegate: self];

    // We want to always immediately render from the local cache,
    // but also make the request to the network,
    // and if a different answer comes back, update
    request.cachePolicy = cachePolicy | TTURLRequestCachePolicyReadThrough;
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;

    TTURLJSONResponse* response = [[TTURLJSONResponse alloc] init];
    request.response = response;
    //TT_RELEASE_SAFELY(response);

    [request send];
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(TTURLRequest*)request {

  TTURLJSONResponse* response = request.response;
  TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);

  NSDictionary* root = response.rootObject;
  TTDASSERT([[root objectForKey:@"trends"] isKindOfClass:[NSDictionary class]]);

  NSArray * trends = [[[root objectForKey:@"trends"] allValues] objectAtIndex:0];

  //! For brevity, omitting a whole class here -- sic 20110316
  // You might choose to use a "real" data model here, mapping this array of dictionaries
  // to a full fledged obj-c class, likely that class has a constructor that takes a dictionary of attributes.
  // Since we're just passing this to the cell class, which is in on the game,
  // we'll just pass the dictionaries across
  self.trends = [trends mutableCopy];
  TT_RELEASE_SAFELY(trends);

  [super requestDidFinishLoad:request];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error
{
  TTDPRINT(@"URL error response: %@", error);
  [super request:request didFailLoadWithError:error];
}

@end
