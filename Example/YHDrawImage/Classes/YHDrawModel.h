//
//  YHDrawModel.h
//  YHDrawImage_Example
//
//  Created by chenyehong on 2022/4/8.
//  Copyright © 2022 ye_linux@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHDrawModel : NSObject

///文本和属性
- (YHDrawModel * (^)(NSString *str, NSDictionary<NSAttributedStringKey, id> *attrs))string;
///富文本
- (YHDrawModel * (^)(NSAttributedString *attrStr))attributes;
///固定宽高(size.width=0/size.height=0表示不固定，文本水平/垂直居中)
- (YHDrawModel * (^)(CGSize imgSize))size;
///填充背景色
- (YHDrawModel * (^)(UIColor *fillColor))fill;
///文本边距(设置固定宽size.width之后left/right失效，设置固定高size.height之后top/bottom失效)
- (YHDrawModel * (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))padding;
///边框以外的边距
- (YHDrawModel * (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))margin;
///边框线颜色，宽度
- (YHDrawModel * (^)(UIColor *strokeColor, CGFloat lineWidth))stroke;
///圆角
- (YHDrawModel * (^)(CGFloat radius, UIRectCorner corners))radius;
///开始画图
- (UIImage*)draw;

@end

NS_ASSUME_NONNULL_END
