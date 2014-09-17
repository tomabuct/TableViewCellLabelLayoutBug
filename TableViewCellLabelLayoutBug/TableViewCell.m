//
//  TableViewCell.m
//  TableViewCellLabelLayoutBug
//
//  Created by Tom Abraham on 9/16/14.
//  Copyright (c) 2014 Tom Abraham. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (strong, nonatomic) UILabel *secondaryLabel;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if ([super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
    self.textLabel.layer.borderColor = [UIColor redColor].CGColor;
    self.textLabel.layer.borderWidth = 0.5;
    
    _secondaryLabel = [[UILabel alloc] init];
    _secondaryLabel.text = @"5";
    _secondaryLabel.layer.borderColor = [UIColor redColor].CGColor;
    _secondaryLabel.layer.borderWidth = 0.5;
    [self.contentView addSubview:_secondaryLabel];
    
    [self _installConstraints];
  }
  return self;
}

- (void)_installConstraints {
  NSDictionary *const views = @{ @"textLabel": self.textLabel, @"secondaryLabel": self.secondaryLabel };
                                
  self.secondaryLabel.translatesAutoresizingMaskIntoConstraints = NO;
  [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[textLabel]-[secondaryLabel]"
                                                                           options:NSLayoutFormatAlignAllBaseline
                                                                          metrics:nil views:views]];
}

- (void)layoutSubviews {
  [super layoutSubviews];
}

@end
