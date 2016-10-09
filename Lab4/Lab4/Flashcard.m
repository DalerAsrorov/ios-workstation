//
//  Flashcard.m
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "Flashcard.h"

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
    
}

+ (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav
{

}


@end
