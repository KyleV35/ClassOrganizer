//
//  CODB.m
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/13/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import "CODB.h"
#import "AppDelegate.h"

#import "COClass.h"
#import "COSyllabus.h"
#import "COGradeCriteria.h"

@implementation CODB {
    NSManagedObjectContext* _moc;
}

static CODB* _sharedInstance;


+(CODB*)sharedInstance
{
    @synchronized(self) {
        if (!_sharedInstance) {
            _sharedInstance = [[CODB alloc] init];
        }
        return _sharedInstance;
    }
}

- (id)init
{
    if (self = [super init]) {
        _moc = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    return self;
}


-(COClass*)makeCOClass
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"COClass" inManagedObjectContext:_moc];
    COClass* class = [[COClass alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_moc];
    return class;
}

- (NSArray*)getCOClasses
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"COClass"
                                                         inManagedObjectContext:_moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    NSError* error;
    NSArray *array = [_moc executeFetchRequest:request error:&error];
    return array;
}

- (COSyllabus*)makeCOSyllabus
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"COSyllabus" inManagedObjectContext:_moc];
    COSyllabus* syllabus = [[COSyllabus alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_moc];
    return syllabus;
}

- (COGradeCriteria*)makeCOGradeCriteria
{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"COGradeCriteria" inManagedObjectContext:_moc];
    COGradeCriteria* gradeCriteria = [[COGradeCriteria alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:_moc];
    return gradeCriteria;
}

- (void)saveContext
{
    NSError *error = nil;
    if (_moc != nil) {
        if ([_moc hasChanges] && ![_moc save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
@end
