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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *dict = [self readJSONFromFile];
    NSLog(@"%@", dict);
    NSArray *programs = [Program objectFromDictionary:dict];
    NSLog(@"%@", programs);
    Program *program1 = programs[0];
    NSLog(@"%@", program1.tags.dictionary);
    
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
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"RecommendedProgramListCell";
    
    RecommendedProgramListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.programNameLabel.text = @"123";
    return cell;
}

@end
