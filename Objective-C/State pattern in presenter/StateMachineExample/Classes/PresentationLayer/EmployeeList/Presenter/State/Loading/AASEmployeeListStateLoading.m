//
//  AASEmployeeListStateLoading.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListStateLoading.h"

#import "AASEmployeeListPresenter.h"
#import "AASEmployeeListViewInput.h"
#import "AASEmployeeServiceProtocol.h"

#import "AASEmployeeListStateData.h"
#import "AASEmployeeListStateError.h"

@implementation AASEmployeeListStateLoading

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
	NSLog(@"Impossible transition");
}

#pragma mark - <AASEmployeeServiceDelegate>

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveAllEmployees:(NSArray<AASEmployee *> *)employeeList {
	[self.presenter.view hideLoadingIndicator];
	[self.presenter.view showEmployees:employeeList];

	self.presenter.currentState = [[AASEmployeeListStateData alloc] initWithPresenter:self.presenter];
}

- (void)service:(id<AASEmployeeServiceProtocol>)service didReceiveError:(NSError *)error {
	[self.presenter.view hideLoadingIndicator];
	[self.presenter.view showError:error];

	self.presenter.currentState = [[AASEmployeeListStateError alloc] initWithPresenter:self.presenter];
}

@end
