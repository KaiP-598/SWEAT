//
//  TagCell.h
//  SWEAT
//
//  Created by WuKaipeng on 25/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramTag.h"

NS_ASSUME_NONNULL_BEGIN

@interface TagCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

- (void)configureCell: (Tag*)tag ;

@end

NS_ASSUME_NONNULL_END
