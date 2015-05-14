//
//  Controller.m
//  hideleteme
//
//  Created by Johnny Chen on 4/30/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import "Controller.h"

@implementation Controller{
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
        /*
         if you only do self.trial.nameOfStudent = @"ben",
         you will get nothing because you did not allocate memory
         */
        self.trial = [[Student alloc] init];
        self.trial.nameOfStudent = @"Ben";
        self.listOfStudents = [[NSMutableArray alloc] init];
        [self.listOfStudents addObject:self.trial];
        NSLog(@"%@",self.listOfStudents);
    
    }
    
    return self;
}


- (void)saveState{
    //NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    NSData* StudentData = [NSKeyedArchiver archivedDataWithRootObject:self.trial];
    [defaults setObject:StudentData forKey:@"Student"];
    
    //add to list and then call save state
    NSData* listData = [NSKeyedArchiver archivedDataWithRootObject:self.listOfStudents];
    [defaults setObject:listData forKey:@"listData"];
    
    [defaults setInteger:self.currentState forKey:@"CurrentState"];
}

- (void)restoreState{
    //NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    NSData* StudentData = [defaults objectForKey:@"Student"];
    self.trial = [NSKeyedUnarchiver unarchiveObjectWithData:StudentData];
    
    NSData* listData = [defaults objectForKey:@"listData"];
    NSArray* savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:listData];
    if (savedArray != nil){
        self.listOfStudents = [[NSMutableArray alloc] initWithArray:savedArray];
    }
    else{
        self.listOfStudents = [[NSMutableArray alloc] init];
    }
    
    self.currentState = [defaults integerForKey:@"CurrentState"];
}

- (Student *) getStudent{
    return self.trial;
}

- (NSMutableArray *)getList{
    return self.listOfStudents;
}

@end
