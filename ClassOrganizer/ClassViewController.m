//
//  ClassViewController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "ClassViewController.h"

#import "COClass.h"
#import "COSyllabus.h"

#import "COSyllabusViewController.h"

@interface ClassViewController () {
    __weak IBOutlet UILabel *classNameLabel;
    COClass* curClass_;
    __weak IBOutlet UILabel *gradeLetterLabel;
    __weak IBOutlet UILabel *gradePercentLabel;
    __weak IBOutlet UITableView *syllabusTable;
    NSArray* _gradeCriteria;
}
    
@end

@implementation ClassViewController

- (id)initWithClass:(COClass *)curClass
{
    if (self = [super init]) {
        self.title = @"Class";
        curClass_ = curClass;
        _gradeCriteria = [curClass_.syllabus.gradeCriteria allObjects];
        NSLog(@"Grade Criteria Count: %d",[_gradeCriteria count]);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    classNameLabel.text = curClass_.title;
    UIBarButtonItem *addSyllabusButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit Syllabus" style:UIBarButtonItemStylePlain target:self action:@selector(editSyllabusButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addSyllabusButton;
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
    return [_gradeCriteria count];
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
    
    cell.textLabel.text = [[_gradeCriteria objectAtIndex:index] key];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark Button Functions

- (IBAction)editSyllabusButtonPressed:(id)sender
{
    COSyllabusViewController* viewController = [[COSyllabusViewController alloc] initWithSyllabus:curClass_.syllabus];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
