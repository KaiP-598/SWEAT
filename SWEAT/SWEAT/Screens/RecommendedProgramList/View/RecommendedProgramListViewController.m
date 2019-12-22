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

@end

@implementation RecommendedProgramListViewController

NSMutableArray* programs;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dict = [self readJSONFromFile];
    NSMutableArray *programsFromJson = [Program objectFromDictionary:dict];

    programs = programsFromJson;
    
    
    UINib *nib = [UINib nibWithNibName:@"RecommendedProgramListCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RecommendedProgramListCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    return cell;
}

@end
