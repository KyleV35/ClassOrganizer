//
//  ClassViewController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "ClassViewController.h"

#import "COClass.h"

@interface ClassViewController () {
    __weak IBOutlet UILabel *_classNameLabel;
    COClass* _curClass;
}
    
@end

@implementation ClassViewController

- (id)initWithClass:(COClass *)curClass
{
    if (self = [super init]) {
        self.title = @"Class";
        _curClass = curClass;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _classNameLabel.text = _curClass.title;
    UIBarButtonItem *addSyllabusButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit Syllabus" style:UIBarButtonItemStylePlain target:self action:@selector(editSyllabusButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addSyllabusButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editSyllabusButtonPressed:(id)sender
{
    NSLog(@"Edit Syllabus Button Pressed");
}

@end
