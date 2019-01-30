//
// Created by yun on 2019-01-30.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunBaseAppCacheDemo.h"
#import "YunCacheFileHelper.h"

@interface YunBaseAppCacheDemo () <YunCacheFileHelperDelegate> {
}

@end

@implementation YunBaseAppCacheDemo

- (void)demo {
    /// 初始化缓存文件名
    YunCacheFileHelper.instance.fileList = @[
            @"file1", @"file2", @"file3", @"file4"
    ];

    YunCacheFileHelper.instance.delegate = self;

    id cacheData; // 需要实现序列化，我采用的是MTLModel
    NSInteger cacheIndex = 0; // 缓存对象的index，对应fileList的文件

    /// 保存缓存数据
    [YunCacheFileHelper.instance saveItem:cacheData index:cacheIndex];

    /// 获取缓存数据
    id data = [YunCacheFileHelper.instance getItem:cacheIndex];

    /// 删除数据
    [YunCacheFileHelper.instance removeItemByIndex:cacheIndex];
}

- (NSString *)getFileName:(NSString *)fileName index:(NSInteger)index {
    if(index == 1){
        return @"file1";
    }
    return nil;
}


@end