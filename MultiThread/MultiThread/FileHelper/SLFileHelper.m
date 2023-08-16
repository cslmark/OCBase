//
//  SLFileHelper.m
//  MultiThread
//
//  Created by ianslchen on 2023/6/28.
//

#import "SLFileHelper.h"

@interface SLFileHelper ()
@property (nonatomic, strong) dispatch_queue_t fileHandleQueue;
@end

@implementation SLFileHelper
- (instancetype)init {
    if (self = [super init]) {
        _fileHandleQueue = dispatch_queue_create("highlightQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}


@end
