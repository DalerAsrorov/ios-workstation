//
//  ViewController.m
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    FlashcardsModel *model;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initializing model
    model = [FlashcardsModel sharedModel];
    Flashcard *randomFlashcard = [model randomFlashcard];
    NSString * currentQuestion = randomFlashcard.question;
    NSString * currentAnswer = randomFlashcard.answer;
    _questionLabel.text = currentQuestion;
    
    
    self.leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:) ];
    self.rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:) ];
    

    
    self.leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoTaps:)];
    tapGesture.numberOfTapsRequired = 2;
    
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleOneTap:)];
    tapGesture.numberOfTapsRequired = 1;
    
    
    [self.view addGestureRecognizer: self.leftSwipeGesture];
    [self.view addGestureRecognizer: self.rightSwipeGesture];
    [self.view addGestureRecognizer:tapGesture];
//    [self.view addGestureRecognizer:oneTapGesture];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleSwipes: (UISwipeGestureRecognizer *) sender {
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        _questionLabel.text = model.prevFlashcard.question;
    }
    if(sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        _questionLabel.text = model.nextFlashcard.question;
    }
}

- (void) handleTwoTaps: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        Flashcard *curFlash = [model flashcardAtIndex: model.currentIndex];
        [self animateFadeOut: curFlash.question];
        [self animateFadeIn: curFlash.answer];
    }
}

- (void) handleOneTap: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        Flashcard *card = [model randomFlashcard];
        
        
        
    }
}

- (void) animateFadeIn: (NSString *) str {
    _questionLabel.text = str;
    
    // switch colors
    if(_questionLabel.textColor == UIColor.blackColor) {
        _questionLabel.textColor = [UIColor colorWithRed: (153.0f/255.0f) green: 0.0 blue: 0.0 alpha: 1.0];
    } else {
        _questionLabel.textColor = UIColor.blackColor;
    }
    
    // proceed with animation
    [UIView animateWithDuration: 2.0
        animations:^{
            _questionLabel.alpha = 1;
    }];
}

- (void) animateFadeOut:(NSString *) str {
    [UIView animateWithDuration: 2.0
        animations:^{
            // Fade out the old text of label
            _questionLabel.alpha = 0;
        }
        completion:^(BOOL finished) {
            // Upon completion, call animateFadeIn
            [self animateFadeIn: str];
        }
    ];
}

@end
