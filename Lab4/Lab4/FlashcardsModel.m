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
        // creating 5 Flashcard class instances.
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
        
        // placing the 5 created objects into mutable array
        _flashcards = [[NSMutableArray alloc] initWithObjects: card1, card2, card3, card4, card5, nil];
        
        // setting current index to 0
        _currentIndex = 0;
    }
    
    return self;
}

// Creating the model
+ (instancetype) sharedModel {
    static FlashcardsModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         _sharedModel = [[FlashcardsModel alloc] init];
    });
    
    return _sharedModel;
}

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards {
    return [self.flashcards count];
}

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard {
    // Assigns number between 0 and self.flaschards.count - 1
    NSInteger randomNum = arc4random_uniform((uint32_t) self.flashcards.count);
    
    return self.flashcards[randomNum];
}

- (Flashcard *) flashcardAtIndex: (NSUInteger)index {
    if(index > (self.flashcards.count - 1)) {
        NSLog(@"Wrong index. Should be between 0 and 4");
        return nil;
    }
    
    return self.flashcards[index];
}

- (Flashcard *) nextFlashcard {
    NSUInteger currentIndex = self.currentIndex;
    if(currentIndex == self.flashcards.count - 1) {
        NSLog(@"This is the last element of the array. No next nodes.");
        return nil;
    }
    
    return self.flashcards[currentIndex + 1];
}

- (Flashcard *) prevFlashcard {
    NSUInteger currentIndex = self.currentIndex;
    if(currentIndex == 0) {
        NSLog(@"This is the first element of the array. No previous nodes.");
        return nil;
    }
    
    return self.flashcards[currentIndex - 1];
}


// Inserting a flashcard without index.
// Add flashcard to the end of the array.
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                     favorite: (BOOL) fav {
    Flashcard *newFlashcard = [Flashcard initWithQuestion: question answer: ans isFavorite: fav];
    [self.flashcards addObject: newFlashcard];
}

// Inserting a flashcard at index.
// Add flashcard at the specified index of the array.
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (NSNumber *) fav
                    atIndex: (NSUInteger) index {
    if(!(index <= self.flashcards.count)) {
        NSLog(@"index is bigger than the number of flashcards in the array.");
    }
    
    Flashcard *newFlashcard = [Flashcard initWithQuestion: question answer: ans isFavorite: fav];
    [self.flashcards insertObject:newFlashcard atIndex:index];
}

// Removing a flashcard without index.
// Remove last flashcard from the array.
- (void) removeFlashcard {
    [self.flashcards removeLastObject];
}

// Removing a flashcard with an index.
// Remove flashcard at the specified index of the array.
- (void) removeFlashcardAtIndex: (NSUInteger) index {
    if(index < self.flashcards.count) {
        [self.flashcards removeObjectAtIndex: index];
    } else {
        NSLog(@"Something is wrong with the index %lu", (unsigned long)index);
    }
}

// Favorite/unfavorite the current flashcard
-(void) toggleFavorite {
    NSUInteger currentIndex = self.currentIndex;
    NSUInteger counterIndex = 0;
    for(Flashcard *flash in self.flashcards) {
        if(currentIndex == counterIndex) {
            if(flash.isFavorite == true) {
                ((Flashcard*)[self.flashcards objectAtIndex:currentIndex]).isFavorite = false;
            } else {
                ((Flashcard*)[self.flashcards objectAtIndex:currentIndex]).isFavorite = true;
            }
        }
        counterIndex++;
    }
    
}


- (NSArray *) favoriteFlashcards {
    NSArray * arrayOfFlashcards = [NSArray array];
    NSMutableArray * tempMutArray = [NSMutableArray array];
    
    for(Flashcard *flashcard in self.flashcards) {
        if (flashcard.isFavorite) {
            [tempMutArray addObject: flashcard];
        }
    }
    
    arrayOfFlashcards = [tempMutArray copy];
    
    return arrayOfFlashcards;
}






@end
