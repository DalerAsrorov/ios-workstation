//
//  CreateViewController.h
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "NotesModel.h"

@interface CreateViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *desc;
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (weak, nonatomic) IBOutlet UIView *imagesBox;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *sectionPicker;
@property (weak, nonatomic) IBOutlet UIButton *resetInput;

@property (weak) UIAlertController * alert;

@property UIImagePickerController *selectedImagePicker;

- (void) styleManually;
- (void) addNewPhotoToList: (UIImage *) chosenImage;
- (void) addNote: (NSMutableArray *) photoListPointers;
- (void) storePhotosToGoogleStorage;
- (void) hideKeyboards;
- (void) showMessage: (NSString*)message withTitle:(NSString *)title;
- (void) clearAll;

- (IBAction)addNewImage:(id)sender;
- (IBAction)submitNote:(id)sender;
- (IBAction)resetButtonAction:(id)sender;

@end
