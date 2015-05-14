//
//  ViewController.h
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *studentNameTextField;

- (IBAction)addToList:(UIButton *)sender;

- (IBAction)goBack:(id)sender;

@end

