//
//  GradeingCriteriaEditorView.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/17/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradingCriteriaEditorView : UIView

@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;
@property (strong, nonatomic) IBOutlet UISlider *categorySlider;
@property (strong, nonatomic) IBOutlet UILabel *categoryValueLabel;

@end
