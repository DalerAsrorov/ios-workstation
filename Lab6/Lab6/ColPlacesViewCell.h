//
//  ColPlacesViewCell.h
//  Lab6
//
//  Created by Daler Asrorov on 11/20/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColPlacesViewCell : UICollectionViewCell<UITextViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *placeImg;
@property (weak, nonatomic) IBOutlet UILabel *placeNameLabel;

- (void) setUpCell: (NSDictionary *) placeDict;

@end


