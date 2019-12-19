//
//  ProgramAttribute.h
//  SWEAT
//
//  Created by Kaipeng Wu on 19/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper.h>

@interface Attribute: NSObject
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *total;
@end
