//
//  COSyllabusViewController.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/17/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "COSyllabusViewController.h"
#import "GradingCriteriaEditorView.h"
#import "COSyllabus.h"

#import "COGradeCriteria.h"

@interface COSyllabusViewController () {
    
    __weak IBOutlet UIScrollView *scrollView;
    COSyllabus* _syllabus;
    NSMutableArray* _gradingCriteria;
}

@end

@implementation COSyllabusViewController

- (id)initWithSyllabus:(COSyllabus*)syllabus
{
    self = [super init];
    if (self) {
        _syllabus= syllabus;
        _gradingCriteria = [[_syllabus.gradeCriteria allObjects] mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    scrollView.frame = [[UIScreen mainScreen] applicationFrame];
    [scrollView setContentSize:CGSizeMake(400, 800)];
    COGradeCriteria* criteria = [_gradingCriteria objectAtIndex:0];
    GradingCriteriaEditorView* view = [[GradingCriteriaEditorView alloc] init];
    view.categoryLabel.text = criteria.key;
    view.categorySlider.value = criteria.percentWeight.floatValue;
    view.categoryValueLabel.text = [NSString stringWithFormat:@"%f",criteria.percentWeight.floatValue];
    NSLog(@"Category Label: %@",view.categoryLabel.text);
    NSLog(@"Category Value: %@",view.categoryValueLabel.text);
    [scrollView addSubview:view];
    NSLog(@"Frame: %f,%f",view.frame.size.width,view.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
