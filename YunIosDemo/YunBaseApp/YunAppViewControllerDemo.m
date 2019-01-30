//
// Created by yun on 2019-01-30.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunAppViewControllerDemo.h"

@interface YunAppViewControllerDemo () {
}

@end

@implementation YunAppViewControllerDemo

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
    /// 移出通知等信息
}

#pragma mark - yun app

// 初始化数据
- (void)initVcData {
    [super initVcData];

    /// 配置项，具体参看YunAppViewController
    self.popGestureOn = YES; /// 开启侧滑返回手势，仅在root节点设置为 YES
    self.hideNagBar = YES; /// 隐藏导航栏
    self.isNagBarClear = YES; /// 导航栏透明

    self.hideStateView = YES; /// 不显示加载框
}

// 初始化 view
- (void)initVcSubViews {
    [super initVcSubViews];

    /// 初始化页面
    /// 给 self.view 添加 subview
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
    [super loadDataFromServer]; /// 自动显示数据加载框

    /// 加载数据

    /// 加载完成,并触发页面更新，将执行updateVcState方法
    [self loadDataCmpAndUpdateVcState];
}

// 从服务器加载更多数据
- (void)loadMoreDataFromServer {
    [super loadMoreDataFromServer]; /// 自动显示数据加载框
}

// 更新 Vc 的状态（可以在加载完成时调用）
- (void)updateVcState {
    [super updateVcState];
}

// 开始更新 Vc 状态（实现该方法，updateVcState 时会触发）
- (void)updateVcStateOn {
    [super updateVcStateOn];

    /// 根据记在的数据，更新页面信息
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