//
//  Student.m
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *) getName{
    return self.nameOfStudent;
}

//These methods are necessary because NSUserDefaults only store certain items and custom objects are not one of them
- (void)encodeWithCoder:(NSCoder *) coder{
    [coder encodeObject:self.nameOfStudent forKey:@"nameKey"];
}

- (id) initWithCoder:(NSCoder *) coder{
    self = [super init];
    if (self != nil){
        self.nameOfStudent = [coder decodeObjectForKey:@"nameKey"];
    }
    return self;
}

@end
