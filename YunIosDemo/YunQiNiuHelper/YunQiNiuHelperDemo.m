//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunQiNiuHelperDemo.h"
#import "YunQiniuHelper.h"
#import "YunQiniuUploadConfig.h"

@interface YunQiNiuHelperDemo () <YunQiniuUploadImageDelegate> {
}

@end

@implementation YunQiNiuHelperDemo

- (void)demo {
    YunQiniuUploadConfig.instance.delegate = self;

    id file = nil; // UIImage 或者 NSData
    id fileKey = nil; // 可以指定 key，不指定则由七牛生成，建议 nil，避免重复文件覆盖。
    [YunQiniuUploadHelper uploadFile:file
                             fileKey:fileKey
                            progress:nil
                             success:^(YunQiniuFileModel *file) {
                                 // file 上传成功的结果
                             }
                             failure:^(NSError *err) {

                             }];


    NSArray * files = nil; // 文件数组，UIImage 或者 NSData
    NSArray<NSString *> *fileKeys = nil; // key 数组， 可以指定 key，不指定则由七牛生成，建议 nil，避免重复文件覆盖。
    [YunQiniuUploadHelper uploadFiles:files
                             fileKeys:fileKeys
                            progress:nil
                             success:^(NSArray<YunQiniuFileModel *> *files) {
                                 // files 上传成功的结果
                             }
                             failure:^(NSError *err) {

                             }];
}

#pragma mark - YunQiniuUploadImageDelegate

- (void)getQnPara:(getQnParaBlock)rst {
    NSString *token; /// 从后台获取上传 token
    if (rst) {
        rst(YES, token, nil);
    }
}

/// 上传成功后，根据 resp 获取 url
/// 上传结果也有 resp 的值，也可以自己从结果取
- (NSString *)getFileUrlByResp:(NSDictionary *)resp {
    return resp[@"fileUrl"];
}



@end