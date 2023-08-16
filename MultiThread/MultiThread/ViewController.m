//
//  ViewController.m
//  MultiThread
//
//  Created by IanChen on 2023/6/6.
//

#import "ViewController.h"
#import "SLPerson.h"

@interface ViewController ()
@property (nonatomic, strong) SLPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = @{@"111": @"111", @"222" : @"222"};
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    mutableDict[@"111"] = nil;
    NSLog(@"dict = %@", dict);
    NSLog(@"mutableDict = %@", mutableDict);
    
   
    BOOL boolValue = [@"apple" boolValue];
    NSLog(@"true to bool %d",   boolValue);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)testConcurrentQueue {
    dispatch_queue_t queue = dispatch_queue_create("并发线程", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"任务一 %@", [NSThread currentThread]);
        dispatch_sync(queue, ^{        // 不具备开线程能力，所以这样也是并行
            NSLog(@"任务二 %@", [NSThread currentThread]);
        });
        NSLog(@"任务三 %@", [NSThread currentThread]);
    });
}
/*
 2023-07-14 10:50:59.950120+0800 MultiThread[7285:60673] 任务一 <NSThread: 0x6000012c2640>{number = 8, name = (null)}
 2023-07-14 10:50:59.950281+0800 MultiThread[7285:60673] 任务二 <NSThread: 0x6000012c2640>{number = 8, name = (null)}
 2023-07-14 10:50:59.950367+0800 MultiThread[7285:60673] 任务三 <NSThread: 0x6000012c2640>{number = 8, name = (null)}
 */


/// 说明atomic 并不能保证线程安全，atomic和线程安全是两个概念
- (void)testAutomic {
    dispatch_queue_t queue = dispatch_queue_create("并发线程", DISPATCH_QUEUE_CONCURRENT);
    self.person = [[SLPerson alloc] init];
    self.person.age = 0;
    self.person.atomicAge = 0;
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10000; i++) {
//            NSLog(@"1======%d", i);
//            self.person.age += 1;
//            NSLog(@"slice1====[age: %d]", self.person.age);
//        }
//    });
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10000; i++) {
//            NSLog(@"2======%d", i);
//            self.person.age += 1;
//            NSLog(@"slice2====[age: %d]", self.person.age);
//        }
//    });
    // 最后输出结果 19999, 20000, 19996 并不是固定的
    
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10000; i++) {
//            NSLog(@"3======%d", i);
//            self.person.atomicAge += 1;
//            NSLog(@"slice3====[atomic: %d]", self.person.atomicAge);
//        }
//    });
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10000; i++) {
//            NSLog(@"4======%d", i);
//            self.person.atomicAge += 1;
//            NSLog(@"slice4====[atomic: %d]", self.person.atomicAge);
//        }
//    });
    // 最后输出  19999 19997 19999
}

- (void)automaticNotSafeCrashTest {
    dispatch_queue_t queue = dispatch_queue_create("并发线程", DISPATCH_QUEUE_CONCURRENT);
    self.person = [[SLPerson alloc] init];
    dispatch_async(queue, ^{
        for (int i = 0; i < 100000; i ++) {
            if (i % 2 == 0) {
                self.person.name = @"a very long string";
            }
            else {
                self.person.name = @"string";
            }
            NSLog(@"Thread A: %@\n", self.person.name);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 100000; i ++) {
            if (self.person.name.length >= 10) {
                NSString* subStr = [self.person.name substringWithRange:NSMakeRange(0, 10)];
            }
            NSLog(@"Thread B: %@\n", self.person.name);
        }
    });
}



@end
