//
//  SLRunloopMonitor.m
//  MRC
//
//  Created by ianslchen on 2023/8/20.
//

#import "SLRunloopMonitor.h"
#import "SLSignPost.h"

@interface SLRunloopMonitor ()
@property (nonatomic, assign) CFRunLoopObserverRef observer;
@end

@implementation SLRunloopMonitor
+ (instancetype)sharedInstance {
    static SLRunloopMonitor *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[SLRunloopMonitor alloc]init];
    });
    return instance;
}

- (void)startMonitor {        
    os_log_t runloopLogger = [SLSignPost createWithBundleId:"com.sldemo.runloop" key:"runLoop"];
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
                                                                       kCFRunLoopAllActivities,
                                                                       YES,
                                                                       0,
                                                                       ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopEntry"];
                NSLog(@"[RunLoop] 进入");
                break;
            case kCFRunLoopBeforeTimers:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopBeforeTimers"];
                NSLog(@"[RunLoop] 即将处理Timer事件");
                break;
            case kCFRunLoopBeforeSources:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopBeforeSources"];
                NSLog(@"[RunLoop] 即将处理Source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopBeforeWaiting"];
                NSLog(@"[RunLoop] 即将休眠");
                break;
            case kCFRunLoopAfterWaiting:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopAfterWaiting"];
                NSLog(@"[RunLoop] 被唤醒");
                break;
            case kCFRunLoopExit:
                [SLSignPost maskTime:runloopLogger message:@"kCFRunLoopExit"];

                NSLog(@"[RunLoop] 退出RunLoop");
                break;
            default:
                break;
        }
    });

    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    self.observer = observer;
}


- (void)stopMonitor {
    if (!self.observer) {
        return;
    }
    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), self.observer, kCFRunLoopDefaultMode);
    CFRelease(self.observer);
}


@end
