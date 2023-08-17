//
//  SLStudent.m
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import "SLStudent.h"

@implementation SLStudent
+ (void)initialize {
    NSLog(@"%@ %s", [self class], __func__);
}

- (void)run {
    [super run];
    NSLog(@"super = %p, self = %p", [super class], [self class]);
    NSLog(@"student run");
}

- (void)dealloc {
    NSLog(@"Student Dealloc");
}

- (BOOL)isEqual:(id)object {
    // 如果是地址相等
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    SLStudent *tempStudent = (SLStudent *)object;
    if (self.ID == tempStudent.ID && [self.name isEqualToString:tempStudent.name]) {
        return YES;
    }
    return NO;
}

/// 用于NSSet里面添加元素的去重，这里的ID是int怎么进行hash,先转成NSNumber来进行判断
- (NSUInteger)hash {
    return [self.name hash] ^ [@(self.ID) hash];
}
@end
