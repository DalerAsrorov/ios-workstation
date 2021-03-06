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

- (IBAction)clearAll:(id)sender {
    [self clearEverything];
};

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self clearEverything];
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
    countSplit = eventValueInt;
    [self computeAndSetTotalCostPerPerson];
    //countSplit

}

- (void) setTotalCostPerPerson : (double) value {
    NSString * withoutPrc = [NSString stringWithFormat: @"%.02f", value];
    NSString * finalTaxStr = [@"$" stringByAppendingString: withoutPrc];
    finalWithTipOutletValueTwo.text = finalTaxStr;

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
    // update value of tip and total per person
    
//    printf("")
    // calculate total for Tip
    double totalForTipTemp = 0;
    totalForTipTemp = totalForTipHolder * (percentValueRaw * 0.01);
    [self setFinalTip : totalForTipTemp];
    double tempTotalCostPerPerson = 0;
    
    if(countSplit <= 0) {
        printf("Counsplist <= 0");
        printf("%d", countSplit);
        tempTotalCostPerPerson = (double) withTip / 1;
        printf("%f", tempTotalCostPerPerson);
        [self setTotalCostPerPerson: tempTotalCostPerPerson];
    } else {
        printf("Counsplist <= 0");
        printf("%d", countSplit);
        tempTotalCostPerPerson = (double) withTip / countSplit;
        printf("%f", tempTotalCostPerPerson);
        [self setTotalCostPerPerson: tempTotalCostPerPerson];
    }
}

- (void) setTotalTipValue: (double) result {
    NSString* frmStr = @"";
    totalForTipHolder = result;
    frmStr = [NSString stringWithFormat:@"%0.02f", result];
    NSString * finalTipStringWithD = [@"$" stringByAppendingString: frmStr];
    totalForTip.text = finalTipStringWithD;
}

- (void) setFinalTip: (double) value {
    // compute final tip
    finalTipValue = value;
    NSString * finalTipString = [NSString stringWithFormat:@"%.02f", value];
    NSString * finalTipStringWithD = [@"$" stringByAppendingString: finalTipString];
    finalTipLabel.text = finalTipStringWithD;
}

- (IBAction)sliderCompute:(UISlider *)sender {
    NSString *withoutPrc = [NSString stringWithFormat: @"%d", (int)sender.value];
    finalTip = 0.01 * (int)sender.value * withTip;
    percentValueRaw = (int)sender.value;
    percentTotalTip.text = [withoutPrc stringByAppendingString:@"%"];
    finalWithTip = withTip + finalTip;
    
    // compute final tip
    [self setFinalTip : finalTip];
    [self setTotalWithTipFinal: finalWithTip];
    [self computeAndSetTotalCostPerPerson];
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
    [self computeTotalWithTip];
    [self setTotalWithTipFinal : finalTotalWithTip];
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
    NSString *withoutPrc = [NSString stringWithFormat: @"%.02f", value];
    NSString * finalTaxStr = [@"$" stringByAppendingString: withoutPrc];
    finalTotalWithTip = value;
    totalWithTipOutlet.text = finalTaxStr;
}

- (void) computeTotalWithTip {
    finalTotalWithTip = withTip + finalTip;
}

- (void) computeAndSetTotalCostPerPerson {
    printf("finalWithTip: %.02f and countSplit %d ", finalTotalWithTip, countSplit);
    double tempValueTip = 0;
    
    // prevents the label from showing null...
    if(countSplit <= 0)
        tempValueTip = finalTotalWithTip;
    else
        tempValueTip = (double)(finalTotalWithTip / countSplit);
    
    NSString * withoutPrc = [NSString stringWithFormat: @"%.02f", tempValueTip];
    NSString * finalTaxStr = [@"$" stringByAppendingString: withoutPrc];
    finalWithTipOutletValueTwo.text = finalTaxStr;
}

- (void) clearEverything {
    tipValue.adjustsFontSizeToFitWidth = NO;
    tipValue.lineBreakMode = NSLineBreakByTruncatingTail;
    
    billIncluded = false;
    finalTip = 0;
    taxPercentHolder = 0;
    originalBill = 0;
    taxDollarAmount = 0;
    withTip = 0;
    finalTotalWithTip = 0;
    countSplit = 1;
    percentValueRaw = 0;
    finalTipValue = 0;
    
    totalForTip.text = @"";
    taxAmount.text = @"";
    eventSplitValue.text = @"1";
    totalWithTipOutlet.text = @"";
    finalWithTipOutletValueTwo.text = @"";
    percentTotalTip.text = @"0%";
    inputBill.text = @"";
    finalTipLabel.text = @"";
    [switchChange setOn:NO];
    sliderChange.value = 0;
    taxPercentValue.selectedSegmentIndex = 0;
}

@end
