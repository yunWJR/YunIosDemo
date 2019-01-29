//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunSizeHelper.h"
#import "YunTypeDefine.h"

@implementation YunSizeHelper

+ (CGFloat)statusBarHeight {
    CGFloat sBar = [UIApplication sharedApplication].statusBarFrame.size.height;

    return sBar; // def = 20pt iPhoneX=44pt
}

// 该高度有可能有误差
+ (CGFloat)navigationBarHeight {
    return 44;

    // 都是44
    return YunTypeDefine.isIPhoneXAndOn ? 88.0f : 64.0f - self.statusBarHeight;
}

+ (CGFloat)statusAndNagBarHeight {
    return self.navigationBarHeight + self.statusBarHeight;
}

+ (CGFloat)tabBarHeight {
    return 49 + self.btmSafeOff;
}

+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)widthOn320:(CGFloat)width {
    return self.screenWidth * width / 320.00f;
}

+ (CGFloat)heightOn568:(CGFloat)height {
    return self.screenHeight * height / 568.00f;
}

+ (CGFloat)widthOnIPhone5:(CGFloat)width {
    return [self widthOn320:width];
}

+ (CGFloat)heightOnIPhone5:(CGFloat)height {
    return [self heightOn568:height];
}

+ (CGFloat)widthOn375:(CGFloat)width {
    return self.screenWidth * width / 375.00f;
}

+ (CGFloat)heightOn667:(CGFloat)height {
    return self.screenHeight * height / 667.00f;
}

+ (CGFloat)widthOnIPhone6:(CGFloat)width {
    return [self widthOn375:width];
}

+ (CGFloat)heightOnIPhone6:(CGFloat)height {
    return [self heightOn667:height];
}

+ (CGFloat)widthOn414:(CGFloat)width {
    return self.screenWidth * width / 414.00f;
}

+ (CGFloat)heightOn736:(CGFloat)height {
    return self.screenHeight * height / 736.00f;
}

+ (CGFloat)widthOnIPhone8Plus:(CGFloat)width {
    return [self widthOn414:width];
}

+ (CGFloat)heightOnIPhone8Plus:(CGFloat)height {
    return [self heightOn736:height];
}

+ (CGFloat)widthOn2x:(CGFloat)width {
    return self.screenWidth * width / 375.00f;
}

+ (CGFloat)heightOn2x:(CGFloat)height {
    return self.screenHeight * height / 667.00f;
}

// iphoneX 下方的安全距离
+ (CGFloat)btmSafeOff {
    return YunTypeDefine.isIPhoneXAndOn ? 34.0f : 0.0f;
}

@end