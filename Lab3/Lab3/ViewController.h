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
    IBOutlet UILabel *finalValuePerPersonOutlet;
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
    IBOutlet UILabel *calculatedTip;
    IBOutlet UILabel *finalTipLabel;
    
    IBOutlet UILabel *finalWithTipOutletValueTwo;
    IBOutlet UILabel *totalWithTipOutlet;
    // my custom helper variables
    double taxPercentHolder;
    double originalBill;
    double taxDollarAmount;
    double withTip;
    int countSplit;
    double finalTip;
    double finalWithTip;
    double finalTipValue;
    double finalTotalPerPerson;
    double totalForTipHolder;
    double percentValueRaw;
    
    
    IBOutlet UISlider *sliderChange;
    IBOutlet UISwitch * switchChange;
    // reserved
    double finalTotalWithTip;

}

- (IBAction)inputBillAction:(id)sender;
- (IBAction)taxPercent:(id)sender;
- (IBAction)eventSplitStepper:(id)sender;
- (IBAction)tipIncludedSwitch:(UISwitch *)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (IBAction)clearAll:(id)sender;

// my own methods
- (void) setPercentValue: (NSInteger) index;
- (void) setFinalTip: (double) value;
- (void) computeTotalWithTip;
- (double) computeTaxPercent: (double) value : (double) billValue;
- (void) setTotalWithTipFinal: (double) value;
- (void) setTotalTipValue: (double) result;
- (void) computeAndSetTotalCostPerPerson;
- (void) setTotalCostPerPerson : (double) value;
- (void) clearEverything;
@end

