//
//  List of Student.m
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import "List of Student.h"

@implementation List_of_Student{
    NSUserDefaults *defaults;
}

+ (instancetype)sharedInstance{
    //strucuture used to test whether the block has completed
    static dispatch_once_t p = 0;
    
    //initialize sharedobject as nil
    __strong static id _sharedObject = nil;
    
    //execute block object once and only once
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (instancetype)init{
    self = [super init];
    
    if (self){
        defaults = [NSUserDefaults standardUserDefaults];
        Student *testStudent = [[Student alloc] init];
        testStudent.nameOfStudent = @"ben";
        NSMutableArray *test = [[NSMutableArray alloc] initWithObjects:testStudent, nil];
        
        //[defaults setObject:test forKey:@"StudentList"];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:test];
        [defaults setObject:data forKey:@"StudentList"];

        
        /*
         NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:@"uniqueEncodingKey"];
         [defaults setObject:encodedObject forKey:@"uniqueEncodingKey"];
         */
    }
    
    return self;
}

- (void)addStudentToList:(Student *)s{
     //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSMutableArray *tempList = [[NSMutableArray alloc] initWithArray: [defaults objectForKey:@"StudentList"]];
     [tempList addObject:s];
     [defaults setObject:tempList forKey:@"StudentList"];
     [defaults synchronize];
    
}

@end
