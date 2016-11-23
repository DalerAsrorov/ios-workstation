//
//  DetailViewController.m
//  Lab6
//
//  Created by Daler Asrorov on 11/23/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *name = self.place[@"name"];
    NSURL *url = self.place[@"website"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.place[@"website"]]];;
    
    [self.webview loadRequest: request];
    self.navigationItem.title = name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) webViewDidStartLoad:(UIWebView *) webView {
    NSLog(@"Started animating");
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    [self.view bringSubviewToFront: self.activityIndicator];
}

- (void) webViewDidFinishLoad:(UIWebView *) webView {
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}

- (void) webView: (UIWebView *) webView didFailLoadWithError:(nonnull NSError *) error {
    [self.activityIndicator stopAnimating];
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
