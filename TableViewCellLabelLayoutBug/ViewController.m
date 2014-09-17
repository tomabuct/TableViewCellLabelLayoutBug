//
//  ViewController.m
//  TableViewCellLabelLayoutBug
//
//  Created by Tom Abraham on 9/16/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "ViewController.h"

#import "TableViewCell.h"

static NSString *const kCell = @"cell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (instancetype)init {
  if (self = [super init]) {
    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:kCell];
    _tableView.delegate = self;
    _tableView.dataSource = self;
  }
  return self;
}

- (void)loadView {
  self.view = self.tableView;
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TableViewCell *const cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
  cell.textLabel.text = [@"" stringByPaddingToLength:indexPath.row + 1 withString:@"h" startingAtIndex:0];
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 100;
}

@end
