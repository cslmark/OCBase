//
//  SLImageViewController.m
//  UIBase
//
//  Created by ianslchen on 2023/6/20.
//

#import "SLImageViewController.h"

@interface SLImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
- (IBAction)largerClick:(UIButton *)sender;
- (IBAction)smallClick:(UIButton *)sender;
@end

@implementation SLImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(0, 150, 223, 223);
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = [UIImage imageNamed:@"100X100.jpeg"];
    self.imageView.image = image;
    [self.view addSubview:self.imageView];
    
    NSDictionary *dict = @{@"123" : @"123"};
    NSLog(@"dict = %@", dict[nil]);
}


- (IBAction)smallClick:(UIButton *)sender {
    self.imageView.frame = CGRectMake(0, 150, 223, 223);
    [self.class applyRoundCornerForView:self.imageView radius:8 byRoundingCorners:UIRectCornerAllCorners];
}

- (IBAction)largerClick:(UIButton *)sender {
    self.imageView.frame = CGRectMake(0, 150, 300, 300);
    [self.class applyRoundCornerForView:self.imageView radius:8 byRoundingCorners:UIRectCornerAllCorners];
}

+ (void)applyRoundCornerForView:(UIView *)view radius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners
{
    UIBezierPath *cornerMaskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *cornerMaskLayer = [[CAShapeLayer alloc] init];
    cornerMaskLayer.frame = view.bounds;
    cornerMaskLayer.path = cornerMaskPath.CGPath;
    view.layer.mask = cornerMaskLayer;
}
@end
