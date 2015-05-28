//
//  LJZipArchive+LJ.m
//  解压缩
//
//  Created by liujunjie on 15-5-28.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJZipArchive+LJ.h"

@implementation LJZipArchive (LJ)

+ (NSString *)documentPath {
    return  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
+ (BOOL)deletedFile:(NSString *)name {
    NSString *path = [[[self class] documentPath] stringByAppendingPathComponent:name];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
       BOOL isSuccess = [fileManager removeItemAtPath:path error:&error];
        if (isSuccess&&error == nil) {
            return YES;
        }else return NO;
        
    }else return YES;
}
@end
