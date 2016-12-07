//
//  CreateViewController.h
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate> 

@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *imagesBox;
@property (weak, nonatomic) IBOutlet UIPickerView *sectionPicker;

- (void) styleManually;

@end
