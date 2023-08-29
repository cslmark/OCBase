//
//  SLYelloView.m
//  HitTest
//
//  Created by ianslchen on 2023/8/21.
//

#import "SLYelloView.h"
@interface SLYelloView ()
@property (nonatomic, strong) UITapGestureRecognizer *ges;
@end

@implementation SLYelloView
- (void)awakeFromNib {
    self.ges = [[UITapGestureRecognizer alloc] init];
    self.ges.numberOfTapsRequired = 1;
    self.ges.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:self.ges];
    [self.ges addTarget:self action:@selector(gesAction:)];
    [super awakeFromNib];
}

- (void)gesAction:(UITapGestureRecognizer *)ges {
    NSLog(@"SLYellow 点击事件 [%@]", [ges.view class]);
}


@end
