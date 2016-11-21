//
//  ColPlacesViewCell.m
//  Lab6
//
//  Created by Daler Asrorov on 11/20/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "ColPlacesViewCell.h"
#import "Model.h"

@implementation ColPlacesViewCell 

- (void) setUpCell:(NSDictionary *) placeDict {
    NSString *name =  placeDict[@"name"];
    NSString *img = placeDict[@"image"];
    
    _placeImg.image = [UIImage imageNamed:img];
    _placeNameLabel.text = name;
}

@end
