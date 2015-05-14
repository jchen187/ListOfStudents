//
//  Trial.m
//  hideleteme
//
//  Created by Johnny Chen on 5/7/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import "Trial.h"
#import "AppDelegate.h"
#import "TableViewController.h"

@interface Trial ()

@end

@implementation Trial

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"%@",self.navigationController.viewControllers);
    NSLog(@"hi %@",self.navigationController.topViewController);
    //returns only Trial doesnt see the table view controller
    
    //AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    //[del.navigationController pushViewController:<#(UIViewController *)#> animated:YES];
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(backButtonClicked)];
    self.navigationItem.leftBarButtonItem = backButton;
    //[self.navigationItem setRightBarButtonItem:backButton];
    //self.navigationController.navigationBar.topItem.rightBarButtonItem = backButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonClicked{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Pop View!" message:@"Are you sure?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        //[self.navigationController popViewControllerAnimated:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
        /*
        UIStoryboard *storyboard = self.window.rootViewController.storyboard;
        UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"start"];
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
         */
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
