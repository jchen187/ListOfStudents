//
//  List of Student.h
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface List_of_Student : NSMutableArray

+ (instancetype)sharedInstance;
- (void)addStudentToList:(Student *)s;

//MIGHT NOT BE USING THIS CLASS

@end
