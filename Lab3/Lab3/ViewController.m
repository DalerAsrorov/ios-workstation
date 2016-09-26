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
    int taxIndex = taxPercentValue.selectedSegmentIndex;
    [self setPercentValue : taxIndex];
    
    double val1 = taxPercentHolder;
    NSString *taxPercentStr = inputBill.text;
    NSLog(@"%@", taxPercentStr);
    NSNumber *formattedNum = [[NSNumberFormatter new] numberFromString: taxPercentStr];
    float val2 = formattedNum.floatValue * 0.01;
    double taxPrcComputed = val1 * val2;
    taxDollarAmount = taxPrcComputed;
    NSString * formattedNumber = [NSString stringWithFormat:@"%.02f", taxPrcComputed];
    NSString * dollarSign = @"$";
    NSString * finalTaxStr = [dollarSign stringByAppendingString: formattedNumber];
    taxAmount.text = finalTaxStr;
    
    printf("Tax computed: %f", taxPrcComputed);
    
}

- (void) setPercentValue: (int) index {
    if (index == 0) {
        taxPercentHolder = 7.5;
    } else if(index == 1) {
        taxPercentHolder = 8;
    } else if (index == 2) {
        taxPercentHolder = 8.5;
    } else if(index == 3) {
        taxPercentHolder = 9;
    } else if(index == 4) {
        taxPercentHolder = 9.5;
    }
}

@end
