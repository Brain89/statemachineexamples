//
//  AASEmployeeListStateData.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListStateProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class AASEmployeeListPresenter;

@interface AASEmployeeListStateData : NSObject <AASEmployeeListStateProtocol>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPresenter:(AASEmployeeListPresenter *)presenter;

@end

NS_ASSUME_NONNULL_END
