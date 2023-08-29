//
//  SLRunloopMonitor.h
//  MRC
//
//  Created by ianslchen on 2023/8/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLRunloopMonitor : NSObject
+ (instancetype)sharedInstance;

///开始监控
- (void)startMonitor;

///停止监控
- (void)stopMonitor;
@end

NS_ASSUME_NONNULL_END
