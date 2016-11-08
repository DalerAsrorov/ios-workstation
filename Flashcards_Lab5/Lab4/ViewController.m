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
    
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initializing model
    model = [FlashcardsModel sharedModel];
    
    NSLog(@"loading ");
    
    Flashcard *randomFlashcard = [model randomFlashcard];
    _questionLabel.text = randomFlashcard.question;
    _answerShown = false;
    
    self.leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:) ];
    self.rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:) ];
    self.leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: self.leftSwipeGesture];
    [self.view addGestureRecognizer: self.rightSwipeGesture];
    
    _singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doSingleTap:)];
    _singleTap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:_singleTap];
    
    _doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doDoubleTap:)];
    _doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:_doubleTap];
    
    [_singleTap requireGestureRecognizerToFail:_doubleTap];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![model numberOfFlashcards]) {
        _questionLabel.text = @"";
        _singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doSingleTapNoCards:)];
        _singleTap.numberOfTapsRequired = 1;
        [self.view addGestureRecognizer:_singleTap];
        _doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doDoubleTapNoCards:)];
        _doubleTap.numberOfTapsRequired = 2;
        [self.view addGestureRecognizer:_doubleTap];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleSwipes: (UISwipeGestureRecognizer *) sender {
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"\nSwiped left, current index %i\n", model.currentIndex);
        
        if(model.currentIndex == model.numberOfFlashcards - 1) {
            _questionLabel.text = [model flashcardAtIndex:0].question;
        } else {
            _questionLabel.text = model.nextFlashcard.question;
        }
        
    }
    if(sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        if(model.currentIndex == 0) {
            _questionLabel.text = [model flashcardAtIndex:model.numberOfFlashcards - 1].question;
        } else {
            _questionLabel.text = model.prevFlashcard.question;
        }
    }
}

- (void) doSingleTapNoCards: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        _questionLabel.text = @"There are no more flashcards.";
        _questionLabel.textColor = [UIColor colorWithRed: (153.0f/255.0f) green: 0.0 blue: 0.0 alpha: 1.0];
    }
}

- (void) doDoubleTapNoCards: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        _questionLabel.text = @"Please add some flashcards.";
        _questionLabel.textColor = UIColor.whiteColor;
    }
}

- (void) doDoubleTap: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        Flashcard *curFlash = [model flashcardAtIndex: model.currentIndex];
        NSLog(@"Start animating fade out and fade in.");
        NSLog(@"Boolean value is %i", _answerShown);
        
        if(_answerShown == false) {
            NSLog(@"\n should show answer");
            [self animateFadeOut: curFlash.answer];
            _answerShown = true;
        } else if (_answerShown == true) {
            NSLog(@"\n should show question");
            [self animateFadeOut: curFlash.question];
            _answerShown = false;
            
        }
    }
}

- (void) doSingleTap: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        _questionLabel.text = [model randomFlashcard].question;
    }
}

- (void) animateFadeIn: (NSString *) str {
    _questionLabel.text = str;
    
    // switch colors
    if(_questionLabel.textColor == UIColor.blackColor || _questionLabel.textColor == UIColor.whiteColor) {
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

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSLog(@"View controller %@", viewController);
    
    if (viewController == [tabBarController selectedViewController]) {
        
        NSLog(@"somewhere now");
        return NO;
    }
    NSLog(@"somewhere now");
    
    return YES;
}

@end
