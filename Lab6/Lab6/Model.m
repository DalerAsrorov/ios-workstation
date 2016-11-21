//
//  Model.m
//  Lab6
//
//  Created by Daler Asrorov on 11/20/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (nonatomic, strong) NSMutableArray *places;

@end

@implementation Model

-(instancetype) init {
    if(self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource: @"places" ofType:@"plist"];
        _places = [[NSMutableArray alloc] initWithContentsOfFile:path];
        
        NSLog(@"Objects %@", _places);
        
    }
    
    return self;
}

@end
