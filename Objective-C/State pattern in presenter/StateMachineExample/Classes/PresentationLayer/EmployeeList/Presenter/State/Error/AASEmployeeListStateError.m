//
//  AASEmployeeListStateError.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListStateError.h"

#import "AASEmployeeListPresenter.h"
#import "AASEmployeeListViewInput.h"
#import "AASEmployeeServiceProtocol.h"

#import "AASEmployeeListStateLoading.h"

@implementation AASEmployeeListStateError

#pragma mark - Lifecycle

- (instancetype)initWithPresenter:(AASEmployeeListPresenter *)presenter {
	self = [super init];
	if (self) {
		_presenter = presenter;
	}

	return self;
}

#pragma mark - Protocol conformance
#pragma mark - <AASEmployeeListStateProtocol>

@synthesize presenter = _presenter;

#pragma mark - <AASEmployeeListViewOutput>

- (void)didLoadView {
	NSLog(@"Impossible transition");
}

- (void)reloadEmployees {
	[self.presenter.view showLoadingIndicator];
	[self.presenter.employeeService receiveAllEmployees];

	self.presenter.currentState = [[AASEmployeeListStateLoading alloc] initWithPresenter:self.presenter];
}

#pragma mark - <AASEmployeeServiceDelegate>

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveAllEmployees:(NSArray<AASEmployee *> *)employeeList {
	NSLog(@"Impossible transition");
}

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveError:(NSError *)error {
	NSLog(@"Impossible transition");
}

@end
