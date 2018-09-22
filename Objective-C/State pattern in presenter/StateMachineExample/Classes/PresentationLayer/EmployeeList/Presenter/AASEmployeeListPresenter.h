//
//  AASEmployeeListPresenter.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListViewOutput.h"
#import "AASEmployeeServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AASEmployeeListStateProtocol;
@protocol AASEmployeeListViewInput;
@protocol AASEmployeeServiceProtocol;

@interface AASEmployeeListPresenter : NSObject <AASEmployeeListViewOutput, AASEmployeeServiceDelegate>

@property (nonatomic, strong) id<AASEmployeeListStateProtocol> currentState;

@property (nonatomic, weak) id<AASEmployeeListViewInput> view;
@property (nonatomic, strong) id<AASEmployeeServiceProtocol> employeeService;

@end

NS_ASSUME_NONNULL_END
