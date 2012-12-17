//
//  Syllabus.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/14/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class COClass;
@class COGradeCriteria;

@interface COSyllabus : NSManagedObject

@property (nonatomic, retain) COClass *curClass;
@property (nonatomic, retain) NSSet* gradeCriteria;

- (void)addGradeCriteriaObject:(COGradeCriteria *)object;
- (void)removeGradeCriteriaObject:(COGradeCriteria *)object;

+(id)createCOSyllabusWithClass:(COClass*)class;
-(void)addGradeCriteriaWithKey:(NSString*)key PercentWeight:(double)weight;

@end
