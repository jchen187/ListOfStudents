//
//  AppDelegate.h
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic,readonly,retain) UINavigationController *navigationController;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

