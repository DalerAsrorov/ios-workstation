//
//  DetailViewController.h
//  Lab6
//
//  Created by Daler Asrorov on 11/23/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSDictionary* place;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
