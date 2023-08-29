//
//  SLSignPost.h
//  MRC
//
//  Created by ianslchen on 2023/8/20.
//

#import <Foundation/Foundation.h>
#import <os/signpost.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLSignPost : NSObject
+ (os_log_t)createWithBundleId:(const char *)bundleID key:(const char *)key;
+ (void)beginTime:(os_log_t)logger message:(NSString *)message;
+ (void)endTime:(os_log_t)logger message:(NSString *)message;
+ (void)maskTime:(os_log_t)logger message:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
