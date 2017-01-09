//
//  YLKeyChain.m
//  YLKeyChain
//
//  Created by 王留根 on 17/1/5.
//  Copyright © 2017年 ios-mac. All rights reserved.
//

#import "YLKeyChain.h"

@implementation YLKeyChain

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    // 获得搜索字典
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // 添加新的删除旧的
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    // 添加新的对象到字符串
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    // 查询钥匙串
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    // 配置搜索设置
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}

static NSString * const KEY_IN_KEYCHAIN = @"com.yck.app.allinfo";
// 用来标识密码
static NSString * const KEY_PASSWORD = @"com.yck.app.password";

+ (void)savePassWord:(NSString *)password
{
    NSMutableDictionary *passwordDict = [NSMutableDictionary dictionary];
    [passwordDict setObject:password forKey:KEY_PASSWORD];
    [YLKeyChain save:KEY_IN_KEYCHAIN data:passwordDict];
}

+ (id)readToken
{
    NSMutableDictionary *passwordDict = (NSMutableDictionary *)[YLKeyChain load:KEY_IN_KEYCHAIN];
    return [passwordDict objectForKey:KEY_PASSWORD];
}

+ (void)deleteToken
{
    [YLKeyChain delete:KEY_IN_KEYCHAIN];
}
@end
