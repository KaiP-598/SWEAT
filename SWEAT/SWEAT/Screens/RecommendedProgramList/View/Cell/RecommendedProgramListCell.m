//
//  RecommendedProgramListCell.m
//  SWEAT
//
//  Created by Kaipeng Wu on 20/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "RecommendedProgramListCell.h"
#import "Program.h"
#import <SDWebImage/SDWebImage.h>
#import "ProgramAttribute.h"
#import "AttributeListCell.h"
#import "TagCell.h"

@implementation RecommendedProgramListCell

NSArray *programAttributeArray;
NSArray *tagsArray;

- (void)layoutIfNeeded{
    [super layoutIfNeeded];
    [_attributeTableView reloadData];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_attributeTableView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // border radius
    [_containerView.layer setCornerRadius:6.0f];
    
    // border
    [_containerView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_containerView.layer setBorderWidth:0.2f];
    
    // drop shadow
   // [_containerView.layer setShadowColor:[UIColor grayColor].CGColor];
    [_containerView.layer setShadowOpacity:0.5];
    [_containerView.layer setShadowRadius:1.0];
    [_containerView.layer setShadowOffset:CGSizeMake(0.0, 1.0)];
    
    UINib *nib = [UINib nibWithNibName:@"AttributeListCell" bundle:nil];
    [self.attributeTableView registerNib:nib forCellReuseIdentifier:@"AttributeListCell"];
    
    UINib *collectionViewNib = [UINib nibWithNibName:@"TagCell" bundle:nil];
    [self.collectionView registerNib:collectionViewNib forCellWithReuseIdentifier:@"TagCell.h"];
    
    self.attributeTableView.delegate = self;
    self.attributeTableView.dataSource = self;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell: (Program*)program {
    
    _programNameLabel.text = program.name;
    _trainerNameLabel.text = [NSString stringWithFormat:@"with %@", program.trainer.name];
    
    //Trainer image
    NSString *imageUrl = program.trainer.imageUrl;
    [_programImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    //Sweat drop
    NSArray *programAttributes = program.attributes;
    if (programAttributes.count > 0){
        Attribute *attribute = programAttributes[0];
        if ([attribute.codeName  isEqual: @"intensity"]){
            double value = [attribute.value doubleValue];
            if (value == 1){
                _sweatDropImageOne.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
            } else if (value == 2){
                _sweatDropImageOne.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
                _sweatDropImageTwo.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
                
            } else if (value == 3){
                _sweatDropImageOne.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
                _sweatDropImageTwo.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
                _sweatDropImageThree.image = [UIImage imageNamed:@"sweat-drop-filled.png"];
            }
        }
        
        if (programAttributes.count > 1){
            programAttributeArray = [programAttributes subarrayWithRange:NSMakeRange(1, programAttributes.count - 1)];
            
            [self configureAttributeList:programAttributeArray];
        }
    }
    
    //Tags
    tagsArray = program.tags;
    [self configureTagList];

}

- (void)configureAttributeList: (NSArray*)attributes {
    NSLog(@"array count %lu",(unsigned long)programAttributeArray.count);
    [_attributeTableView reloadData];
    _tableViewHeightConstraint.constant = programAttributeArray.count * 50;
}

- (void)configureTagList{
    [_collectionView reloadData];
    [_collectionView layoutIfNeeded];
    _collectionViewHeight.constant = _collectionView.contentSize.height;
}



- (void)prepareForReuse{
    _sweatDropImageOne.image = [UIImage imageNamed:@"sweat-drop.png"];
    _sweatDropImageTwo.image = [UIImage imageNamed:@"sweat-drop.png"];
    _sweatDropImageThree.image = [UIImage imageNamed:@"sweat-drop.png"];
    [super prepareForReuse];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return programAttributeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"AttributeListCell";
    
    AttributeListCell *cell = [self.attributeTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Attribute *attribute = programAttributeArray[indexPath.row];
    [cell configureCell:attribute];
    [cell layoutIfNeeded];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return tagsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TagCell.h" forIndexPath:indexPath];
    return cell;
}


@end
