//
//  PCDCardScanViewController.h
//  CardRecognition
//
//  Created by Igor Pesin on 2/10/15.
//  Copyright (c) 2015 PayCards. All rights reserved.
//

#import <UIKit/UIKit.h>

///Keys for scanWithInfo
FOUNDATION_EXPORT NSString
*const PCDCardParams,
*const PCDCardName,
*const PCDCardExpireDate,
*const PCDCardHolderName,
*const PCDCardCVV,
*const PCDCardNumber,
*const PCDCardScanId;

@class PCDCardScanViewController, PCDMerchant;

/// PCDCardScanViewController delegate
@protocol PCDCardScanViewControllerDelegete <NSObject>
@optional

/**
 Fires when the card recognition was finished successfully
 
 @note Card Info example:
 {
    cardParams =     {
        cardName = My Card;
        expireDate = "2015-09-01T00:00:00";
        holderName = John Doe;
        number = 5402341040016512;
    };
    scanId = 113;
 }
 
 @param scanId scanId parameter is used to report if recognized data were correct or not
 */
- (void)cardScanViewController:(PCDCardScanViewController *)cardScanViewController didFinishScanWithInfo:(NSDictionary *)cardInfo;

/// Fires when error occurs
- (void)cardScanViewController:(PCDCardScanViewController *)cardScanViewController didCloseWithError:(NSError *)error;

/// Fires when user interrupts recognition by tapping a Back button
- (void)cardScanViewControllerUserDidClose:(PCDCardScanViewController *)cardScanViewController;

@end


/// Root Card Scan View Controller
@interface PCDCardScanViewController: UIViewController

/** 
 PresentOnViewController - ???
 
  @param merchant property is necessary, otherwise error will occur
  @param delegate PCDCardScanViewController
  @param completion ???
 */
+ (void)presentOnViewController:(UIViewController *)viewController
                       merchant:(PCDMerchant *)merchant
                       delegate:(id<PCDCardScanViewControllerDelegete>)delegate
           verificationComplete:(void (^)(NSError *error))completion;

/// ????
- (void)dismissWithCompletion:(void (^)(void))completion;

@end
