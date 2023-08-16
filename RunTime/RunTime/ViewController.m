//
//  ViewController.m
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import "ViewController.h"
#import "SLKVCObject.h"

@interface ViewController ()
@property (nonatomic, strong) SLKVCObject *object;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

static void *NameContext = &NameContext;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.object = [[SLKVCObject alloc] init];
    NSLog(@"self = %@", [self class]);
    [self addObserver:self forKeyPath:@"object.name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NameContext];
    [self addObserver:self forKeyPath:@"object.name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NameContext];
    NSLog(@"self = %@", [self class]);
    self.queue = dispatch_queue_create("测试线程", DISPATCH_QUEUE_SERIAL);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"NSThread = %@", [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"Dealloc =======");
    [self removeObserver:self forKeyPath:@"object.name" context:NameContext];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    int random = arc4random() % 200 + 1;
    NSString *randomStr = [NSString stringWithFormat:@"%d", random];
    dispatch_async(self.queue, ^{
        NSLog(@"Triggle NSThread = %@", [NSThread currentThread]);
        [self.object setValue:randomStr forKey:@"name"];
        [self.object sayName];
    });
}





@end
