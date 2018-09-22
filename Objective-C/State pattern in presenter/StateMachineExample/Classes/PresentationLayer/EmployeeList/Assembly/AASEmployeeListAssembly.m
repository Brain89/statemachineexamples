//
//  AASEmployeeListAssembly.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListAssembly.h"

#import "AASEmployeeListView.h"
#import "AASEmployeeListPresenter.h"
#import "AASEmployeeService.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AASEmployeeListAssembly

#pragma mark - Public

- (UIViewController *)constructModule {
	AASEmployeeListView *view = [self createView];
	AASEmployeeListPresenter *presenter = [self createPresenter];

	view.output = presenter;
	presenter.view = view;

	return view;
}

#pragma mark - Private

- (AASEmployeeListView *)createView {
	AASEmployeeListView *view = [[self mainStoryboard] instantiateInitialViewController];
	return view;
}

- (AASEmployeeListPresenter *)createPresenter {
	AASEmployeeListPresenter *presenter = [AASEmployeeListPresenter new];
	presenter.employeeService = [self createEmployeeServiceWithDelegate:presenter];
	return presenter;
}

- (AASEmployeeService *)createEmployeeServiceWithDelegate:(id<AASEmployeeServiceDelegate>)delegate {
	AASEmployeeService *service = [[AASEmployeeService alloc] initWithDelegate:delegate];
	return service;
}

- (UIStoryboard *)mainStoryboard {
	NSBundle *currentBundle = [self currentBundle];
	return [UIStoryboard storyboardWithName:@"Main" bundle:currentBundle];
}

- (NSBundle *)currentBundle {
	Class currentClass = [self class];
	NSBundle *bundle = [NSBundle bundleForClass:currentClass];

	return bundle;
}

@end

NS_ASSUME_NONNULL_END
