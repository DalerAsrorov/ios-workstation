//
//  CollectionViewCell.m
//  Lab6
//
//  Created by Daler Asrorov on 11/21/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setUpCell: (NSDictionary *) dict {
    NSString *imageUrl = dict[@"image"];
    NSString *name = dict[@"name"];
    
    _placeName.text = name;
    _placeImage.image = [UIImage imageNamed: imageUrl];
}

@end
