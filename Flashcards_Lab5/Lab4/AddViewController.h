//
//  AddViewController.h
//  Lab4
//
//  Created by Daler Asrorov on 11/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end
