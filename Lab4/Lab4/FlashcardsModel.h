//
//  FlashcardsModel.h
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"

@interface FlashcardsModel : NSObject

@property (readonly) unsigned int currentIndex;

// Creating the model
+ (instancetype) sharedModel;

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger)index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;

// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans;
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                     favorite: (NSNumber *) fav
                     atIndex: (NSUInteger) index;

// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;

// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;

// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;

@end


