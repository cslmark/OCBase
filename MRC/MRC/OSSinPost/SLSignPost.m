//
//  SLSignPost.m
//  MRC
//
//  Created by ianslchen on 2023/8/20.
//

#import "SLSignPost.h"


@implementation SLSignPost
+ (os_log_t)createWithBundleId:(const char *)bundleID key:(const char *)key {
    return os_log_create(bundleID, key);
}

+ (void)beginTime:(os_log_t)logger message:(NSString *)message {
    os_signpost_id_t logId = os_signpost_id_generate(logger);
    os_signpost_interval_begin(logger, logId, "RunLoop", "%@", message);
}

+ (void)endTime:(os_log_t)logger message:(NSString *)message {
    os_signpost_id_t logId = os_signpost_id_generate(logger);
    os_signpost_interval_end(logger, logId, "RunLoop", "%@", message);
}

+ (void)maskTime:(os_log_t)logger message:(NSString *)message {
    os_signpost_id_t logId = os_signpost_id_generate(logger);
    os_signpost_interval_begin(logger, logId, "RunLoop", "%@", message);
    os_signpost_interval_end(logger, logId, "RunLoop", "%@", message);
}

@end
