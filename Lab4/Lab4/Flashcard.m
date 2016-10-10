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

+ (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
{
    Flashcard *flash = [[Flashcard alloc] init:nil];
    flash.answer = ans;
    flash.question = question;
    return flash;
    
}

+ (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav
{
    Flashcard *flash = [[Flashcard alloc] init:nil];
    flash.answer = ans;
    flash.question = question;
    flash.isFavorite = isFav;
    return flash;
}


@end
