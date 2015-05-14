//
//  ViewController.m
//  hideleteme
//
//  Created by Johnny Chen on 4/29/15.
//  Copyright (c) 2015 JohnnyChen. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "List of Student.h"
#import "Controller.h"

@interface ViewController ()

@end

@implementation ViewController{
    //NSMutableArray *tempArray;
    //List_of_Student *ListToAddTo;
    Controller *test;
    Student *aStudent;
    NSMutableArray *list;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@",self.navigationController.viewControllers);
    
    //tempArray = [[NSMutableArray alloc] init];
    //ListToAddTo = [List_of_Student sharedInstance];
    test = [Controller sharedInstance];
    list = [test getList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToList:(UIButton *)sender {
    if ([self.studentNameTextField.text isEqualToString:@"" ]){
        //you have to enter valid name
    }
    else {
        Student *s = [[Student alloc] init];
        s.nameOfStudent = self.studentNameTextField.text;
        
        NSString *message = [NSString stringWithFormat:@"You are adding %@ to the list", s.nameOfStudent];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Add Item" message:message
            delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        [alert show];
        
        [list addObject:s];
        //[ListToAddTo addStudentToList:s];
        //ADD TO A LIST
        //[tempArray addObject:s];
        //for (Student *st in ListToAddTo)
         //   NSLog(@"%@",st.nameOfStudent);
    }
}

- (IBAction)goBack:(id)sender {
    if (![self.studentNameTextField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Pop View!" message:@"Are you sure?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
        [alert show];
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0 && [alertView.title isEqualToString: @"Pop View!"]) {
        /*
        UINavigationController *nav=(UINavigationController *)(AppDelegate *)
                                        [[UIApplication sharedApplication] delegate].window.rootViewController;
        ViewController *rootController=(ViewController *)[nav.viewControllers objectAtIndex:0];
        */
        
        //[self.navigationController.parentViewController popViewControllerAnimated:YES];
        [self.navigationController popViewControllerAnimated:YES];
        //this does the same
        //[self.navigationController popToRootViewControllerAnimated:YES];

    }
    //when you add student to list and press yes i wanna add, it also pops the view with is not what i want
    /*
     Change from
        if (buttonIndex==0)
            TO
        if (buttonIndex==0 && [alertView.title isEqualToString: @"Pop View!"]) {     
     */
    NSLog(@"%@",alertView.title);
}
@end
