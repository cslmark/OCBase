//
//  ViewController.m
//  MRC
//
//  Created by ianslchen on 2023/8/19.
//

#import "ViewController.h"
#import "SLPerson.h"
#include <os/signpost.h>
#import <os/signpost.h>
#import "SLSignPost.h"

@interface ViewController ()
@property (nonatomic, strong) SLPerson *person;
@end

extern void _objc_autoreleasePoolPrint(void);

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addObserver]; // 添加监听者
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"ViewDidLoad Exit");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"==== [touchesBegan] 我要开始开始执行了 ====");
    
    for (int i = 0; i < 100000; i++) {
        UIView *view = [[UIView alloc] init];
        NSLog(@"view = %p, view[%d]", view, view.retainCount);
        [view release];
    }
    NSLog(@"==== [touchesBegan] 快出来，我执行完了 ====");
}

- (void)test {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"风景图.jpeg" ofType:nil];
    UIImage *image = [UIImage imageNamed:@"ks_sogn_tag_free"];
    for(int i = 0; i < 10000; i++) {
        @autoreleasepool {
            NSData *data = [NSData dataWithContentsOfFile:imagePath];
            CIImage *image = [CIImage imageWithData:data];
        }
    }
    NSData *data = [NSData dataWithContentsOfFile:imagePath];
    NSObject *obj = [[[NSObject alloc] init] autorelease];
    NSLog(@"image = %p", image);
}

// 添加一个监听者
- (void)addObserver {
 
 // 1. 创建监听者
 /**
  *  创建监听者
  *
  *  @param allocator#>  分配存储空间
  *  @param activities#> 要监听的状态
  *  @param repeats#>    是否持续监听
  *  @param order#>      优先级, 默认为0
  *  @param observer     观察者
  *  @param activity     监听回调的当前状态
  */

 os_log_t runloopLogger = [SLSignPost createWithBundleId:"com.sldemo.runloop" key:"runLoop"];
 CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
     
     /*
      kCFRunLoopEntry = (1UL << 0),          进入工作
      kCFRunLoopBeforeTimers = (1UL << 1),   即将处理Timers事件
      kCFRunLoopBeforeSources = (1UL << 2),  即将处理Source事件
      kCFRunLoopBeforeWaiting = (1UL << 5),  即将休眠
      kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
      kCFRunLoopExit = (1UL << 7),           退出RunLoop
      kCFRunLoopAllActivities = 0x0FFFFFFFU  监听所有事件
      */
     switch (activity) {
         case kCFRunLoopEntry:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopEntry"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopEntry"];
             NSLog(@"[RunLoop] 进入");
             break;
         case kCFRunLoopBeforeTimers:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopBeforeTimers"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopBeforeTimers"];
             NSLog(@"[RunLoop] 即将处理Timer事件");
             break;
         case kCFRunLoopBeforeSources:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopBeforeSources"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopBeforeSources"];
             NSLog(@"[RunLoop] 即将处理Source事件");
             break;
         case kCFRunLoopBeforeWaiting:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopBeforeWaiting"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopBeforeWaiting"];
             NSLog(@"[RunLoop] 即将休眠");
             break;
         case kCFRunLoopAfterWaiting:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopAfterWaiting"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopAfterWaiting"];
             NSLog(@"[RunLoop] 被唤醒");
             break;
         case kCFRunLoopExit:
             [SLSignPost beginTime:runloopLogger message:@"kCFRunLoopExit"];
             [SLSignPost endTime:runloopLogger message:@"kCFRunLoopExit"];
             NSLog(@"[RunLoop] 退出RunLoop");
             break;
         default:
             break;
     }
 });
 
 // 2. 添加监听者
 /**
  *  给指定的RunLoop添加监听者
  *
  *  @param rl#>       要添加监听者的RunLoop
  *  @param observer#> 监听者对象
  *  @param mode#>     RunLoop的运行模式, 填写默认模式即可
  */
 CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}
 



@end
