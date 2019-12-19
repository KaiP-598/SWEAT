//
//  ViewController.m
//  SWEAT
//
//  Created by WuKaipeng on 18/12/19.
//  Copyright © 2019 WuKaipeng. All rights reserved.
//

#import "RecommendedProgramListViewController.h"
#import "Program.h"

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
}

- (NSDictionary *)readJSONFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"trainer-programs" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
