//
//  ViewController.m
//  MultiThread
//
//  Created by IanChen on 2023/6/6.
//

#import "ViewController.h"
#import "SLPerson.h"
#import <libkern/OSAtomic.h>

@interface ViewController ()
@property (assign, atomic) NSInteger totalTicket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)test {
    NSLog(@"2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        [self performSelector:@selector(test) withObject:nil afterDelay:0];
        NSLog(@"3");
    });
}




@end
