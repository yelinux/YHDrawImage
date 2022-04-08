//
//  NSMutableAttributedString+YHDrawImage.m
//  YHDrawImage_Example
//
//  Created by chenyehong on 2022/4/8.
//  Copyright © 2022 ye_linux@126.com. All rights reserved.
//

#import "NSMutableAttributedString+YHDrawImage.h"

@implementation NSMutableAttributedString (YHDrawImage)

-(void)yh_appendAttachmentImage: (UIImage *)img offsetY: (CGFloat)offsetY{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc]init];
    textAttachment.image = img;
    CGRect frame = CGRectMake(0, 0, textAttachment.image.size.width, textAttachment.image.size.height);
    frame.origin.y -= offsetY;
    textAttachment.bounds = frame;
    [self appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
}

@end
