# LJZipArchive
压缩和解压缩文件

引入头文件
#import "LJZipArchive.h"
#import "LJZipArchive+LJ.h"

使用方法

 //解压缩文件
 /*
 zipPath 是压缩文件的全路径
 destinationPath 解压到哪个文件夹
 */
 [LJZipArchive unzipFileAtPath:zipPath toDestination:destinationPath];
 //压缩文件
 /*
 shi_er.zip 是压缩成此文件
 zippedPath 是全路径
 */
   NSString *zippedPath = [path stringByAppendingPathComponent:@"shi_er.zip"];
   NSArray *inputPaths = [NSArray arrayWithObjects:
                               [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"],
                               [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"],
                               [[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"],
                               nil];
   [LJZipArchive createZipFileAtPath:zippedPath withFilesAtPaths:inputPaths];
