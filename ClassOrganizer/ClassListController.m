//
//  ClassListController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "ClassListController.h"

@interface ClassListController () {
    NSMutableArray* objects;
}

@end

@implementation ClassListController

- (id)init
{
    if (self = [super init]) {
        objects = [[NSMutableArray alloc] init];
        NSString* stringA = @"Cat";
        NSString* stringB = @"Dog";
        NSString* stringC = @"Person";
        [objects addObject:stringA];
        [objects addObject:stringB];
        [objects addObject:stringC];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [objects count];
}

// TableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger index = indexPath.row;
    
    // Configure the cell...
    cell.textLabel.text = [objects objectAtIndex:index];
    
    return cell;
}

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    [objects addObject:@"New Item"];
    [self.ClassListTableView reloadData];
}

@end
