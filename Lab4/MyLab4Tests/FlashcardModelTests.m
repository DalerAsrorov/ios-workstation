//
//  FlashcardModelTests.m
//  Lab4
//
//  Created by Daler Asrorov on 10/13/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlashcardsModel.h"

@interface FlashcardModelTests : XCTestCase
@property (strong, nonatomic) FlashcardsModel *model;

@end

@implementation FlashcardModelTests

- (void)setUp {
    [super setUp];
    _model = [FlashcardsModel sharedModel];
  
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// tests whether adding flashcard changes its size
- (void) testAddFlashcard {
    Flashcard *card = [[Flashcard alloc] initWithQuestion: @"Who is the CEO of Facebook?" answer: @"Mark Zuckerberg." isFavorite: true];
    NSUInteger prevNumFlashcards = _model.numberOfFlashcards;
    [_model insertWithQuestion: card.question answer:card.answer favorite: card.isFavorite];
    NSUInteger nextNumFlashcards = _model.numberOfFlashcards;
    XCTAssertNotEqual(prevNumFlashcards, nextNumFlashcards);
}

// tests whether if a new flashcard object
// can have the same question
- (void) testEqualQuestion {
    Flashcard *card = [[Flashcard alloc] initWithQuestion: @"Who's the first person to land on the moon?" answer: @"Whatever" isFavorite: true];
    XCTAssertEqualObjects([_model flashcardAtIndex:2].question, card.question);
}

// tests whether if a new flashcard object
// can have the same answer
- (void) testEqualAnswer {
    Flashcard *card = [[Flashcard alloc] initWithQuestion: @"Who's the first person to land on the moon?" answer: @"Neil Armstrong" isFavorite: true];
    XCTAssertEqualObjects([_model flashcardAtIndex:2].answer, card.answer);
}

// tests if initialized mutable array
// has the first element as favorite
// as it is in the init method
- (void) testNewFavorites {
    XCTAssertEqual([_model flashcardAtIndex:0].isFavorite, true);
}

// tests if toggleFavorites method changes
// current favorite status of the flashcard
- (void) testToggleFavorites {
    [_model flashcardAtIndex:2];
    [_model toggleFavorite];
    Flashcard *flashcardThree = [_model flashcardAtIndex:2];
    XCTAssertEqual(flashcardThree.isFavorite, true);
}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
