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
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
