//
//  ClassListController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "ClassListController.h"
#import "ClassViewController.h"
#import "CODB.h"
#import "AppDelegate.h"

#import "COClass.h"

@interface ClassListController () {
    NSMutableArray* _classes;
}

@end

@implementation ClassListController

@synthesize tableView = _tableView;

- (id)init
{
    if (self = [super init]) {
        _classes = [[[CODB sharedInstance] getCOClasses] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Class List";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    // Deselects previous selection
    NSIndexPath* selection = [self.tableView indexPathForSelectedRow];
	if (selection)
		[self.tableView deselectRowAtIndexPath:selection animated:YES];
	[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_classes count];
}

#pragma mark TableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger index = indexPath.row;
    
    COClass* class= [_classes objectAtIndex:index];
    cell.textLabel.text = class.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    COClass *class= [_classes objectAtIndex:indexPath.row];
    ClassViewController* classVC = [[ClassViewController alloc]initWithClass:class];
    [self.navigationController pushViewController:classVC animated:YES];
    
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==1) {
        NSString* classTitle= [alertView textFieldAtIndex:0].text;
        [self addClass:classTitle];
    }
}

#pragma mark Helper Functions

- (void) addClass:(NSString*)title
{
    COClass* class= [COClass createNewClassWithTitle:title];
    [[CODB sharedInstance] saveContext];
    [_classes addObject:class];
    [self.tableView reloadData];
}

- (void)addButtonPressed {
    UIAlertView* nameInputAlert = [[UIAlertView alloc] initWithTitle:@"Add New Class" message:@"Name of new class:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Create", nil];
    nameInputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [nameInputAlert show];
}

@end
