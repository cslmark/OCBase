//
//  ViewController.m
//  OSSignPost
//
//  Created by ianslchen on 2023/8/20.
//

#import "ViewController.h"
#import <os/signpost.h>
#import <sys/kdebug_signpost.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"================= 开始 ====================");
//    kdebug_signpost_start(10, 0, 0, 0, 1);
    os_log_t viewLog = os_log_create("com.ossignpost.sldemo", "SLTest");
    os_signpost_id_t logId = os_signpost_id_generate(viewLog);
    os_signpost_interval_begin(viewLog, logId, "viewDidLoad");
    sleep(1.0);
    os_signpost_interval_end(viewLog, logId, "viewDidLoad");
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"================= 结束 ====================");
//    kdebug_signpost_end(10, 0, 0, 0, 1);
}


@end
