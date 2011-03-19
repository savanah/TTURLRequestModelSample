//
//  TrendsViewController.m
//  TTURLRequestModelSample
//
//  Created by Savanah Cummings on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Three20UICommon/UIViewControllerAdditions.h"
#import "TrendsViewController.h"
#import "TrendsModel.h"
#import "TrendCell.h"

@implementation TrendsViewController

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIViewController
- (void)viewDidLoad {

  TTListDataSource * dataSource = [[[TTListDataSource alloc] init] autorelease];
	dataSource.model = [[[TrendsModel alloc] init] autorelease];
  // Other Three20 samples have an "item" class that seems only there
  // to help the datasource identify a cell class for a model
  // Instead we can instruct this off the shelf datasource
  // what cell should be used to render its items
  NSString * className = NSStringFromClass([[NSMutableDictionary dictionary] class]);
  [dataSource setCellClass:NSStringFromClass([TrendCell class]) forItemClass:className];

  self.dataSource = dataSource;
  [super viewDidLoad];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)modelDidFinishLoad:(id<TTModel>)model {
  ((TTListDataSource*)self.dataSource).items = ((TrendsModel*)model).trends;
  [super modelDidFinishLoad:model];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSObject

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    self.title = NSLocalizedString(@"Trends", @"");

    self.tableViewStyle = UITableViewStylePlain;
    self.variableHeightRows = NO;
  }
  return self;
}

@end
