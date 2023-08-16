//
//  ViewController.m
//  OCBase
//
//  Created by ianslchen on 2023/8/3.
//

#import "ViewController.h"
#import "SLStudent.h"
#import <objc/runtime.h>
#import <objc/objc.h>


@interface ViewController ()
@property (nonatomic, strong) SLStudent *student;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BOOL re1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];       // YES
    BOOL re2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];     // NO
    BOOL re3 = [(id)[SLPerson class] isKindOfClass:[SLPerson class]];       // NO
    BOOL re4 = [(id)[SLPerson class] isMemberOfClass:[SLPerson class]];     // NO
    NSLog(@" re1 :%hhd\n re2 :%hhd\n re3 :%hhd\n re4 :%hhd\n",re1,re2,re3,re4);

    BOOL re5 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];       // YES
    BOOL re6 = [(id)[NSObject alloc] isMemberOfClass:[NSObject class]];     // YES
    BOOL re7 = [(id)[SLPerson alloc] isKindOfClass:[SLPerson class]];       // YES
    BOOL re8 = [(id)[SLPerson alloc] isMemberOfClass:[SLPerson class]];     // YES
    NSLog(@" re5 :%hhd\n re6:%hhd\n re7 :%hhd\n re8:%hhd\n",re5,re6,re7,re8);
}

@end
