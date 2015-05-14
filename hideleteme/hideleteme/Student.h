//
//  Student.h
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>
//NSCoding is the protocol that supports encoding and decoding

@property (nonatomic,strong) NSString* nameOfStudent;

- (NSString *) getName;
- (void)encodeWithCoder:(NSCoder *) encode;
- (id) initWithCoder:(NSCoder *) decode;

@end
