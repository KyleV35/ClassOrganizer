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

@interface COSyllabus : NSManagedObject

@property (nonatomic, retain) COClass *curClass;

@end