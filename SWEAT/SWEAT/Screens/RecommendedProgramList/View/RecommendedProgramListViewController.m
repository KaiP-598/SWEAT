//
//  ViewController.m
//  SWEAT
//
//  Created by WuKaipeng on 18/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "RecommendedProgramListViewController.h"
#import "Program.h"
#import "RecommendedProgramListCell.h"

@interface RecommendedProgramListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *recommendedLabel;

@end

@implementation RecommendedProgramListViewController

NSMutableArray* programs;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Place Logo at navigation bar
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sweat-logo.png"]];
    
    _recommendedLabel.font = [UIFont fontWithName:@"Montserrat-Bold" size:20];
    _recommendedLabel.text = @"Recommended for you";
    
    
    //Read JSON file
    NSDictionary *dict = [self readJSONFromFile];
    NSMutableArray *programsFromJson = [Program objectFromDictionary:dict];

    programs = programsFromJson;
    
    UINib *nib = [UINib nibWithNibName:@"RecommendedProgramListCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RecommendedProgramListCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated{
   // [self.tableView reloadData];
    [super viewDidAppear: YES];
    [self.tableView reloadData];
}

- (NSDictionary *)readJSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"trainer-programs" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return programs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"RecommendedProgramListCell";
    
    RecommendedProgramListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Program *program = programs[indexPath.row];
    [cell configureCell:program];
    [cell layoutSubviews];
    [cell layoutIfNeeded];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
