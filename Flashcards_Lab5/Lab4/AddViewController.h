//
//  AddViewController.h
//  Lab4
//
//  Created by Daler Asrorov on 11/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddFlashcardCompletionHandler) (NSString *question, NSString *answer);

@interface AddViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigation;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (copy, nonatomic) AddFlashcardCompletionHandler flashcardCompletionHandler;


- (void) enableSaveButton: (NSString *) questionText answer: (NSString *) answerText;

@end

