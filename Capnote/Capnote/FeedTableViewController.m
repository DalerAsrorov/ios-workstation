//
//  FeedTableViewController.m
//  Capnote
//
//  Created by Daler Asrorov on 12/6/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "FeedTableViewController.h"

@interface FeedTableViewController ()

@property NSString  *reuseidentifier;
@property (strong) NotesModel *notesModel;
@property NSMutableArray* notePosts;

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _reuseidentifier = @"FeedTableCell";
    _notesModel = [[NotesModel alloc] init];
    
    self.notePosts = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self fetchNotes];
}

+ (UIImage *) imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width {//method to scale image accordcing to width
    
    float oldWidth = sourceImage.size.width;
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = sourceImage.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    return self.notePosts.count;
}

- (void) fetchNotes {
    [self.notesModel getSubsFeedNotes:@"some" completion:^(NSDictionary *data) {
        [self.notePosts addObject: data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseidentifier forIndexPath:indexPath];
    
    NSDictionary *note = self.notePosts[indexPath.row];
    NSString *noteTitle = note[@"title"];
    NSString *noteDescription = note[@"description"];
    
    NSMutableArray *files = note[@"files"];
    NSLog(@"files %@", files);
    NSString *firstImageUrlStr = [files objectAtIndex: 0];
    
    
    cell.imageView.layer.cornerRadius = 1;
    cell.imageView.clipsToBounds = YES;
    
    cell.imageView.layer.backgroundColor=[[UIColor clearColor] CGColor];
    cell.imageView.layer.cornerRadius= 60;
    cell.imageView.layer.borderWidth= 0.5;
    cell.imageView.layer.masksToBounds = YES;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.layer.borderColor=[[UIColor blackColor] CGColor];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: firstImageUrlStr]];
    UIImage* image = [UIImage imageWithData: imageData];

    
    
    cell.imageView.image = [self imageWithImage: image convertToSize: CGSizeMake(100, 100)];
    
    
    cell.textLabel.text = noteTitle;
    cell.detailTextLabel.text = noteDescription;
//    cell.imageView.image = ;
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
