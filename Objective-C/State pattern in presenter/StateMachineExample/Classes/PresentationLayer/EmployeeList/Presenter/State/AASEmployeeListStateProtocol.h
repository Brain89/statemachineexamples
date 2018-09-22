//
//  AASEmployeeListStateProtocol.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListViewOutput.h"
#import "AASEmployeeServiceDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class AASEmployeeListPresenter;

@protocol AASEmployeeListStateProtocol <AASEmployeeListViewOutput, AASEmployeeServiceDelegate>

@required

@property (nonatomic, weak) AASEmployeeListPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
