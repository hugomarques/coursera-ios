//
//  ViewController.m
//  DistanceCalculator
//
//  Created by Hugo Marques on 12/24/15.
//  Copyright © 2015 Hugo Marques. All rights reserved.
//

#import "ViewController.h"
#import <DistanceGetter/DGDistanceRequest.h>

void updateDistance(UILabel *locationLabel, NSArray *responses, int index) {
    NSNull *badResult = [NSNull null];
    if (responses[index] != badResult) {
        double distance = [responses[index] floatValue]/1000.0;
        NSString *formatedDistance = [NSString stringWithFormat:@"%.2f km", distance];
        locationLabel.text = formatedDistance;
    } else {
        locationLabel.text = @"Error";
    }
}

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *distReq;

@property (weak, nonatomic) IBOutlet UITextField *startLocationField;

@property (weak, nonatomic) IBOutlet UITextField *firstLocationField;
@property (weak, nonatomic) IBOutlet UILabel *firstDistance;

@property (weak, nonatomic) IBOutlet UITextField *secondLocationField;
@property (weak, nonatomic) IBOutlet UILabel *secondDistance;

@property (weak, nonatomic) IBOutlet UITextField *thirdLocationField;
@property (weak, nonatomic) IBOutlet UILabel *thirdDistance;

@property (weak, nonatomic) IBOutlet UITextField *fourthLocationField;
@property (weak, nonatomic) IBOutlet UILabel *fourthDistance;

@property (weak, nonatomic) IBOutlet UIButton *calculateDistanceButton;

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
- (IBAction)calculateDistance:(id)sender {
    self.calculateDistanceButton.enabled = NO;
    self.distReq = [DGDistanceRequest alloc];
    NSString *loading = @"loading...";
    
    self.firstDistance.text = loading;
    self.secondDistance.text = loading;
    self.thirdDistance.text = loading;
    self.fourthDistance.text = loading;
    
    NSString *locationA = self.firstLocationField.text;
    NSString *locationB = self.secondLocationField.text;
    NSString *locationC = self.thirdLocationField.text;
    NSString *locationD = self.fourthLocationField.text;
    
    NSArray *locations = @[locationA, locationB, locationC, locationD];
    
    self.distReq = [self.distReq initWithLocationDescriptions: locations sourceDescription:self.startLocationField.text];

    __weak ViewController *weakSelf = self;
    
    self.distReq.callback = ^(NSArray *responses){
        ViewController *strongSelf = weakSelf;
        if (!strongSelf) return;
        updateDistance(strongSelf.firstDistance, responses, 0);
        updateDistance(strongSelf.secondDistance, responses, 1);
        updateDistance(strongSelf.thirdDistance, responses, 2);
        updateDistance(strongSelf.fourthDistance, responses, 3);
        strongSelf.calculateDistanceButton.enabled = YES;
    };
    
    [self.distReq start];
}

@end
