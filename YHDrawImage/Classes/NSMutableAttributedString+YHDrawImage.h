//
//  NSMutableAttributedString+YHDrawImage.h
//  YHDrawImage_Example
//
//  Created by chenyehong on 2022/4/8.
//  Copyright © 2022 ye_linux@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (YHDrawImage)

///img:追加图片，offsetY:调整图片垂直方向位置
-(void)yh_appendAttachmentImage: (UIImage *)img offsetY: (CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
