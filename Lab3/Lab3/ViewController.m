//
//  ViewController.m
//  Lab3
//
//  Created by Daler Asrorov on 9/18/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController


-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [inputBill resignFirstResponder];
    return YES;
}

/* The most reliable method for hiding 
 * keyboard after taping anywhere outside 
 * of the text field 
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [inputBill resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    tipValue.adjustsFontSizeToFitWidth = NO;
    tipValue.lineBreakMode = NSLineBreakByTruncatingTail;
    
    // default values
    billIncluded = false;
    finalTip = 0;
    
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

- (IBAction)tipIncludedSwitch:(UISwitch *)sender {
    if([sender isOn]) {
        billIncluded = true;
        withTip = originalBill + taxDollarAmount;
    } else {
        billIncluded = false;
        withTip = originalBill;
    }
    [self setTotalWithTipFinal : withTip];
    [self setTotalTipValue: withTip];
}

- (void) setTotalTipValue: (double) result {
    NSString* frmStr = @"";
    frmStr = [NSString stringWithFormat:@"%f", result];
    totalForTip.text = frmStr;
}

- (void) setFinalTip: (double) value {
    // compute final tip
    NSString * finalTipString = [NSString stringWithFormat:@"%.02f", value];
    NSString * finalTipStringWithD = [@"$" stringByAppendingString: finalTipString];
    finalTipLabel.text = finalTipStringWithD;
}

- (IBAction)sliderCompute:(UISlider *)sender {
    NSString *withoutPrc = [NSString stringWithFormat: @"%d", (int)sender.value];
    finalTip = 0.01 * (int)sender.value * withTip;
    percentTotalTip.text = [withoutPrc stringByAppendingString:@"%"];

    // compute final tip
    [self setFinalTip : finalTip];
    [self setTotalWithTipFinal: withTip + finalTip];
}

- (IBAction)taxPercentChange:(UISegmentedControl *)sender {
    int taxIndex = taxPercentValue.selectedSegmentIndex;
    [self setPercentValue : taxIndex];
    
    double val1 = taxPercentHolder;
    NSString *taxPercentStr = inputBill.text;
    NSNumber *formattedBill = [[NSNumberFormatter new] numberFromString: taxPercentStr];
    originalBill = formattedBill.floatValue;
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
    if(billIncluded) {
        withTip = originalBill + taxDollarAmount;
        [self setTotalTipValue: withTip];
    } else if (!billIncluded) {
        withTip = originalBill;
        [self setTotalTipValue: withTip];
    }
    
    // tip includex tax
    double totalWithTipTemp = [self computeTotalWithTip];
    [self setTotalWithTipFinal : totalWithTipTemp];
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

- (void) setTotalWithTipFinal: (double) value {
    NSString *withoutPrc = [NSString stringWithFormat: @"%f.02", value];
    totalWithTipOutlet.text = withoutPrc;
}

- (double) computeTotalWithTip {
    double finalTotalWithTip = withTip + finalTip;
    return finalTotalWithTip;
}

@end
