//
//  ViewController.m
//  Lab3
//
//  Created by Daler Asrorov on 9/18/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tipValue.adjustsFontSizeToFitWidth = NO;
    tipValue.lineBreakMode = NSLineBreakByTruncatingTail;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// printf("%ld", (long)taxPercentSegment.selectedSegmentIndex);

- (IBAction)inputBillAction:(id)sender {
    
}

- (IBAction)eventSplitStepper:(UIStepper *)sender {
    int eventValueInt = (int) sender.value;
    NSString* valueStr = [NSString stringWithFormat:@"%i", eventValueInt];
    eventSplitValue.text = [@"" stringByAppendingString: valueStr];
//    printf("%f", sender.value);
}

- (IBAction)sliderCompute:(UISlider *)sender {
    NSString *withoutPrc = [NSString stringWithFormat: @"%d", (int)sender.value];
    percentTotalTip.text = [withoutPrc stringByAppendingString:@"%"];

}

- (IBAction)taxPercentChange:(UISegmentedControl *)sender {
    double taxValue = taxPercentValue.selectedSegmentIndex;
    printf("%f", taxValue);
}

//- (IBAction)taxPercentSegmentAction:(UISegmentedControl *)sender
//{
//    double segIndex = taxPercentSegmentValue.selectedSegmentIndex;
//    printf("%f", segIndex);
//}
@end
