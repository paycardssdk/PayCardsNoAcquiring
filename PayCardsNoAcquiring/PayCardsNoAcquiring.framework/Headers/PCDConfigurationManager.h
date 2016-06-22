//
//  PCDConfigurationManager.h
//  CardRecognition
//
//  Created by Igor Pesin on 12/4/14.
//  Copyright (c) 2014 PayCards. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCDConfigurationSettings.h"

/** 
 Framework localization
 
 @param PCDLocalizationEN English locale
 @param PCDLocalizationRU Russian locale
 */
typedef NS_ENUM(NSInteger, PCDLocalization) {
    PCDLocalizationEN,
    PCDLocalizationRU
};

/// Allows the user to configure framework. Includes the following settings
@interface PCDConfigurationManager: NSObject

/// Framework localization
@property (nonatomic) PCDLocalization localization;

/// SoundEnabled. YES by default.
@property (nonatomic, getter=isSoundEnabled) BOOL soundEnabled;

/// Indicates if the user will be asked to enter CVV code after card scan. YES by default.
@property (nonatomic, assign) BOOL collectCVV;

/// Indicates which fields (holder name, expiration date, card name) of the recognized card should be shown after the recognition. Default value is PCDRequiredCardFieldAll.
@property (nonatomic) PCDRequiredCardFields requeriedCardFields;

/// Indicates if a recognized card will be saved. Cards's data is stored in iOS Keychain and can be used by the client with the same ClientId for future payments. YES by default.
@property (nonatomic, assign) BOOL saveCard;

/// Indicates will the card’s CVV be stored in iOS Keychain. For future payments, saved CVV can be obtained after entering passcode or Touch ID. YES by default.
@property (nonatomic, assign) BOOL storeCVV;

+ (instancetype)sharedInstance;

@end


