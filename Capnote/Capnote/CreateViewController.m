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
@property NSMutableArray *photoList;
@property NSMutableArray *photoListPointer;
@property NotesModel *notesModel;

@end

static int buttnCounter;
static int defaultWidth;
static int defaultHeight;
static int dynamicX;
static int dynamicY;
static int xNextLocationBuffer;
static NSString* tempUsername = @"dalerasrorov";

@implementation CreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self styleManually];
    
    // Connect data
    self.sectionPicker.dataSource = self;
    self.sectionPicker.delegate = self;
   
    // initialize vars
    self.pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    self.photoList = [NSMutableArray new];
    self.photoListPointer = [NSMutableArray new];
    self.notesModel = [[NotesModel alloc] init];
    

    // text stuff delegates
    [self.desc setDelegate: self];
    [self.titleTextField setDelegate: self];
    
    // picker initialize
    [self.sectionPicker selectRow:4 inComponent:0 animated:YES];
    
    // initializing static variables
    buttnCounter = 0;
    dynamicX = 0;
    dynamicY = 0;
    
    defaultWidth = 40;
    defaultHeight = 50;
    xNextLocationBuffer = 10;
}

- (void) clearAll {
    self.desc.text = @"";
    self.titleTextField.text = @"";
    
    [self.sectionPicker selectRow:4 inComponent:0 animated:YES];
    
    // removes images inside of the image view box
    NSArray *viewsToRemove = [self.imagesBox subviews];
    
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
    
    
}

- (void)showMessage: (NSString*) message withTitle:(NSString *)title {
    // @"Created Note!"
    
    // initialize success message box controller
    UIAlertController *alert = [UIAlertController
                  alertControllerWithTitle:@"Created note!"
                  message:message
                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle: title
                               style: UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [self clearAll];
                               }];
    
    
    [alert addAction:okButton];
    [self presentViewController: alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) styleManually {
    self.desc.layer.cornerRadius = 5.0;
    self.desc.clipsToBounds = YES;
    [self.desc.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [self.desc.layer setBorderWidth: 1.0];
    
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

- (void) addNote : (NSMutableArray *) photoListPointers {
    NSInteger index;
    NSString *noteSection;
    NSString *noteTitle = self.titleTextField.text;
    NSString *noteDescription = self.desc.text;
    NSString *noteAdder = tempUsername;
    
    index = [self.sectionPicker selectedRowInComponent:0];
    noteSection = [self.pickerData objectAtIndex: index];
    
    NSLog(@"photoList pointer: %@", self.photoListPointer);
    
    NSDictionary *postDict = @{@"adder" : noteAdder,
                           @"description" : noteDescription,
                           @"files" : photoListPointers,
                           @"section" : noteSection,
                           @"title" : noteTitle
                           };
    
    [self.notesModel addNote:postDict];
    
}

- (void) hideKeyboards {
    [self.titleTextField resignFirstResponder];
    [self.desc resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:TRUE];
}

- (void) storePhotosToGoogleStorage {
    unsigned int photoCounter = 0;
    
    for (UIImage* image in self.photoList) {
        NSData *imageData = UIImagePNGRepresentation(image);
        NSString *fileName = [image accessibilityIdentifier];
        NSString *imageKeyName = [self.notesModel generateKey];
        NSString* photoCounterStr = [NSString stringWithFormat:@"%i", photoCounter];
        NSString *imageKeyNameStr = [NSString stringWithFormat:@"images/%@-%@.png", imageKeyName, photoCounterStr];
        
        
        // create reference to storage
        FIRStorage *storage = [FIRStorage storage];
        
        // Create a storage reference from our storage service
        FIRStorageReference *storageRef = [storage referenceForURL:@"gs://capnote-36deb.appspot.com"];
        
        // Create a reference to the file you want to upload
        FIRStorageReference *imagesRef = [storageRef child:imageKeyNameStr];
        
        FIRStorageUploadTask *uploadTask = [imagesRef putData:imageData metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
            if (error != nil) {
                // Uh-oh, an error occurred!
                NSLog(@"Could not upload file %@", error);
            } else {
                [self showMessage:@"New note has been created." withTitle: @"OK"];
                // Metadata contains file metadata such as size, content-type, and download URL.
                NSURL *downloadURL = metadata.downloadURL;
                NSString *absolutePath = downloadURL.absoluteString;
                
                NSArray *subviews = self.imagesBox.subviews;
                [self.photoListPointer addObject: absolutePath];
                
                // if all images are uploaded, do the following
                if(subviews.count == self.photoListPointer.count) {
                    [self addNote : self.photoListPointer];
                }
                
            }
            
        }];
        
        photoCounter++;
        // Upload the file to the path "images/rivers.jpg"
    }
    
}

- (IBAction)submitNote:(id)sender {
    NSLog(@"List: %@", self.photoList);

    // stored pointers to URLs in self.photoListPointer
    [self storePhotosToGoogleStorage];
    
//    // construct a dict and add note
//    [self addNote];
}

- (IBAction)resetButtonAction:(id)sender {
    [self clearAll];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *) picker {
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) addNewPhotoToList: (UIImage *) chosenImage {
    [self.photoList addObject: chosenImage];
}

- (void)imagePickerController:(UIImagePickerController *) thePicker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    UIImageView *customImageView = [[UIImageView alloc] initWithFrame: CGRectMake (dynamicX, dynamicY, defaultWidth, defaultHeight)];
    customImageView.image = chosenImage;
    
    [self.imagesBox addSubview: customImageView];
    [self.selectedImagePicker dismissViewControllerAnimated:YES completion:NULL];
    
    [self addNewPhotoToList : chosenImage];
    

    //
    
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
