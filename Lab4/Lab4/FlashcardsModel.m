//
//  FlashcardsModel.m
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "FlashcardsModel.h"

@interface FlashcardsModel()

@property (nonatomic, strong) NSMutableArray *flashcards;
@property (readwrite) unsigned int currentIndex;

@end

@implementation FlashcardsModel

- (instancetype) init {
    if(self = [super init]) {
        Flashcard *card1 = [Flashcard initWithQuestion: @"Is Objective-C object-oriented Language?"
                                                        answer: @"Yes"];
        Flashcard *card2 = [Flashcard initWithQuestion: @"What's 2 times 2?"
                                                answer: @"4"];
        Flashcard *card3 = [Flashcard initWithQuestion: @"Who's the first person to land on the moon?"
                                                answer: @"Neil Armstrong"];
        Flashcard *card4 = [Flashcard initWithQuestion: @"Are Swift and Objective-C both created by Apple?"
                                                answer: @"No."];
        Flashcard *card5 = [Flashcard initWithQuestion: @"What's the first programming language I learned?"
                                                answer: @"Java"];
        
        _flashcards = [[NSMutableArray alloc] initWithObjects: card1, card2, card3, card4, card5, nil];
        _currentIndex = 0;
    }
    
    return self;
}


@end
