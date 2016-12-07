//
//  CreateViewController.m
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "CreateViewController.h"

@interface CreateViewController ()

@property NSArray *pickerData;

@end

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self styleManually];
    
    // Connect data
    self.sectionPicker.dataSource = self;
    self.sectionPicker.delegate = self;
    
    self.pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) styleManually {
    self.textView.layer.cornerRadius = 5.0;
    self.textView.clipsToBounds = YES;
    [self.textView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.textView.layer setBorderWidth:2.0];
    
}

/*
 * Once user clicks button, 
 * it will show him the image picker.
 */

- (IBAction)addNewImage:(id)sender {
     self.selectedImagePicker = [[UIImagePickerController alloc] init];
     self.selectedImagePicker.delegate = self;
     self.selectedImagePicker.allowsEditing = YES;
     self.selectedImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController: self.selectedImagePicker animated:YES completion:NULL];
    
}

- (IBAction)submitNote:(id)sender {
}



- (void) imagePickerControllerDidCancel:(UIImagePickerController *) picker {
    NSLog(@"~~~~WARNING: The user cancelled notes uplad.");
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *) thePicker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImageView *customImageView = [[UIImageView alloc] initWithFrame: CGRectMake (90, 70, 100, 60)];
    customImageView.image = chosenImage;
    
    [self.imagesBox addSubview: customImageView];
    
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
    
}


// The number of columns of data
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.pickerData[row];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
