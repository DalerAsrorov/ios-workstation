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

@property (nonatomic, strong) UISwipeGestureRecognizer* leftSwipeGesture;
@property (nonatomic, strong) UISwipeGestureRecognizer* rightSwipeGesture;
@property (nonatomic, strong) UISwipeGestureRecognizer* doubleTap;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

// helper methods
- (void) animateFadeIn: (NSString *) str;
- (void) animateFadeOut: (NSString *) str;

@end

