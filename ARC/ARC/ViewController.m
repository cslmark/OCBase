//
//  ViewController.m
//  ARC
//
//  Created by ianslchen on 2023/8/19.
//

#import "ViewController.h"

extern void _objc_autoreleasePoolPrint(void);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *personName1 = nil;
    __weak NSString *personName2 = nil;
    __unsafe_unretained NSString *personName3 = nil;
    
    @autoreleasepool {
        UIView *view = [[UIView alloc] init];
        _objc_autoreleasePoolPrint();
    }
    NSLog(@"personName2 = %@", personName2);
}


@end
