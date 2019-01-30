//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunBaseAppDemo.h"

@interface YunBaseAppDemo () {
}

@end

@implementation YunBaseAppDemo

#pragma mark - main

- (instancetype)init {
    self = [super init];
    if (self) {
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
}

#pragma mark - yun app

// 初始化数据
- (void)initVcData {
    [super initVcData];
}

// 初始化 view
- (void)initVcSubViews {
    [super initVcSubViews];

}

// ViewWillAppear
- (void)handleViewWillAppear {
    [super handleViewWillAppear];
}

// ViewDidAppear
- (void)handleViewDidAppear {
    [super handleViewDidAppear];
}

// ViewDidDisappear
- (void)handleViewDidDisappear {
    [super handleViewDidDisappear];
}

// 从服务器加载数据
- (void)loadDataFromServer {
    [super loadDataFromServer];

    // todo
}

// 从服务器加载更多数据
- (void)loadMoreDataFromServer {
    [super loadMoreDataFromServer];
}

// 更新 Vc 的状态（可以在加载完成时调用）
- (void)updateVcState {
    [super updateVcState];
}

// 开始更新 Vc 状态（实现该方法，updateVcState 时会触发）
- (void)updateVcStateOn {
    [super updateVcStateOn];

    // todo
}

// 状态更新完成（隐藏一些加载框等）（实现该方法，updateVcState 时会触发）
- (void)updateVcStateCmp {
    [super updateVcStateCmp];
}

// 是否加载数据
- (BOOL)shouldLoadData {
    // self.needUpdateData = YES; 一直都加载
    return [super shouldLoadData];
}

#pragma mark - request functions

#pragma mark - handles

#pragma mark - public functions

#pragma mark - private functions

#pragma mark - protocol

@end