//
//  COGradeCriteria.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/14/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class COSyllabus;

@interface COGradeCriteria : NSManagedObject

@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSDecimalNumber * percentWeight;
@property (nonatomic, retain) COSyllabus *syllabus;

@end
