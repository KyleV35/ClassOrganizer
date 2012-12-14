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

@interface CODB : NSObject

+ (CODB*)sharedInstance;
- (COClass*) makeCOClass;
- (NSArray*) getCOClasses;
- (void)saveContext;

@end
