//
//  Class.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/12/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "COClass.h"
#import "CODB.h"
#import "COSyllabus.h"


@implementation COClass

@dynamic title;
@dynamic syllabus;

+ (id)createNewClassWithTitle:(NSString *)title
{
    COClass* class= [[CODB sharedInstance] makeCOClass];
    COSyllabus * syllabus = [[CODB sharedInstance] makeCOSyllabus];
    class.syllabus= syllabus;
    syllabus.curClass = class;
    class.title= title;
    return class;
}

@end
