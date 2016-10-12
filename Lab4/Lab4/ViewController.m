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
    [self.view addGestureRecognizer:oneTapGesture];
    
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
        Flashcard *card = [model flashcardAtIndex:
                           model.currentIndex];
        _questionLabel.text = card.answer;
    }
}

- (void) handleOneTap: (UITapGestureRecognizer *) sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        Flashcard *card = [model randomFlashcard];
        _questionLabel.text = card.question;
    }
}




@end
