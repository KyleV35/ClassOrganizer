//
//  CODB.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/13/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class COClass;
@class COSyllabus;

@interface CODB : NSObject

+ (CODB*)sharedInstance;
- (void)saveContext;

- (COClass*) makeCOClass;
- (NSArray*) getCOClasses;

- (COSyllabus*) makeCOSyllabus;

@end
