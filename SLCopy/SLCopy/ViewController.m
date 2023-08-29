//
//  ViewController.m
//  SLCopy
//
//  Created by ianslchen on 2023/8/18.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *haha = [NSString stringWithFormat:@"abcdefghijk"];
    NSString *haha2 = [NSString stringWithFormat:@"abcdefghijk"];
    NSLog(@"(haha isEqualToString:haha2) = %d, (haha == haha2) = %d", [haha isEqualToString:haha2], haha == haha2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            self.name = [NSString stringWithFormat:@"abc"];
            NSLog(@"11111");
        });
    }
}




@end
