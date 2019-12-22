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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell: (Program*)program {
    
    _programNameLabel.text = program.name;
}


@end
