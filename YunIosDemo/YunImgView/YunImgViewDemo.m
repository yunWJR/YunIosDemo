//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunImgViewDemo.h"
#import "YunImgViewConfig.h"
#import "YunSelectImgHelper.h"
#import "YunImgListView.h"
#import <Masonry/Masonry.h>

@interface YunImgViewDemo () <YunSelectImgDelegate, YunImgListViewDelegate> {
}

@end

@implementation YunImgViewDemo

- (void)demo {
    // 全局选择图片代理
    YunImgViewConfig.instance.delegate = self;

    // 实例选择图片代理
    YunSelectImgHelper *selectImgHelper = [YunSelectImgHelper new];
    selectImgHelper.delegate = self;

    //
    NSInteger curCount = 0; // 已选择了图片数量，与maxCount对应。
    [selectImgHelper selectItem:curCount];

    YunImgListView *imgListView = [YunImgListView new];
    imgListView.delegate = self;

    // 参数设定，具体参数参见YunImgListView
    imgListView.hasAddBtn = YES; // 是否显示添加新图片按钮，如果为 YES，最后一格为添加新图片按钮。
    imgListView.maxCount = 12; // 最多图片数，默认9
    imgListView.rowNum = 4; // 每行显示图片数量，默认3

    [self.view addSubview:imgListView];

    [imgListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.equalTo(@200);
        make.width.equalTo(self.view);
    }];

    // 设置显示的图片
    [imgListView resetImgByImgUrlList:@[@"url",@"url"]];

}

#pragma YunSelectImgDelegate



@end