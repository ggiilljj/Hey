//
//  ContactsViewModel.m
//  Hey
//
//  Created by Ascen on 2017/5/20.
//  Copyright © 2017年 Ascen. All rights reserved.
//

#import "ContactsViewModel.h"
#import "UserManager.h"
#import "Store.h"

@implementation ContactsViewModel

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (RACCommand *)fetchContactsCommand {
    if (!_fetchContactsCommand) {
        _fetchContactsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            User *user = [Store sharedStore].userSignal.first;
            return [[[UserManager sharedManager] fetchContactsWithUserId:[user.Id stringValue]] doNext:^(id  _Nullable x) {
                self.contacts = x;
            }];
        }];
    }
    return _fetchContactsCommand;
}

- (NSString *)nameWithIndex:(NSUInteger)index {
    User *user = self.contacts[index];
    return user.name;
}

- (NSString *)avatarWithIndex:(NSUInteger)index {
    User *user = self.contacts[index];
    return user.avatar;
}


@end
