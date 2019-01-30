//
// Created by yun on 2019-01-30.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import <YunBaseApp/YunErrorModel.h>
#import "YunBaseAppErrorDemo.h"
#import "YunErrorConfig.h"
#import "YunErrorHelper.h"
#import "YunRqtRpsHelper.h"

@interface YunBaseAppErrorDemo () {
}

@end

@implementation YunBaseAppErrorDemo

-(void)demo{
    /// 设置自定义错误码和错误信息
    [YunErrorConfig.instance setItem:YunErrTypeOutOfLogin defMsg:@"登录信息已过期，请重新登录"];
    [YunErrorConfig.instance setItem:YunErrTypeOutOfLogin codes:@[
            [YunErrorCodeAndMsg itemWithCode:YunErrTypeOutOfLogin msg:nil],
            [YunErrorCodeAndMsg itemWithCode:105 msg:nil],
            [YunErrorCodeAndMsg itemWithCode:114 msg:nil],
    ]];

    [YunErrorConfig.instance setItem:YunErrTypeRqtTimeOut defMsg:@"请求超时,请重试"];
    [YunErrorConfig.instance setItem:YunErrTypeRqtTimeOut codes:@[
            [YunErrorCodeAndMsg itemWithCode:-1001 msg:nil],
    ]];

    /// 设置特殊错误信息处理
    YunErrorConfig.instance.didErrorOn = ^(YunErrorModel *err, BOOL hasHandle) {
        if (err.type == YunErrTypeOutOfLogin) {
            // 退出到登录页面
        }

        //...
    };

    //...

    /// 自定义错误
    YunErrorModel *errorDef = [YunErrorModel itemWithType:YunErrTypeRqtTimeOut
                                                     code:-1
                                                      msg:nil];

    /// RqtRsp错误
    YunRqtRpsHelper *rspHelper;
    YunErrorModel *rqtRspError = [YunErrorHelper itemWithRpsError:rspHelper].getError;
}

@end