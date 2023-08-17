//
//  SLPerson.m
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import "SLPerson.h"

@implementation SLPerson
+ (void)initialize {
    NSLog(@"%@ %s", [self class], __func__);
}

- (void)run {
    NSLog(@"SLPerson-- Run");
}
@end
