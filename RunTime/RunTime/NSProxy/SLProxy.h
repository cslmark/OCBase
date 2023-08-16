//
//  SLProxy.h
//  RunTime
//
//  Created by ianslchen on 2023/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLProxy : NSProxy
@property (nonatomic, weak) id target;
+ (instancetype)proxyWithTarget:(id)targe;
@end

NS_ASSUME_NONNULL_END
