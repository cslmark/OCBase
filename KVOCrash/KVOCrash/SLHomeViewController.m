//
//  SLHomeViewController.m
//  KVOCrash
//
//  Created by ianslchen on 2023/8/16.
//

#import "SLHomeViewController.h"
#import "ViewController.h"
#import "SLPerson.h"

@interface SLHomeViewController ()
@property (nonatomic, strong) SLPerson *person;
- (IBAction)jumpClick:(UIButton *)sender;
@end

@implementation SLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[SLPerson alloc] init];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    int random = arc4random() % 200 + 1;
    NSString *randomStr = [NSString stringWithFormat:@"%d", random];
    NSLog(@"Home Triggle NSThread = %@", [NSThread currentThread]);
    self.person.name = randomStr;
}



- (IBAction)jumpClick:(UIButton *)sender {
    ViewController *VC = [[ViewController alloc] init];
    VC.person = self.person;
    [self.navigationController pushViewController:VC animated:YES];
}
@end
