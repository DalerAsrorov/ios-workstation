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

static int buttnCounter;
static int defaultWidth;
static int defaultHeight;
static int dynamicX;
static int dynamicY;
static int xNextLocationBuffer;

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self styleManually];
    
    // Connect data
    self.sectionPicker.dataSource = self;
    self.sectionPicker.delegate = self;
    self.pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    
    
    // initializing static variables
    buttnCounter = 0;
    dynamicX = 0;
    dynamicY = 0;
    
    defaultWidth = 40;
    defaultHeight = 50;
    xNextLocationBuffer = 10;
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
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *) thePicker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImageView *customImageView = [[UIImageView alloc] initWithFrame: CGRectMake (dynamicX, dynamicY, defaultWidth, defaultHeight)];
    customImageView.image = chosenImage;
    
    [self.imagesBox addSubview: customImageView];
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
    

    
    
    NSData *imageData = UIImagePNGRepresentation(chosenImage);
    NSString *fileName = [chosenImage accessibilityIdentifier];
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@", imageData, fileName];
    
    // create reference to storage
    FIRStorage *storage = [FIRStorage storage];
    
    // Create a storage reference from our storage service
    FIRStorageReference *storageRef = [storage referenceForURL:@"gs://capnote-36deb.appspot.com"];
    
    // Create a reference to the file you want to upload
    FIRStorageReference *imagesRef = [storageRef child:@"image.png"];
    
    // Upload the file to the path "images/rivers.jpg"
    
    FIRStorageUploadTask *uploadTask = [imagesRef putData:imageData metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
        if (error != nil) {
            // Uh-oh, an error occurred!
            NSLog(@"Uploaded file succesfully");
        } else {
            // Metadata contains file metadata such as size, content-type, and download URL.
            NSURL *downloadURL = metadata.downloadURL;
            NSLog(@"Downloads url %@", downloadURL);
        }
    }];
    
    
    
    // increament cyrrent X coordinate for the next picked image
    dynamicX += defaultWidth + xNextLocationBuffer;
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
