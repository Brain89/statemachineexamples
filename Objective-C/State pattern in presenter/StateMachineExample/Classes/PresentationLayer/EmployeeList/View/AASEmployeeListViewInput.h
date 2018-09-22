//
//  AASEmployeeListViewInput.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AASEmployee;

@protocol AASEmployeeListViewInput <NSObject>

@required

- (void)showEmployees:(NSArray<AASEmployee *> *)employees;
- (void)showError:(NSError *)error;

- (void)showLoadingIndicator;
- (void)hideLoadingIndicator;

@end

NS_ASSUME_NONNULL_END
