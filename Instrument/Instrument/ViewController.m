//
//  ViewController.m
//  Instrument
//
//  Created by ianslchen on 2023/8/20.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    method1();
    method2(YES);
    method1();
}

void method3(void) {
    
}

void method2(BOOL shouldCallMethod3) {
    if (shouldCallMethod3) {
        method3();
    }
}

void method1(void) {
    method2(NO);
    method3();
    method2(NO);
}

@end
