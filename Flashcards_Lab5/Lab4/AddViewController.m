//
//  AddViewController.m
//  Lab4
//
//  Created by Daler Asrorov on 11/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Additions
    [_textView setDelegate: self];
    [_textField setDelegate: self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textViewDidBeginEditing:(UITextView *) textView {
    
    NSLog(@"did begin editing");
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
