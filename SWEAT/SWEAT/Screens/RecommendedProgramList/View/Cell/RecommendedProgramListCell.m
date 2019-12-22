//
//  RecommendedProgramListCell.m
//  SWEAT
//
//  Created by Kaipeng Wu on 20/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "RecommendedProgramListCell.h"
#import "Program.h"

@implementation RecommendedProgramListCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // border radius
    [_containerView.layer setCornerRadius:6.0f];
    
    // border
    [_containerView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_containerView.layer setBorderWidth:0.5f];
    
    // drop shadow
   // [_containerView.layer setShadowColor:[UIColor grayColor].CGColor];
    [_containerView.layer setShadowOpacity:0.5];
    [_containerView.layer setShadowRadius:1.0];
    [_containerView.layer setShadowOffset:CGSizeMake(0.0, 1.0)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell: (Program*)program {
    
    _programNameLabel.text = program.name;
}


@end
