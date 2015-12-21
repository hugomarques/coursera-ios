//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Hugo Marques on 12/20/15.
//  Copyright © 2015 Hugo Marques. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

void updateCurrencyLabel(UILabel *label, double value) {
    NSString *formattedValue = [NSString stringWithFormat:@"%.2f", value];
    label.text = formattedValue;
}

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;

    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    self.currencyA.text = @"Loading...";
    self.currencyB.text = @"Loading...";
    self.currencyC.text = @"Loading...";
    [self.req start];

}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    
    double inputValue = [self.inputField.text doubleValue];
    updateCurrencyLabel(self.currencyA, inputValue*currencies.EUR);
    updateCurrencyLabel(self.currencyB, inputValue*currencies.JPY);
    updateCurrencyLabel(self.currencyC, inputValue*currencies.INR);
    self.convertButton.enabled = YES;
}


@end
