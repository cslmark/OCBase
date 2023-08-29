//
//  SLBaseView.m
//  HitTest
//
//  Created by ianslchen on 2023/8/21.
//

#import "SLBaseView.h"

@implementation SLBaseView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 前序遍历
    NSLog(@"self = %@", [self class]);
    UIView *hitView = [super hitTest:point withEvent:event];
    NSLog(@"self = %@, hitView = %@,", [hitView class], [self class]);
    return hitView;
}

@end
