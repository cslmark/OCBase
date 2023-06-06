//
//  ViewController.m
//  MultiThread
//
//  Created by IanChen on 2023/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_queue_create("并发线程", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"任务一 %@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"任务二 %@", [NSThread currentThread]);
        });
        NSLog(@"任务三 %@", [NSThread currentThread]);
    });
}

@end
