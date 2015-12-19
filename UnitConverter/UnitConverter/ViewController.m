//
//  ViewController.m
//  UnitConverter
//
//  Created by Hugo Marques on 12/19/15.
//  Copyright © 2015 Hugo Marques. All rights reserved.
//

#import "ViewController.h"

double convertFeetToInches(double unitInFeet) {
    return unitInFeet * 12;
}

double convertFeetToMeters(double unitInFeet) {
    return unitInFeet/3.2808;
}

double convertFeetToMiles(double unitInFeet) {
    return unitInFeet/5280;
}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userInput;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentField;

@property (weak, nonatomic) IBOutlet UILabel *outputField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)update:(id)sender {
    double outputConverted;
    double userInputVal = [self.userInput.text doubleValue];
    if (self.segmentField.selectedSegmentIndex == 0) {
        outputConverted = convertFeetToInches(userInputVal);
    } else if (self.segmentField.selectedSegmentIndex == 1) {
                outputConverted = convertFeetToMeters(userInputVal);
    } else {
                outputConverted = convertFeetToMiles(userInputVal);
    }
    self.outputField.text = [@(outputConverted) stringValue];
}

@end
