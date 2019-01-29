//
// Created by 王健 on 16/5/13.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QiniuSDK.h"

@interface YunQiniuUploadImageTool : NSObject

+ (void)setDelegate:(id)tg;

+ (void)uploadImage:(id)image
           progress:(QNUpProgressHandler)progress
            success:(void (^)(NSString *url))success
            failure:(void (^)(NSError *err))failure;

//上传多张图片,按队列依次上传
+ (void)uploadImages:(NSArray *)imageList
            progress:(void (^)(CGFloat))progress
             success:(void (^)(NSArray<NSString *> *urlList))success
             failure:(void (^)(NSError *err))failure;

//上传多张图片,按队列依次上传
+ (void)uploadImages:(NSArray *)imageList
            progress:(void (^)(CGFloat))progress
                  tg:(id)tg
             success:(void (^)(NSArray<NSString *> *urlList))success
             failure:(void (^)(NSError *err))failure;

@end