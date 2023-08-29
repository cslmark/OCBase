//
//  ViewController.m
//  KVOCrash
//
//  Created by ianslchen on 2023/8/16.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) dispatch_queue_t queue;
@end

static void *NameContext = &NameContext;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor systemPinkColor];
    self.person.tempArray = [[NSMutableArray alloc] init];
    NSString *tempArrayStr = NSStringFromSelector(@selector(tempArray));
    [self.person addObserver:self forKeyPath:tempArrayStr options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NameContext];
    self.queue = dispatch_queue_create("测试线程", DISPATCH_QUEUE_SERIAL);
}

- (void)dealloc {
    dispatch_async(self.queue, ^{
        usleep(0.01);
        self.person.name = @"1234455666";
    });
    [self.person removeObserver:self forKeyPath:@"name"];
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    int random = arc4random() % 200 + 1;
    NSString *randomStr = [NSString stringWithFormat:@"%d", random];
    dispatch_async(self.queue, ^{
        NSLog(@"Triggle NSThread = %@", [NSThread currentThread]);
        [self.person.tempArray addObject:randomStr];
//        self.person.tempArray = nil;
        
        //这一步特别重要
            NSMutableArray *tempArray = [self.person mutableArrayValueForKey:NSStringFromSelector(@selector(tempArray))];
            if (random % 3 == 0) {//插入一条
                [tempArray addObject:[NSString stringWithFormat:@"NewData- %tu",random]];
            } else if (random % 3 == 1) {//修改一条
                tempArray[0] = [NSString stringWithFormat:@"NewData- %tu",random];
            } else if (random % 3 == 2) {
                [tempArray removeAllObjects];
            }
    });
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == NameContext) {
        NSLog(@"observe NSThread = %@", [NSThread currentThread]);
        NSLog(@"keyPath = %@, object = %@", keyPath, object);
        NSLog(@"change = %@", change);
    }
}


@end
