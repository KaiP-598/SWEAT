//
//  Program.h
//  SWEAT
//
//  Created by Kaipeng Wu on 19/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <OCMapper.h>
#import "ProgramAttribute.h"
#import "Trainer.h"
#import "ProgramTag.h"

@interface Program : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *acronym;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSMutableArray *attributes;
@property (nonatomic, strong) Trainer *trainer;
@property (nonatomic, strong) NSMutableArray *tags;

@end
