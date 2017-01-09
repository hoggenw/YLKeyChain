//
//  YLKeyChain.h
//  YLKeyChain
//
//  Created by 王留根 on 17/1/5.
//  Copyright © 2017年 ios-mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLKeyChain : NSObject

+ (void)savePassWord:(NSString *)password;

+ (id)readToken;

+ (void)deleteToken;

@end
