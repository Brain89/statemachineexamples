//
//  AASEmployee.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployee.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AASEmployee

#pragma mark - Lifecycle

- (instancetype)initWithName:(NSString *)name {
	self = [super init];
	if (self) {
		_name = [name copy];
	}

	return self;
}

@end

NS_ASSUME_NONNULL_END
