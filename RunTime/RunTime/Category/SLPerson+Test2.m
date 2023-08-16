//
//  SLPerson+Test2.m
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import "SLPerson+Test2.h"
#import <objc/runtime.h>

@implementation SLPerson (Test2)
+ (void)load {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        Method originMethod = class_getInstanceMethod([self class], @selector(run));
        IMP originImp = method_getImplementation(originMethod);
        Method newMethod = class_getInstanceMethod([self class], @selector(sl_testRun2));
        IMP newImp = method_getImplementation(newMethod);
        NSLog(@"[Test2] originImp = %p, newImp = %p", originImp, newImp);
        method_exchangeImplementations(originMethod, newMethod);
    });
}

- (void)sl_testRun2 {
    NSLog(@"sl_testRun2");
}
@end
