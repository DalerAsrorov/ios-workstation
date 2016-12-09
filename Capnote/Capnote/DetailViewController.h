//
//  DetailViewController.h
//  Capnote
//
//  Created by Daler Asrorov on 12/9/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *noteTitle;
@property (weak, nonatomic) NSDictionary *data;
@property (weak, nonatomic) NSString *strTitle;

@property (weak, nonatomic) IBOutlet UIImageView *noteImg;

@property (weak, nonatomic) IBOutlet UILabel *noteTitleTitle;

@property (weak, nonatomic) IBOutlet UITextView *noteDescription;

@property (weak, nonatomic) IBOutlet UILabel *noteSection;

@end
