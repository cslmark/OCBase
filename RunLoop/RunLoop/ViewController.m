//
//  ViewController.m
//  RunLoop
//
//  Created by ianslchen on 2023/8/4.
//

#import "ViewController.h"
#import "SLThread.h"

@interface ViewController ()
@property (nonatomic, strong) SLThread *myThread;
@property (nonatomic, strong) NSPort *port;
@property (nonatomic, assign) BOOL cancelThread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runloop 常驻线程";
    self.view.backgroundColor = [UIColor greenColor];
    self.port = [[NSPort alloc] init];
    __weak typeof(self) weakSelf = self;
    self.myThread = [[SLThread alloc] initWithBlock:^{
        NSLog(@"%@----begin----", [NSThread currentThread]);
        [[NSRunLoop currentRunLoop] addPort:weakSelf.port forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
//        while (weakSelf && weakSelf.cancelThread == NO) {
//            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//        }
        
        NSLog(@"%@----end----", [NSThread currentThread]);
    }];
    [self.myThread start];
}

- (void)dealloc {
    NSLog(@"ViewController Dealloc");
    [self stopRunLoop];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(task) onThread:self.myThread withObject:nil waitUntilDone:[NSDate distantFuture]];
}

- (void)task {
    NSLog(@"myTask doing");
}

- (void)stopRunLoop {
    [self performSelector:@selector(__stopRunLoop) onThread:self.myThread withObject:nil waitUntilDone:YES];
    NSLog(@"stop RunLoop");
}

- (void)__stopRunLoop {
//    self.cancelThread = YES;
    [[NSRunLoop currentRunLoop] removePort:self.port forMode:NSDefaultRunLoopMode];
    CFRunLoopStop(CFRunLoopGetCurrent());
}



@end
