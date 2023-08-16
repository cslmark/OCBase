//
//  SLPerson+Test1.m
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import "SLPerson+Test1.h"
#import <objc/runtime.h>

@implementation SLPerson (Test1)
+ (void)load {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        Method originMethod = class_getInstanceMethod([self class], @selector(run));
        IMP originImp = method_getImplementation(originMethod);
        Method newMethod = class_getInstanceMethod([self class], @selector(sl_testRun1));
        IMP newImp = method_getImplementation(newMethod);
        NSLog(@"[Test1] originImp = %p, newImp = %p", originImp, newImp);
        method_exchangeImplementations(originMethod, newMethod);
    });
}

- (void)sl_testRun1 {
    NSLog(@"sl_testRun1");
}
@end
