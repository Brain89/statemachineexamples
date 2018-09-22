//
//  AASAppDelegate.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASAppDelegate.h"

#import "AASEmployeeListAssembly.h"

NS_ASSUME_NONNULL_BEGIN

@implementation AASAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
	AASEmployeeListAssembly *employeeListAssembly = [AASEmployeeListAssembly new];
	UIViewController *viewController = [employeeListAssembly constructModule];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];

	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	self.window.rootViewController = navigationController;
	[self.window makeKeyAndVisible];

	return YES;
}

@end

NS_ASSUME_NONNULL_END
