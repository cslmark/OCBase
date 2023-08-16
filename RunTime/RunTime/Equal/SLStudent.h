//
//  SLStudent.h
//  RunTime
//
//  Created by ianslchen on 2023/6/28.
//

#import <Foundation/Foundation.h>
#import "SLPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLStudent : SLPerson
@property (nonatomic, assign) NSUInteger ID;
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
