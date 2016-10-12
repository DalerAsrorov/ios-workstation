//
//  Flashcard.m
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "Flashcard.h"

@interface Flashcard ()

@property (readwrite) NSString * question;
@property (readwrite) NSString * answer;

@end


@implementation Flashcard

//- (instancetype) init: (Flashcard *) obj {
//    if (self = [super initWithFrame:CGRectZero]) {
//        obj = obj;
//        // do the majority of initializing things
//    }
//    return self;
//}

- (instancetype) initWithQuestion:(NSString *)question
                           answer:(NSString *)ans
{
    self = [super init];
    if (self) {
        _answer = ans;
        _question = question;
        _isFavorite = NO;
    }
    return self;
}


- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav
{
    self = [super init];
    if (self) {
        _answer = ans;
        _question = question;
        _isFavorite = isFav;
    }
    return self;
}


@end
