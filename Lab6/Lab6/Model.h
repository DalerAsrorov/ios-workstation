//
//  Model.h
//  Lab6
//
//  Created by Daler Asrorov on 11/20/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Creating the model
+ (instancetype) sharedModel;

- (NSUInteger) numberOfPlaces;


@end
