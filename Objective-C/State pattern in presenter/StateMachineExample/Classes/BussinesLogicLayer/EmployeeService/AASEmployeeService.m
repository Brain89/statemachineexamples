//
//  AASEmployeeService.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeService.h"

#import "AASEmployeeServiceDelegate.h"

#import "AASEmployee.h"

NS_ASSUME_NONNULL_BEGIN

NSErrorDomain const AASEmployeeServiceErrorDomain = @"AASEmployeeServiceErrorDomain";

@implementation AASEmployeeService

#pragma mark - Lifecycle

- (instancetype)initWithDelegate:(id<AASEmployeeServiceDelegate>)delegate {
	self = [super init];
	if (self) {
		_delegate = delegate;
	}

	return self;
}

#pragma mark - Private methods

+ (BOOL)didErrorOccur {
	uint32_t random = arc4random_uniform(100u);
	return (random % 2u == 0u);
}

#pragma mark - Protocol conformance
#pragma mark - <AASEmployeeServiceProtocol>

- (void)receiveAllEmployees {
	AASEmployee *employee1 = [[AASEmployee alloc] initWithName:@"Anthony Hubbard"];
	AASEmployee *employee2 = [[AASEmployee alloc] initWithName:@"Christopher Joseph"];
	AASEmployee *employee3 = [[AASEmployee alloc] initWithName:@"Robert Lynch"];
	AASEmployee *employee4 = [[AASEmployee alloc] initWithName:@"Harry Newman"];
	AASEmployee *employee5 = [[AASEmployee alloc] initWithName:@"Kenneth Stanley"];

	NSArray<AASEmployee *> *result = @[ employee1, employee2, employee3, employee4, employee5 ];

	NSDictionary *errorInfo = @{NSLocalizedDescriptionKey : @"An error occurred while receiving the list of employees"};
	NSError *receivingError = [NSError errorWithDomain:AASEmployeeServiceErrorDomain code:0 userInfo:errorInfo];

	BOOL didErrorOccur = [[self class] didErrorOccur];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		if (didErrorOccur) {
			[self.delegate service:self didReceiveError:receivingError];
		} else {
			[self.delegate service:self didReceiveAllEmployees:result];
		}
	});
}

@end

NS_ASSUME_NONNULL_END
