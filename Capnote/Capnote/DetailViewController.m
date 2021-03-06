//
//  DetailViewController.m
//  Capnote
//
//  Created by Daler Asrorov on 12/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "DetailViewController.h"
#import "FeedTableViewController.h"

@interface DetailViewController ()


@end

@implementation DetailViewController

@synthesize strTitle;
@synthesize noteTitle;
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.noteTitle.text = self.data[@"title"];
    self.noteTitleTitle.text = self.data[@"text"];
    self.noteSection.text = self.data[@"section"];
    self.noteDescription.text = self.data[@"description"];
    
    NSMutableArray* files = self.data[@"files"];
    NSString *filePath = [files objectAtIndex: 0]; // take first
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: filePath]];
    self.noteImg.image = [UIImage imageWithData: imageData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

@end
