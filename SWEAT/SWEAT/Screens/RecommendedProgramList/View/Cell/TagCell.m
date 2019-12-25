//
//  TagCell.m
//  SWEAT
//
//  Created by WuKaipeng on 25/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "TagCell.h"
#import "ProgramTag.h"

@implementation TagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.layer setCornerRadius:4.0f];
    
    // border
    [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.layer setBorderWidth:0.5f];
}

- (void)configureCell: (Tag*)tag {
    _tagLabel.text = tag.name;
}

@end
