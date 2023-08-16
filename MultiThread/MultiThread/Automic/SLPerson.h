//
//  SLPerson.h
//  MultiThread
//
//  Created by ianslchen on 2023/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLPerson : NSObject
@property (atomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (atomic, assign) int atomicAge;
@end

/*
atomic不是绝对的线程安全。atomic的本意是指属性的存取方法是线程安全的，并不保证整个对象是线程安全的。
###什么是线程不安全？
线程的不安全是由于多线程访问和修改共享资源而引起的不可预测的结果(有可能crash)。可以简单理解为我们拿到的值是错的。
 */


NS_ASSUME_NONNULL_END
