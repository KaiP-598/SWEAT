//
//  AttributeListCell.m
//  SWEAT
//
//  Created by WuKaipeng on 23/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "AttributeListCell.h"
#import "ProgramAttribute.h"

@implementation AttributeListCell

double percentage;

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    // border radius
    [_shadowView.layer setCornerRadius:5.0f];
    
    // border
    [_shadowView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_shadowView.layer setBorderWidth:0.2f];
    
    // border radius
    [_colouredView.layer setCornerRadius:5.0f];
    
    // border
    [_colouredView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_colouredView.layer setBorderWidth:0.2f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell: (Attribute*)attribute {
    
    _attributeNameLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14];
    _attributeNameLabel.text = attribute.name;
    
    double value = [attribute.value doubleValue];
    double total = [attribute.total doubleValue];
    percentage = value / total;
    [self configureColouredViewWidth];
}

- (void)configureColouredViewWidth{
    double viewWidth = _shadowView.bounds.size.width;
    _colouredViewWidthConstraint.constant = viewWidth * percentage;
}

- (void)prepareForReuse{
    _colouredViewWidthConstraint.constant = 0;
    percentage = 0;
    [super prepareForReuse];
}

@end
