//
//  PCDScanResultsManager.h
//  CardRecognition
//
//  Created by Igor Pesin on 10/17/14.
//  Copyright (c) 2014 PayCards. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Allows user to leave feedback if scanned data was correct or not.
@interface PCDScanResultsManager : NSObject

/** 
 Report if the card data were recognized correctly or not.
 
 @param scanId ScanID
 @param succesfull succesfull
 
 @return responseData report status
 @return error error
 */
+ (void)reportStatusForScanId:(NSNumber *)scanId succesfull:(BOOL)succesfull completion:(void (^)(NSDictionary *responseData, NSError *error))completion;

@end

