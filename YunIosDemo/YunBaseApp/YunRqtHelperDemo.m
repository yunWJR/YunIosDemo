//
// Created by yun on 2019-01-30.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunRqtHelperDemo.h"
#import "YunBaseAppNorHeader.h"
#import "YunConfig.h"
#import "YunAppInfo.h"

@interface YunRqtHelperDemo () {
}

@end

@implementation YunRqtHelperDemo

- (void)setYunAppRqt {
    /// 参数设置 具体参看YunRqtConfig
    YunRqtConfig.instance.devType = @"1";
    YunRqtConfig.instance.devTypeParaName = @"deviceType";

    if (YunConfig.instance.isDebugMode) { // 本地测试
        YunRqtConfig.instance.baseURL = [NSURL URLWithString:@"http://192.168.0.110:8080/"];
    }
    else { // 正式
        YunRqtConfig.instance.baseURL = [NSURL URLWithString:@"http://test.demo.com/"];
    }

    YunRqtConfig.instance.baseApiURL =
            [NSURL URLWithString:FORMAT(@"%@api/", [YunRqtConfig.instance.baseURL absoluteString])];

    YunRqtConfig.instance.tokenParaName = @"token";

    YunRqtConfig.instance.rspCodeName = @"status";

    NSString *userToken; /// token 获取

    // Content-Type 不要设置
    YunRqtConfig.instance.headerParas = [@{
            YunRqtConfig.instance.tokenParaName   : userToken == nil ? @"" : userToken,
            YunRqtConfig.instance.devTypeParaName : YunRqtConfig.instance.devType,
            @"Version"                            : YunAppInfo.appVersion,
    } mutableCopy];

}

/// GET 方法
- (void)getData:(void (^)(id rspData))success
        failure:(void (^)(YunErrorHelper *error))failure {
    YunRqtMg *rqMg = [YunRqtMg request];

    [rqMg GET:[YunRqtUrlHelper urlCmBaseApi:@"getData"]
   parameters:YunRqtUrlHelper.getBasePara
     progress:nil
      success:^(NSURLSessionDataTask *task, id responseObject) {
          YunRqtRpsHelper *rsp = [[YunRqtRpsHelper alloc] initWithRsp:responseObject];
          if ([rsp isSuccess]) {
              id dataItem = rsp.data; /// 根据rsp.data转换为对象
              if (success) {success(dataItem);}
          }
          else {
              if (failure) {failure([YunErrorHelper itemWithRpsError:rsp]);}
          }
      } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {failure([YunErrorHelper itemWithError:error]);}
     }];
}

/// POST 方法
- (void)createItem:(NSString *)itemId
           success:(void (^)(void))success
           failure:(void (^)(YunErrorHelper *error))failure {

    YunRqtMg *rqMg = [YunRqtMg request];

    [rqMg POST:[YunRqtUrlHelper urlCmBaseApi:@"createItem"]
    parameters:[YunRqtUrlHelper baseParaWithDic:@{@"itemId" : itemId}]
     queryMode:NO
      progress:nil
       success:^(NSURLSessionDataTask *task, id responseObject) {
           YunRqtRpsHelper *rsp = [[YunRqtRpsHelper alloc] initWithRsp:responseObject];
           if ([rsp isSuccess]) {
               if (success) {success();}
           }
           else {
               if (failure) {failure([YunErrorHelper itemWithRpsError:rsp]);}
           }
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failure) {failure([YunErrorHelper itemWithError:error]);}
     }];
}

//...

@end