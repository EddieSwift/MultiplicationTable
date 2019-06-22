//
//  MultiplicationTableViewController.m
//  MultiplicationTable
//
//  Created by Eduard Galchenko on 6/18/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "MultiplicationTableViewController.h"
#import "MultiplicationGroup.h"

@interface MultiplicationTableViewController ()

@property (strong, nonatomic) NSMutableArray *multiplicationArray;

@end

@implementation MultiplicationTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self fillTable];
}

- (void) fillTable {
    
    self.multiplicationArray = [NSMutableArray array];
    
    for (int i = 2; i < 10; i++) {
        
        MultiplicationGroup *group = [[MultiplicationGroup alloc] init];
        group.name = [NSString stringWithFormat:@"Multiplication Group x%d", i];
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (int multiplier = 2; multiplier < 10; multiplier++) {
            
            NSString *string = [NSString stringWithFormat:@"%d x %d = %d", i, multiplier, multiplier * i];
            
            [array addObject:string];
        }
        
        group.multiplications = array;
        
        [self.multiplicationArray addObject:group];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.multiplicationArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    MultiplicationGroup *group = [self.multiplicationArray objectAtIndex:section];
    
    return [group.multiplications count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    MultiplicationGroup *group = [self.multiplicationArray objectAtIndex:section];
    
    return group.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    MultiplicationGroup *group = [self.multiplicationArray objectAtIndex:indexPath.section];
    
    NSString *multiplicationString = [group.multiplications objectAtIndex:indexPath.row];
    
    cell.textLabel.text = multiplicationString;
    
    return cell;
}

@end
