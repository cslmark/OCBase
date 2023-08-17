//
//  ViewController.m
//  Block
//
//  Created by ianslchen on 2023/8/17.
//

#import "ViewController.h"

typedef void(^SLBlock)(int a);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SLBlock block = ^(int a) {
        NSLog(@"a = %d", a);
    };
    block(1);
}

@end
