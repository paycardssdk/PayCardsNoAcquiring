//
//  ViewController.m
//  PayCardsNoAcquiringObjcDemo
//
//  Created by Viktor Bespalov on 24/03/16.
//  Copyright © 2016 Pay.Cards. All rights reserved.
//

#import "ViewController.h"
#import <PayCardsNoAcquiring/PayCardsNoAcquiring.h>

@interface ViewController () <PCDCardScanViewControllerDelegete>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)presentPayCards:(id)sender {
    
    PCDMerchant *merchant = [PCDMerchant new];
    merchant.ID = @100333; //Your id
    merchant.password = @"zI02NS3c"; // Your password
    merchant.clientId = @"777"; // Your client ID
    merchant.email = @"dmitriy.bagrov@walletone.com"; // Your email
    merchant.phone = @"79788014244"; // Your phone

    [self.activityIndicator startAnimating];
    [PCDCardScanViewController presentOnViewController:self merchant:merchant delegate:self verificationComplete:^(NSError *error) {
        [self.activityIndicator stopAnimating];
        
        if (error) {
            self.infoLabel.text = [NSString stringWithFormat:@"ERROR: %@", error.localizedDescription];
        }
    }];
}

#pragma mark - PCDCardScanViewControllerDelegete

- (void)cardScanViewController:(PCDCardScanViewController *)cardScanViewController didCloseWithError:(NSError *)error {
    self.infoLabel.text = [NSString stringWithFormat:@"ERROR: %@", error.localizedDescription];
    [cardScanViewController dismissWithCompletion:nil];
}

- (void)cardScanViewController:(PCDCardScanViewController *)cardScanViewController didFinishScanWithInfo:(NSDictionary *)cardInfo {
    self.infoLabel.text = [NSString stringWithFormat:@"CARD INFO: %@", cardInfo[PCDCardParams]];
    [cardScanViewController dismissWithCompletion:nil];
}

- (void)cardScanViewControllerUserDidClose:(PCDCardScanViewController *)cardScanViewController {
    self.infoLabel.text = @"RECOGNITION CANCELED";
    [cardScanViewController dismissWithCompletion:nil];
}

@end
