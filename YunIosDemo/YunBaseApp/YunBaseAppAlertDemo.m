//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunBaseAppAlertDemo.h"
#import "YunAlertViewHelper.h"
#import "YunAlertConfig.h"

@interface YunBaseAppAlertDemo () <YunAlertViewHelperDelegate> {
}

@end

@implementation YunBaseAppAlertDemo

- (void)demo {
    /// 确定提示
    [YunAlertViewHelper.instance showYes:@"加载完成"];

    /// 是否提示
    [YunAlertViewHelper.instance showYesNo:@"确定添加成员？" result:^(BOOL yes) {

    }];

    /// 删除询问提示
    [YunAlertViewHelper.instance showDelete:@"确定删除成员？" result:^(BOOL yes) {

    }];



    /// 单例代理
    YunAlertViewHelper.instance.delegate = self;

    /// 全局代理
    YunAlertConfig.instance.alertViewDelegate = self;
}

- (void)showDelete:(NSString *)content result:(AlertYesBlock)result {
    /// 自己实现控件显示
}

- (void)showYes:(NSString *)content {
    /// 自己实现控件显示
}

- (void)showYes:(NSString *)content result:(AlertYesBlock)result {
    /// 自己实现控件显示
}

- (void)showYesNo:(NSString *)content result:(AlertYesBlock)result {

}

- (void)showAlert:(AlertType)type
          content:(NSString *)content
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {

}

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {

}

- (void)showHudMsg:(NSString *)msg delay:(float)delay complete:(void (^)(BOOL))complete {

}

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
        btnStyles:(NSArray<YunAlertStyleModel *> *)btnStyles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {

}


@end