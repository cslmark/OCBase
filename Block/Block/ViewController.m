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
    __block typeof(self) weakself = self;
    SLBlock block = ^(int a) {
        NSLog(@"weakSelf = %@", weakself);
    };
    block(1);
}

@end
