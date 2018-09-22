//
//  AASEmployeeListView.m
//  StateMachineExample
//
//  Created by Aleksandr Sychev on 22.09.2018.
//  Copyright © 2018 Aleksandr Sychev. All rights reserved.
//

#import "AASEmployeeListView.h"

#import "AASEmployeeListViewOutput.h"

#import "AASEmployeeListTableCell.h"
#import "AASEmployee.h"

NS_ASSUME_NONNULL_BEGIN

@interface AASEmployeeListView ()

@property (nonatomic, nullable, copy) NSArray<AASEmployee *> *employees;

@end

@implementation AASEmployeeListView

#pragma mark - Lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didLoadView];
}

#pragma mark - Actions

- (IBAction)reload:(id)sender {
	[self.output reloadEmployees];
}

#pragma mark - Protocol conformance
#pragma mark - <AASEmployeeListViewInput>

- (void)showEmployees:(NSArray<AASEmployee *> *)employees {
	self.employeesTableView.hidden = NO;
	self.errorLabel.hidden = YES;
	self.repeatLoadingButton.hidden = YES;

	self.employees = employees;
	[self.employeesTableView reloadData];

	self.errorLabel.text = nil;
}

- (void)showError:(NSError *)error {
	self.employeesTableView.hidden = YES;
	self.errorLabel.hidden = NO;
	self.repeatLoadingButton.hidden = NO;

	self.employees = nil;
	[self.employeesTableView reloadData];

	self.errorLabel.text = error.localizedDescription;
}

- (void)showLoadingIndicator {
	self.loadingIndicator.hidden = NO;
	self.employeesTableView.hidden = YES;
	self.errorLabel.hidden = YES;
	self.repeatLoadingButton.hidden = YES;
}

- (void)hideLoadingIndicator {
	self.loadingIndicator.hidden = YES;
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (NSInteger)self.employees.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	AASEmployeeListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AASEmployeeListTableCell" forIndexPath:indexPath];
	cell.nameLabel.text = self.employees[(NSUInteger)indexPath.row].name;

	return cell;
}

@end

NS_ASSUME_NONNULL_END
