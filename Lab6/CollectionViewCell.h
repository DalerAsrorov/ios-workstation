//
//  CollectionViewCell.h
//  Lab6
//
//  Created by Daler Asrorov on 11/21/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic) int dice;
//@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
//@property (weak, nonatomic) IBOutlet UILabel *placeName;
@property (weak, nonatomic) IBOutlet UIImageView *placeImage;
@property (weak, nonatomic) IBOutlet UILabel *placeName;

- (void) setUpCell: (NSDictionary *) dict;

@end
