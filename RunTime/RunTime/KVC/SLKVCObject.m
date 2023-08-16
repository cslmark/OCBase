//
//  SLKVCObject.m
//  RunTime
//
//  Created by ianslchen on 2023/8/16.
//

#import "SLKVCObject.h"

@interface SLKVCObject ()
{
    NSString *name;
    NSArray *_array;
    NSArray *array;
}

@end

@implementation SLKVCObject
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

- (void)sayName {
    NSLog(@"我的名字: %@", name);
}

- (void)sayArray {
    NSLog(@"array: %@", array);
    NSLog(@"_array: %@", _array);
}
@end

