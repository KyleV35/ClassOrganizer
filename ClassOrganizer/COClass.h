//
//  Class.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class COSyllabus;

@interface COClass : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) COSyllabus *syllabus;

+ (id)createNewClassWithTitle:(NSString*)title;

@end
