//
//  ViewController.m
//  LJZipArchive
//
//  Created by liujunjie on 15-5-28.
//  Copyright (c) 2015年 rj. All rights reserved.
//

#import "ViewController.h"
#import "LJZipArchive.h"
#import "LJZipArchive+LJ.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageviewBK = [[UIImageView alloc] init];
    [imageviewBK setFrame:CGRectMake(0, 0, 200, 200)];
    [imageviewBK setCenter:CGPointMake(self.view.center.x, 120)];
    [self.view addSubview:imageviewBK];
    UIButton *fourthButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 500, 300, 50)];
    fourthButton.backgroundColor = [UIColor grayColor];
    [fourthButton setTitle:@"删除压缩文件" forState:UIControlStateNormal];
    [fourthButton addTarget:self action:@selector(fourthButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [fourthButton setHidden:YES];
    [self.view addSubview:fourthButton];
    
    NSString *path = [LJZipArchive documentPath];
    
    NSString *zipPath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"zip"];
    NSString *destinationPath = path;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //解压缩文件
        [LJZipArchive unzipFileAtPath:zipPath toDestination:destinationPath];
        //压缩文件
        NSString *zippedPath = [path stringByAppendingPathComponent:@"shi_er.zip"];
        NSArray *inputPaths = [NSArray arrayWithObjects:
                               [[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"],
                               [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"],
                               [[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"],
                               nil];
        [LJZipArchive createZipFileAtPath:zippedPath withFilesAtPaths:inputPaths];
    });
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        imageviewBK.image = [UIImage imageWithContentsOfFile:[path stringByAppendingPathComponent:@"image/BK.png"]];
        [fourthButton setHidden:NO];
    });
    
    
}
- (void)fourthButtonAction
{
    [LJZipArchive deletedFile:@"shi_er.zip"];
    [LJZipArchive deletedFile:@"image"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
