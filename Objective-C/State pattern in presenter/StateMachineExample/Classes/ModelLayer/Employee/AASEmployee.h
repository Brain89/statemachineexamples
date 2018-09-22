//
//  AASEmployee.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AASEmployee : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
