//
//  SLProxy.m
//  RunTime
//
//  Created by ianslchen on 2023/8/15.
//

#import "SLProxy.h"

@implementation SLProxy
+ (instancetype)proxyWithTarget:(id)target {
    SLProxy *proxy = [SLProxy alloc];
    proxy.target = target;
    return proxy;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}
@end
