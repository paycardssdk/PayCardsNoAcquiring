//
//  PCDMerchant.h
//  CardRecognition
//
//  Created by Igor Pesin on 10/16/14.
//  Copyright (c) 2014 PayCards. All rights reserved.
//

#import <Foundation/Foundation.h>

/// This class is used to represent a merchant account.
@interface PCDMerchant : NSObject

/// Merchant's ID (account number). Received at registration. Mandatory field.
@property(nonatomic, strong) NSNumber *ID;

/// Merchant's password. Mandatory field.
@property(nonatomic, copy) NSString *password;

///Client's ID in Merchan't system. Mandatory field.
@property(nonatomic, copy) NSString *clientId;

///Client's email. Can be empty if there is phone.
@property(nonatomic, copy) NSString *email;

///Client's phone. Can be empty if there is email.
@property(nonatomic, copy) NSString *phone;

+ (instancetype)sharedInstance;

+ (void)setSharedInstance:(PCDMerchant *)merchant;

@end
