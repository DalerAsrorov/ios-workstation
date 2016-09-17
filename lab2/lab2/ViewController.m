//
//  ViewController.m
//  lab2
//
//  Created by Daler Asrorov on 9/11/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)controllMessage:(id)sender {
    [sender resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [controlTextField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ReturnKeyButton:(id)sender {

}

- (IBAction)resetStuff:(id)sender {
    controlTextField.text = @"";
    controllMessage.text = @"As a ninja, you're the one who can fight big monsters and crocodiles.";
}

- (IBAction)ninjaOne:(id)sender {
    NSString *nameStr = controlTextField.text;
    
    if([nameStr length] != 0) {
        NSString *one = @"Great choice, ";
        NSString *two = @"! Ninja NY is known for being agile, speedy, and sharp.";
        
        controllMessage.text = [NSString stringWithFormat:@"%@%@%@", one, nameStr, two];
    }
    else {
        controllMessage.text = @"Please type your name first!";
    }
    
}

- (IBAction)ninjaTwo:(id)sender {
    NSString *nameStr = controlTextField.text;
    
    if([nameStr length] != 0) {
        NSString *one = @"Amazing choice, ";
        NSString *two = @"! Ninja LA is particularly strong with very damaging strikes, great stamina, and tactical intelligence.";
        
        controllMessage.text = [NSString stringWithFormat:@"%@%@%@", one, nameStr, two];
    }
    else {
        controllMessage.text = @"Please type your name first!";
    }
}
@end
