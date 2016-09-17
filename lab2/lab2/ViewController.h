//
//  ViewController.h
//  lab2
//
//  Created by Daler Asrorov on 9/11/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel *controllMessage;
    IBOutlet UITextField *controlTextField;
    
}
- (IBAction)resetStuff:(id)sender;

- (IBAction)ninjaOne:(id)sender;

- (IBAction)ninjaTwo:(id)sender;

- (IBAction)ReturnKeyButton:(id)sender;

@end

