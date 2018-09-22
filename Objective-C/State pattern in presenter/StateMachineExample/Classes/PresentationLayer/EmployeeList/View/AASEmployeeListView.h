//
//  AASEmployeeListView.h
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AASEmployeeListViewInput.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AASEmployeeListViewOutput;

@interface AASEmployeeListView : UIViewController <AASEmployeeListViewInput, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<AASEmployeeListViewOutput> output;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, strong) IBOutlet UITableView *employeesTableView;
@property (nonatomic, strong) IBOutlet UIButton *repeatLoadingButton;
@property (nonatomic, strong) IBOutlet UILabel *errorLabel;

- (IBAction)reload:(id)sender;

@end

NS_ASSUME_NONNULL_END

