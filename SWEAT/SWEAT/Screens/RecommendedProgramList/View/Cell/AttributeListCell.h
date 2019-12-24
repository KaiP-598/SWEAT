//
//  AttributeListCell.h
//  SWEAT
//
//  Created by WuKaipeng on 23/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramAttribute.h"

NS_ASSUME_NONNULL_BEGIN

@interface AttributeListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *attributeNameLabel;
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *colouredView;

- (void)configureCell: (Attribute*)attribute;

@end

NS_ASSUME_NONNULL_END
