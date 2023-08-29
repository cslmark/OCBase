//
//  SLPerson.m
//  MRC
//
//  Created by ianslchen on 2023/8/19.
//

#import "SLPerson.h"

@implementation SLPerson
- (void)setDog:(SLDog *)dog {
    if (_dog != dog) {
        [_dog release];
        _dog = dog;
        [dog retain];
    }
}

- (void)setName:(NSString *)name {
    if (_name == name) {
        [_name release];
        _name = name;
        [name retain];
    }
}

- (void)dealloc {
    self.name = nil;
    self.dog = nil;
    [super dealloc];
    NSLog(@"SLPerson dealloc");
}
@end
