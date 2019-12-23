//
//  RecommendedProgramListCell.h
//  SWEAT
//
//  Created by Kaipeng Wu on 20/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Program.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommendedProgramListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *programNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *programImageView;
@property (weak, nonatomic) IBOutlet UILabel *trainerNameLabel;



- (void)configureCell: (Program*)program;

@end

NS_ASSUME_NONNULL_END
