//
//  SLLabelViewController.m
//  UIBase
//
//  Created by ianslchen on 2023/6/29.
//

#import "SLLabelViewController.h"

@interface SLLabelViewController ()
@property (nonatomic, strong) UILabel *testLabel;
@end

@implementation SLLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testLabel = [[UILabel alloc] init];
    self.testLabel.numberOfLines = 2;
    self.testLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:self.testLabel];
    NSLog(@"testLabel的单行高度为为: %@", @([self.testLabel.font lineHeight]));
    self.testLabel.frame = CGRectMake(20, 100, 100, 100);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.testLabel.text = @"dsjfjasdfjadsjfldsajflasdjflkasjdfjasdflajsdflkjadsfjaldsjfladsjflasd";
    self.testLabel.preferredMaxLayoutWidth = 150;
    [self.testLabel sizeToFit];
    NSLog(@"testLabel的尺寸为: %@", NSStringFromCGSize(self.testLabel.bounds.size));
    self.testLabel.frame = CGRectMake(20, 100, self.testLabel.bounds.size.width, self.testLabel.bounds.size.height);
    
    CGSize size = [self.testLabel.text sizeWithFont:[UIFont systemFontOfSize:14.0f]
                               constrainedToSize:CGSizeMake(150, MAXFLOAT)];
    NSLog(@"testLabel的尺寸New为: %@", NSStringFromCGSize(size));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
