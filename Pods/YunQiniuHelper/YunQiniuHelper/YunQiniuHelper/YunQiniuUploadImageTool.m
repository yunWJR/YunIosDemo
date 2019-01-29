//
// Created by 王健 on 16/5/13.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunQiniuUploadConfig.h"
#import "YunQiniuUploadImageTool.h"
#import "QNResolver.h"
#import "YunQiniuDefine.h"

@implementation YunQiniuUploadImageTool

+ (void)setDelegate:(id)tg {
    YunQiniuUploadConfig.instance.delegate = tg;
}

+ (void)getQnPara:(getQnParaBlock)rst {
    if (YunQiniuUploadConfig.instance.delegate &&
        [YunQiniuUploadConfig.instance.delegate respondsToSelector:@selector(getQnPara:)]) {
        [YunQiniuUploadConfig.instance.delegate getQnPara:rst];
    }
    else {
        rst(NO, nil, nil);
    }
}

// 上传单张图片
+ (void)uploadImage:(id)image
           progress:(QNUpProgressHandler)progress
            success:(void (^)(NSString *url))success
            failure:(void (^)(NSError *err))failure {
    [self getQnPara:^(BOOL suc, NSString *token, NSString *cdnUrl) {
        if (!suc) {
            if (failure) {failure([self errWithType:QqHlpErr_errQnPara]);}
        }

        // 压缩
        NSData *data = nil;
        if ([image isKindOfClass:UIImage.class]) {
            data = UIImageJPEGRepresentation(image, YunQiniuUploadConfig.instance.cmpFactor);
        }
        else if ([image isKindOfClass:NSData.class]) {
            data = image;
        }
        else {
            if (failure) {failure([self errWithType:QqHlpErr_errImg]);}

            return;
        }

        if (!data) {
            if (failure) {failure([self errWithType:QqHlpErr_errImg]);}

            return;
        }

        QNConfiguration *cfg = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
            NSMutableArray *paras = [[NSMutableArray alloc] init];
            [paras addObject:[QNResolver systemResolver]];

            //QNDnsManager *dns = [[QNDnsManager alloc] init:paras networkInfo:[QNNetworkInfo normal]];

            //builder.zone = [[QNAutoZone alloc] initWithDns:dns]; // 7.2.5 废除
            //builder.dns = dns;

            //是否选择 https 上传
            //builder.useHttps = YES;

            //设置断点续传
            NSError *error;
            builder.recorder = [QNFileRecorder fileRecorderWithFolder:@"QnImgDic" error:&error];
        }];

        QNUploadOption *opt = [[QNUploadOption alloc] initWithMime:nil
                                                   progressHandler:progress
                                                            params:nil
                                                          checkCrc:NO
                                                cancellationSignal:nil];
        QNUploadManager *upMg = [QNUploadManager sharedInstanceWithConfiguration:cfg];
        [upMg putData:data
                  key:nil
                token:token
             complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                 if (info.statusCode == 200 && resp) {
                     if (success) {
                         success([self getImgUrl:resp baseUrl:cdnUrl]);
                     }
                 }
                 else {
                     if (failure) {failure(info.error);}
                 }
             } option:opt];
    }];
}

//上传多张图片
+ (void)uploadImages:(NSArray *)imageList
            progress:(void (^)(CGFloat))progress
             success:(void (^)(NSArray<NSString *> *urlList))success
             failure:(void (^)(NSError *err))failure {
    if (imageList == nil || imageList.count == 0) {
        if (success) {success(nil);}
        return;
    }

    NSMutableArray *listUrl = [[NSMutableArray alloc] init];

    __block CGFloat totalPrgs = 0.0f;
    __block CGFloat partPrgs = 1.0f / [imageList count];
    __block NSUInteger curIndex = 0;

    YunQiniuUploadConfig *upHlp = [YunQiniuUploadConfig instance];
    __weak typeof(upHlp) weakHlp = upHlp;
    upHlp.failureBlock = ^(NSError *err) {
        if (failure) {failure(err);}
        return;
    };

    upHlp.sucBlock = ^(NSString *url) {
        [listUrl addObject:url];
        curIndex++;

        totalPrgs += partPrgs;
        if (progress) {
            progress(totalPrgs);
        }

        if ([listUrl count] == [imageList count]) {
            success([listUrl copy]);
            return;
        }
        else {
            [YunQiniuUploadImageTool uploadImage:imageList[curIndex]
                                        progress:nil
                                         success:weakHlp.sucBlock
                                         failure:weakHlp.failureBlock];
        }
    };

    [YunQiniuUploadImageTool uploadImage:imageList[0]
                                progress:nil
                                 success:weakHlp.sucBlock
                                 failure:weakHlp.failureBlock];
}

+ (void)uploadImages:(NSArray *)imageList
            progress:(void (^)(CGFloat))progress
                  tg:(id)tg
             success:(void (^)(NSArray<NSString *> *urlList))success
             failure:(void (^)(NSError *err))failure {
    [self setDelegate:tg];

    [self uploadImages:imageList
              progress:progress
               success:success
               failure:failure];
}

+ (NSString *)getImgUrl:(NSDictionary *)resp baseUrl:(NSString *)baseUrl {
    if (YunQiniuUploadConfig.instance.delegate) {
        if ([YunQiniuUploadConfig.instance.delegate respondsToSelector:@selector(getFileUrlByResp:)]) {
            NSString *fileUrl = [YunQiniuUploadConfig.instance.delegate getFileUrlByResp:resp];

            return fileUrl;
        }
    }

    NSString *url = resp[@"url"];

    return url;
}

+ (NSError *)errWithType:(QiNiuHelperError)type {
    return [NSError errorWithDomain:@"QiNiuHelper"
                               code:type
                           userInfo:nil];
}

@end