//
//  YHDrawModel.m
//  YHDrawImage_Example
//
//  Created by chenyehong on 2022/4/8.
//  Copyright © 2022 ye_linux@126.com. All rights reserved.
//

#import "YHDrawModel.h"

@interface YHDrawModel()

@property (nonatomic, copy) NSString *str;
@property (nonatomic, copy) NSDictionary<NSAttributedStringKey, id> *attrs;
@property (nonatomic, copy) NSAttributedString *attrStr;
@property (nonatomic, assign) CGSize imgSize;

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, assign) UIEdgeInsets margins;

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat radiusTopLeft;
@property (nonatomic, assign) CGFloat radiusTopRight;
@property (nonatomic, assign) CGFloat radiusBottomLeft;
@property (nonatomic, assign) CGFloat radiusBottomRight;

@end

@implementation YHDrawModel

- (YHDrawModel * (^)(NSString *str, NSDictionary<NSAttributedStringKey, id> *attrs))string {
    return ^id(NSString *str, NSDictionary<NSAttributedStringKey, id> *attrs){
        self.str = str;
        self.attrs = attrs;
        return self;
    };
}

- (YHDrawModel * (^)(NSAttributedString *attrStr))attributes {
    return ^id(NSAttributedString *attrStr){
        self.attrStr = attrStr;
        return self;
    };
}

- (YHDrawModel * (^)(CGSize imgSize))size {
    return ^id(CGSize imgSize){
        self.imgSize = imgSize;
        return self;
    };
}

- (YHDrawModel * (^)(UIColor *fillColor))fill {
    return ^id(UIColor *fillColor){
        self.fillColor = fillColor;
        return self;
    };
}

- (YHDrawModel * (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))padding {
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.insets = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (YHDrawModel * (^)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right))margin {
    return ^id(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right){
        self.margins = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

- (YHDrawModel * (^)(UIColor *strokeColor, CGFloat lineWidth))stroke {
    return ^id(UIColor *strokeColor, CGFloat lineWidth){
        self.strokeColor = strokeColor;
        self.lineWidth = lineWidth;
        return self;
    };
}

- (YHDrawModel * (^)(CGFloat radius, UIRectCorner corners))radius {
    return ^id(CGFloat radius, UIRectCorner corners){
        if ((corners & UIRectCornerTopLeft) > 0) {
            self.radiusTopLeft = radius;
        }
        if ((corners & UIRectCornerTopRight) > 0) {
            self.radiusTopRight = radius;
        }
        if ((corners & UIRectCornerBottomLeft) > 0) {
            self.radiusBottomLeft = radius;
        }
        if ((corners & UIRectCornerBottomRight) > 0) {
            self.radiusBottomRight = radius;
        }
        return self;
    };
}

- (UIImage*)draw{
    NSAttributedString *attrStr = self.attrStr;
    if (!attrStr && self.str.length > 0) {
        attrStr = [[NSAttributedString alloc] initWithString:self.str attributes:self.attrs];
    }
    
    CGFloat maxStrWidth = self.imgSize.width - (self.insets.left + self.insets.right + self.lineWidth);
    CGFloat maxStrHeight = self.imgSize.height - (self.insets.top + self.insets.bottom + self.lineWidth);
    CGSize strSize = [attrStr boundingRectWithSize:CGSizeMake(maxStrWidth > 0 ? maxStrWidth : CGFLOAT_MAX, maxStrHeight > 0 ? maxStrHeight : CGFLOAT_MAX)
                                            options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            context:nil].size;
    CGSize drawSize = self.imgSize;
    drawSize = CGSizeMake(drawSize.width > 0 ? drawSize.width : strSize.width + self.insets.left + self.insets.right + self.lineWidth,
                          drawSize.height > 0 ? drawSize.height : strSize.height + self.insets.top + self.insets.bottom + self.lineWidth);
    drawSize = CGSizeMake(drawSize.width + self.margins.left + self.margins.right, drawSize.height + self.margins.top + self.margins.bottom);

    /* 1.设置当前上下文中绘制的区域 */
    UIGraphicsBeginImageContextWithOptions(drawSize, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    void (^drawBlock)(CGRect rrect,
                      CGFloat radiusTopLeft,
                      CGFloat radiusTopRight,
                      CGFloat radiusBottomLeft,
                      CGFloat radiusBottomRight) = ^(CGRect rrect,
                                                    CGFloat radiusTopLeft,
                                                    CGFloat radiusTopRight,
                                                    CGFloat radiusBottomLeft,
                                                    CGFloat radiusBottomRight){
        CGFloat
        minx = CGRectGetMinX(rrect),
        midx = CGRectGetMidX(rrect),
        maxx = CGRectGetMaxX(rrect);
        CGFloat
        miny = CGRectGetMinY(rrect),
        midy = CGRectGetMidY(rrect),
        maxy = CGRectGetMaxY(rrect);
        CGContextMoveToPoint(ctx, minx, midy);
        CGContextAddArcToPoint(ctx, minx, miny, midx, miny, radiusTopLeft);
        CGContextAddArcToPoint(ctx, maxx, miny, maxx, midy, radiusTopRight);
        CGContextAddArcToPoint(ctx, maxx, maxy, midx, maxy, radiusBottomLeft);
        CGContextAddArcToPoint(ctx, minx, maxy, minx, midy, radiusBottomRight);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke);
    };
    CGFloat r = 0, g, b, a;
    if (self.strokeColor) {
        [self.strokeColor getRed:&r green:&g blue:&b alpha:&a];
        CGContextSetLineWidth(ctx, self.lineWidth);
        CGContextSetRGBStrokeColor(ctx, r, g, b, a);
    } else {
        CGContextSetLineWidth(ctx, 0);
        CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 0);
    }
    if (self.fillColor) {
        [self.fillColor getRed:&r green:&g blue:&b alpha:&a];
        CGContextSetRGBFillColor(ctx, r, g, b, a);
    } else {
        CGContextSetRGBFillColor(ctx, 0, 0, 0, 0);
    }
    CGRect rrect = CGRectMake(self.lineWidth / 2 + self.margins.left,
                              self.lineWidth / 2 + self.margins.top,
                              drawSize.width - self.lineWidth - self.margins.left - self.margins.right,
                              drawSize.height - self.lineWidth - self.margins.top - self.margins.bottom);
    
    drawBlock(rrect,
              self.radiusTopLeft,
              self.radiusTopRight,
              self.radiusBottomLeft,
              self.radiusBottomRight);
    
    [attrStr drawInRect:CGRectMake(self.imgSize.width > 0 ? drawSize.width / 2 - strSize.width / 2 : self.insets.left + self.lineWidth / 2 + self.margins.left,
                                   self.imgSize.height > 0 ? drawSize.height / 2 - strSize.height / 2 : self.insets.top + self.lineWidth / 2 + self.margins.top,
                                   strSize.width,
                                   strSize.height)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
