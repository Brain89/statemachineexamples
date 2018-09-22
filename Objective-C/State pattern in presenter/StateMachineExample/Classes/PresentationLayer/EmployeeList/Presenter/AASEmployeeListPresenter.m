//
//  AASEmployeeListPresenter.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListPresenter.h"

#import "AASEmployeeListStateProtocol.h"
#import "AASEmployeeListViewInput.h"
#import "AASEmployeeServiceProtocol.h"

#import "AASEmployeeListStateData.h"
#import "AASEmployeeListStateError.h"
#import "AASEmployeeListStateInitial.h"
#import "AASEmployeeListStateLoading.h"

@implementation AASEmployeeListPresenter

#pragma mark - Lifecycle

- (instancetype)init {
	self = [super init];
	if (self) {
		_currentState = [[AASEmployeeListStateInitial alloc] initWithPresenter:self];
	}

	return self;
}

#pragma mark - Protocol conformance
#pragma mark - <AASEmployeeListViewOutput>

- (void)didLoadView {
	[self.currentState didLoadView];
}

- (void)reloadEmployees {
	[self.currentState reloadEmployees];
}

#pragma mark - <AASEmployeeServiceDelegate>

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveAllEmployees:(NSArray<AASEmployee *> *)employeeList {
	[self.currentState service:service didReceiveAllEmployees:employeeList];
}

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveError:(NSError *)error {
	[self.currentState service:service didReceiveError:error];
}

@end
