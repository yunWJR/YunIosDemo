//
// Created by yun on 2019-01-30.
// Copyright (c) 2019 skkj. All rights reserved.
//

#import "YunAppThemeDemo.h"
#import "YunBaseAppNorHeader.h"
#import <YunKits/YunSizeHelper.h>
#import "YunTheme.h"

@interface YunAppThemeDemo () {
}

@end

@implementation YunAppThemeDemo

- (void)setYunAppTheme {

    /// 具体参考YunAppThemeColorConfig

    /// 缩放设置
    CGFloat delta = [YunSizeHelper screenWidth] - 414.0f;
    CGFloat delta1 = delta / 414.0f * 0.5f;
    YunAppTheme.instance.curYunTheme.screenScale = 1.0f * (1.0f + delta1); // 当前屏幕相对于6p屏幕的比列大小
    YunAppTheme.instance.scaleIsOn = YES; /// 根据屏幕大小，缩放字体大小

    /// 基准字体大小
    YunAppTheme.instance.curYunTheme.baseFontSize =
            [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline].pointSize;

    /// 主题颜色配置
    YunAppThemeColorConfig.instance.colorBaseNor = [UIColor blackColor];
    YunAppThemeColorConfig.instance.colorVcBg = [UIColor hexColor:0xf2f2f2];
    YunAppThemeColorConfig.instance.colorViewBg = [UIColor clearColor];

    YunAppThemeColorConfig.instance.colorBaseDark = [UIColor hexColor:0x595E6B];
    YunAppThemeColorConfig.instance.colorBaseDk1 = [UIColor hexColor:0xA4AAB3];
    YunAppThemeColorConfig.instance.colorBaseDk2 = [UIColor hexColor:0xE6E6E6];
    YunAppThemeColorConfig.instance.colorBaseDk3 = [UIColor hexColor:0xF4F5F6];
    YunAppThemeColorConfig.instance.colorBaseDk4 = [UIColor hexColor:0xFAFAFA];

    YunAppThemeColorConfig.instance.colorBaseLight = [UIColor lightGrayColor];
    YunAppThemeColorConfig.instance.colorBaseLg1 = [UIColor hexColor:0xE2F5FF];
    YunAppThemeColorConfig.instance.colorBaseLg2 = [UIColor hexColor:0xFF9600];
    YunAppThemeColorConfig.instance.colorBaseLg3 = [UIColor hexColor:0x347BB8];
    YunAppThemeColorConfig.instance.colorBaseLg4 = [UIColor hexColor:0x3C0000];

    YunAppThemeColorConfig.instance.colorBaseHl = [UIColor hexColor:0x17d5d1];
    YunAppThemeColorConfig.instance.colorBaseAlert = [UIColor hexColor:0xff2d55];
    YunAppThemeColorConfig.instance.colorBaseCmp = [UIColor greenColor];
    YunAppThemeColorConfig.instance.colorBaseWhite = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorBaseBlack = [UIColor blackColor];

    // bg
    YunAppThemeColorConfig.instance.colorBgNor = [UIColor clearColor];
    YunAppThemeColorConfig.instance.colorBgDark = [UIColor grayColor];
    YunAppThemeColorConfig.instance.colorBgLight = [UIColor lightGrayColor];

    // nag
    YunAppThemeColorConfig.instance.colorNagBg = YunAppThemeColorConfig.instance.colorBaseHl;
    YunAppThemeColorConfig.instance.colorNagNor = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorNagDark = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorNagLight = [UIColor whiteColor];

    // Ctn
    YunAppThemeColorConfig.instance.colorCtnNor = [UIColor whiteColor];
    YunAppThemeColorConfig.instance.colorCtnDark = [UIColor blackColor];
    YunAppThemeColorConfig.instance.colorCtnLight = [UIColor lightGrayColor];

    // 字体大小配置

    YunAppTheme.instance.sizeSM = 13;
    YunAppTheme.instance.sizeS = 14;
    YunAppTheme.instance.sizeN = 15;
    YunAppTheme.instance.sizeL = 16;
    YunAppTheme.instance.sizeLM = 17;

    // 字体设置
    YunAppTheme.instance.fontLName = @"FZLanTingHei-EL-GBK";
    YunAppTheme.instance.fontNName = @"FZLanTingHei-EL-GBK";
    YunAppTheme.instance.fontBName = @"FZLanTingHei-DB-GBK";
    YunAppTheme.instance.fontNumName = @"DIN-MediumItalic";


    /// 使用
    UILabel *lbl = [UILabel new];
    lbl.font = [YunAppTheme fontB_N]; /// 粗体，正常大小
    lbl.font = [YunAppTheme fontN:18]; /// 正常体，字号18

    lbl.textColor = YunAppTheme.colorBaseDk1; /// Dk1颜色
    lbl.textColor = YunAppTheme.colorBaseHl; /// 主题高亮色
    lbl.textColor = YunAppTheme.colorBaseAlert; /// 主题警示色

    /// 改变 App 内所有字体大小
    CGFloat tgSize;
    YunAppTheme.instance.curYunTheme.baseFontSize = tgSize;

    /// 改变主题颜色

}

@end