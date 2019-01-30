//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunBaseAppAcctDemo.h"
#import "YunBaseAppNorHeader.h"
#import "YunBaseApp.h"
#import "YunAccountMgHelper.h"
#import "YunAccountMg.h"

@interface YunBaseAppAcctDemo () <YunAccountMgDelegate> {
}

@end

@implementation YunBaseAppAcctDemo

- (void)demo {
    /// 设置全局代理
    YunAccountMgHelper.mg.delegate = self;

    /// 用户数据，用户自定义
    /// 需要为实现序列化，我采用的是MTLModel
    id userData;

    // 保存
    [YunAccountMgHelper.mg storeUser:userData name:nil];

    // 获取
    userData = YunAccountMgHelper.mg.fetchUser;

    // 删除
    [YunAccountMgHelper.mg removeAcct];
}

#pragma mark - YunAccountMgDelegate

- (void)didAcctUpdated:(YunAccountModel *)acct {
    /// 处理用户数据更新后的逻辑
    /// 如：注册推送id
}

- (void)didAcctRemoved:(YunAccountModel *)acct {
    /// 处理用户数据删除后的逻辑
    /// 如：移除推送id
}

- (NSString *)getUserToken:(YunAccountModel *)acct {
    return nil;
}

@end