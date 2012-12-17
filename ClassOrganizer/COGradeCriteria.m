//
//  COGradeCriteria.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/14/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "COGradeCriteria.h"
#import "COSyllabus.h"
#import "CODB.h"


@implementation COGradeCriteria

@dynamic key;
@dynamic percentWeight;
@dynamic syllabus;

+(id)createCOGradeCriteriaWithKey:(NSString*)key PercentWeight:(double)weight
{
    COGradeCriteria *gradeCriteria = [[CODB sharedInstance] makeCOGradeCriteria];
    gradeCriteria.key = @"Tests";
    gradeCriteria.percentWeight = [[NSDecimalNumber alloc] initWithDouble:100.0];
    return gradeCriteria;
}

@end
