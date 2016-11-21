//
//  ViewController.h
//  Lab4
//
//  Used 3-day extension for this assignment.
//
//
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//
//
//

#import <UIKit/UIKit.h>
#import "FlashcardsModel.h"

static int counter = 0;

@interface ViewController : UIViewController <UITabBarControllerDelegate>

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
- (void) doSingleTapNoCards: (UITapGestureRecognizer *) sender;
- (void) doDoubleTapNoCards: (UITapGestureRecognizer *) sender;

@end

