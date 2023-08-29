//
//  SLBlueView.m
//  HitTest
//
//  Created by ianslchen on 2023/8/21.
//

#import "SLBlueView.h"

@implementation SLBlueView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@, %s", [self class], __func__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@, %s", [self class], __func__);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@, %s", [self class], __func__);
}
@end
