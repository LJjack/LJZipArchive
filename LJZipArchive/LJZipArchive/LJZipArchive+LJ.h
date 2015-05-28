//
//  LJZipArchive+LJ.h
//  解压缩
//
//  Created by liujunjie on 15-5-28.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "LJZipArchive.h"

@interface LJZipArchive (LJ)
/**
 *沙盒路径
 */
+ (NSString *)documentPath;
/**
 *删除‘name’文件，name要包含后缀名
 */
+ (BOOL)deletedFile:(NSString *)name;
@end
