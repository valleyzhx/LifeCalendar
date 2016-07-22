//
//  ViewInfoMacro.h
//  JDHaiGo
//  视图使用到的宏定义
//  Created by FairySong on 15/8/9.
//  Copyright (c) 2015年 京东商城. All rights reserved.
//

#ifndef JDHaiGo_ViewInfoMacro_h
#define JDHaiGo_ViewInfoMacro_h


/**
 *
 *
 *  颜色
 *
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF000000) >> 24))/255.0 green:((float)((rgbValue & 0xFF0000) >> 16))/255.0 blue:((float)((rgbValue & 0xFF00)>> 8))/255.0 alpha:((float)(rgbValue & 0xFF))/255.0]

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define viewBGColor RGBA_COLOR(238,241,245,1)


#define TextDarkColor UIColorFromRGB(0x494949)
#define TextLightColor UIColorFromRGB(0x9ca7b0)
#define JDRedColor UIColorFromRGB(0xe73c31)
#define JDLightOrange UIColorFromRGB(0xffe9cc)
#define JDDarkOrange UIColorFromRGB(0xff9000)

#define Nav_Color RGBA_COLOR(71.0,141.0,244.0,1)

#define HeightTabView           49
#define HeightNavigationItem    64//[JDUtils checkiOS]>=70?64:44
#define HeightStatusBar         20


#define DispatchDelay(second,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{block});


#define WS() __typeof__(self) __weak weakself = self



/**
 *	@brief	获取字体
 */
#define FONT(frontSize)    [UIFont systemFontOfSize:(frontSize)]
#define FONT_BOLD(frontSize)    [UIFont boldSystemFontOfSize:(frontSize)]


// screen
#define SCREEN_SIZE     [[UIScreen mainScreen] currentMode].size


#define KeyWindow [UIApplication sharedApplication].keyWindow


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#endif



