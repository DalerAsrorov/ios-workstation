//
//  Flashcard.h
//  Lab4
//
//  Created by Daler Asrorov on 10/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject

@property (strong, nonatomic, readonly) NSString * question;
@property (strong, nonatomic, readonly) NSString * answer;
@property BOOL isFavorite;

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav;

@end
