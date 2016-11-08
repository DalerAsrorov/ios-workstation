//
//  Flashcard.h
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>

// constants
static NSString * const kQuestionKey = @"question";
static NSString * const kAnswerKey = @"answer";
static NSString * const kFavKey = @"fav";
static NSString * const kFavoriteYes = @"yes";
static NSString * const kFavoriteNo = @"no";

@interface Flashcard : NSObject

@property (strong, nonatomic, readonly) NSString * question;
@property (strong, nonatomic, readonly) NSString * answer;
@property BOOL isFavorite;

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav;

// public properties
// public methods
- (instancetype) initWithDictionary: (NSDictionary *) card;
- (NSDictionary *) dictionary;

@end
