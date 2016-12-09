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

@end
