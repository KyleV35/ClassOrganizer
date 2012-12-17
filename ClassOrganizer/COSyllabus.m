//
//  Syllabus.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/14/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "COSyllabus.h"

#import "COClass.h"
#import "CODB.h"
#import "COGradeCriteria.h"


@implementation COSyllabus

@dynamic curClass;
@dynamic gradeCriteria;

+ (id)createCOSyllabusWithClass:(COClass *)class
{
    COSyllabus* syllabus = [[CODB sharedInstance] makeCOSyllabus];
    syllabus.curClass = class;
    return syllabus;
}

- (void)addGradeCriteriaWithKey:(NSString *)key PercentWeight:(double)weight
{
    COGradeCriteria *criteria = [COGradeCriteria createCOGradeCriteriaWithKey:key PercentWeight:weight];
    [self addGradeCriteriaObject:criteria];
    criteria.syllabus = self;
}

@end
