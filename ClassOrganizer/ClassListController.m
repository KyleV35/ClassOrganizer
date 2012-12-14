//
//  ClassListController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "ClassListController.h"
#import "ClassViewController.h"
#import "COClass.h"
#import "AppDelegate.h"

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
    self.title = @"Class List";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString* title = [objects objectAtIndex:indexPath.row];
    ClassViewController* classVC = [[ClassViewController alloc]initWithClass:title];
    [self.navigationController pushViewController:classVC animated:YES];
    
}

- (IBAction)addButtonPressed:(UIBarButtonItem *)sender {
    UIAlertView* nameInputAlert = [[UIAlertView alloc] initWithTitle:@"Add New Class" message:@"Name of new class:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Create", nil];
    nameInputAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [nameInputAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==1) {
        NSString* classTitle= [alertView textFieldAtIndex:0].text;
        addClass(classTitle);
    }
}

- (void) addClass:(NSString*)title
{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"COClass" inManagedObjectContext:context];
    COClass* class = [[COClass alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:context];
    
}

@end
