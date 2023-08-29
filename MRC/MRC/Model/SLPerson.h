//
//  SLPerson.h
//  MRC
//
//  Created by ianslchen on 2023/8/19.
//

#import <Foundation/Foundation.h>
#import "SLDog.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLPerson : NSObject
@property (nonatomic, copy, nullable) NSString *name;
@property (nonatomic, strong, nullable) SLDog *dog;
@end

NS_ASSUME_NONNULL_END
