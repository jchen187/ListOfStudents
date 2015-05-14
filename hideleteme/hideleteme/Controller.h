//
//  Controller.h
//  hideleteme
//
//  Created by Johnny Chen on 4/30/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface Controller : NSObject

@property (nonatomic, strong) Student* trial;
@property (nonatomic, strong) NSMutableArray *listOfStudents;
@property (assign)int currentState;


+ (instancetype) sharedInstance;
- (void)saveState;
- (void)restoreState;
- (Student *) getStudent;
- (NSMutableArray *) getList;


@end
