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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell: (Attribute*)attribute {
    _attributeNameLabel.text = attribute.name;
    
}

@end
