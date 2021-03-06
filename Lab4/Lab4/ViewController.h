//
//  ViewController.h
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashcardsModel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property BOOL answerShown;

@property (strong) UISwipeGestureRecognizer* leftSwipeGesture;
@property UISwipeGestureRecognizer* rightSwipeGesture;
@property UITapGestureRecognizer *tapGesture;


@property  UITapGestureRecognizer *singleTap;
@property  UITapGestureRecognizer *doubleTap;

// helper methods
- (void) animateFadeIn: (NSString *) str;
- (void) animateFadeOut: (NSString *) str;
- (void) doSingleTap: (UITapGestureRecognizer *) sender;
- (void) doDoubleTap: (UITapGestureRecognizer *) sender;

@end

