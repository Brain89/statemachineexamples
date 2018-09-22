//
//  AASEmployeeServiceDelegate.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AASEmployeeServiceProtocol;

@class AASEmployee;

@protocol AASEmployeeServiceDelegate <NSObject>

@required

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveAllEmployees:(NSArray<AASEmployee *> *)employeeList;
- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
