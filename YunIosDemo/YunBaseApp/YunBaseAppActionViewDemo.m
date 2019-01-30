//
// Created by yun on 2019-01-29.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunBaseAppActionViewDemo.h"
#import "YunBaseAppNorHeader.h"
#import "YunBaseApp.h"
#import "YunAccountMgHelper.h"
#import "YunAccountMg.h"
#import "YunInputActionListView.h"
#import "YunActionListItemModel.h"

@interface YunBaseAppActionViewDemo () {

}

@end

@implementation YunBaseAppActionViewDemo

- (void)demo {

    /// 添加选择项
    NSMutableArray *itemList = [NSMutableArray new];

    [itemList addObject:[YunActionListItemModel modelWithItemId:@"id1"
                                                       itemName:@"项目1"
                                                           item:nil]];

    [itemList addObject:[YunActionListItemModel modelWithItemId:@"id2"
                                                       itemName:@"项目2"
                                                           item:nil]];

    /// 实例对象
    YunInputActionListView *actionListView = [YunInputActionListView new];
    actionListView.viewTitle = @"选择一项";
    actionListView.itemList = itemList;

    actionListView.didSelectItem = ^(YunActionListItemModel *item) {
      // 选中的项
    };

    /// 显示 view
    [actionListView showView];
}

@end