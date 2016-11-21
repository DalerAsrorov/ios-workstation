//
//  AddViewController.m
//  Lab4
//
//  Created by Daler Asrorov on 11/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//
//
//  Used 3-day extension for this assignment.
//
//
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
    _saveButton.enabled = false;

}

- (void) hideKeyboards {
    [_textField resignFirstResponder];
    [_textView resignFirstResponder];
}

- (void) nullAllText {
    _textView.text = @"";
    _textField.text = @"";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_textField resignFirstResponder];
    [_textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) enableSaveButton: (NSString *) questionText answer: (NSString *) answerText {
    _saveButton.enabled = (questionText.length > 0 && answerText.length > 0);
}

- (BOOL) textField: (UITextField *) textField shouldChangeCharactersInRange: (NSRange) range replacementString: (NSString *) string {
    NSString *changeString = [textField.text stringByReplacingCharactersInRange: range withString: string];
    [self enableSaveButton: self.textView.text answer: changeString];
    
    //
    return YES;
    
}

- (IBAction)saveButtonTapped:(id)sender {
    [self hideKeyboards];
    
    NSLog(@"textFieldShouldReturn returned...");
    
    if(self.flashcardCompletionHandler) {
        NSLog(@"question %@, and answer %@", _textView.text, _textField.text);
        _flashcardCompletionHandler(_textView.text, _textField.text);
    }

    [self nullAllText];
}
- (IBAction)cancelButtonTapped:(id)sender {
    [self hideKeyboards];
    

    if(self.flashcardCompletionHandler) {
        self.flashcardCompletionHandler(nil, nil);
    }

    [self nullAllText];
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    [self hideKeyboards];
    
    if(self.flashcardCompletionHandler) {
        NSLog(@"question %@, and answer %@", _textView.text, _textField.text);
        _flashcardCompletionHandler(_textView.text, _textField.text);
    }
    
    NSLog(@"textFieldShouldReturn returned...");
    [self nullAllText];
    
    return YES;
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
