//
//  Viewer.h
//  Hey
//
//  Created by Ascen on 2017/4/19.
//  Copyright © 2017年 Ascen. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "User.h"
#import "ChatRecord.h"
#import "ChatSession.h"
#import "SIMPConnection.h"

@interface Viewer : MTLModel <MTLJSONSerializing>

+ (instancetype)createWithViewer:(Viewer *)old key:(NSString *)key value:(id)value;

@property (nonatomic, strong, readonly) User *user;
@property (nonatomic, copy, readonly) NSString *token;
@property (nonatomic, copy, readonly) NSArray *chatSessions;
@property (nonatomic, copy, readonly) NSArray *chatRecords;


@end
