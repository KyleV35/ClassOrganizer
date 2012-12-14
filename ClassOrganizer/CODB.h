//
//  CODB.h
//  ClassOrganizer
//
//  Created by Kyle Vermeer on 12/13/12.
//  Copyright (c) 2012 Kyle Vermeer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CODB : NSObject

@property (nonatomic, strong) NSPersistentStoreCoordinator* dataStore;

@end
