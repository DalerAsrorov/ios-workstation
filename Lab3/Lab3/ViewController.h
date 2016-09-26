//
//  ViewController.h
//  Lab3
//
//  Created by Daler Asrorov on 9/18/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *tipValue;
    IBOutlet UILabel *tipTotal;
    IBOutlet UILabel *taxAmount;
    IBOutlet UILabel *eventSplitValue;
    IBOutlet UITextField *inputBill;
    IBOutlet UILabel *percentTotalTip;
    BOOL billIncluded;
    IBOutlet UISegmentedControl *taxPercentValue;
    IBOutlet UILabel *taxPercentShow;
    IBOutlet UILabel * totalForTip;
    // my custom helper variables
    double taxPercentHolder;
    double originalBill;
    double taxDollarAmount;
    double withTip;
    int countSplit;
}

- (IBAction)inputBillAction:(id)sender;
- (IBAction)taxPercent:(id)sender;
- (IBAction)eventSplitStepper:(id)sender;
- (IBAction)tipIncludedSwitch:(UISwitch *)sender;

// my own methods
- (void) setPercentValue: (NSInteger) index;
- (double) computeTaxPercent: (double) value : (double) billValue;
- (void) setTotalTipValue: (double) result;

@end

