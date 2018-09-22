//
//  AASEmployeeListViewOutput.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AASEmployeeListViewOutput <NSObject>

@required

- (void)didLoadView;
- (void)reloadEmployees;

@end

NS_ASSUME_NONNULL_END
