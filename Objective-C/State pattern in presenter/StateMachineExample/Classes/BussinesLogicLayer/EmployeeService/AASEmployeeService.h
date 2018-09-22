//
//  AASEmployeeService.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AASEmployeeServiceDelegate;

@interface AASEmployeeService : NSObject <AASEmployeeServiceProtocol>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithDelegate:(id<AASEmployeeServiceDelegate>)delegate NS_DESIGNATED_INITIALIZER;

@property (nonatomic, nullable, weak) id<AASEmployeeServiceDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
