//
//  COSyllabusViewController.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/17/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class COSyllabus;

@interface COSyllabusViewController : UIViewController <UIScrollViewDelegate>

- (id)initWithSyllabus:(COSyllabus*)syllabus;

@end
