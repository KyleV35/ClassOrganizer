//
//  GradingCriteriaEditorView.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/17/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "GradingCriteriaEditorView.h"

@implementation GradingCriteriaEditorView

- (id)init
{
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"GradingCategoryEditorView"
                                                      owner:self
                                                    options:nil];
    GradingCriteriaEditorView* myView = [ nibViews objectAtIndex: 0];
    return myView;
}


@end
