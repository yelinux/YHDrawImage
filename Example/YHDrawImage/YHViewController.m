//
//  YHViewController.m
//  YHDrawImage
//
//  Created by ye_linux@126.com on 04/08/2022.
//  Copyright (c) 2022 ye_linux@126.com. All rights reserved.
//

#import "YHViewController.h"
#import "YHDrawImage.h"

@interface YHViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lb;

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *attrMutStr = [[NSMutableAttributedString alloc] initWithString:@"3天前·XXX好极有限公司员工 " attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    
    UIColor *color = [UIColor colorWithRed:20/255.0 green:122/255.0 blue:244/255.0 alpha:1];
    
    UIImage *img1 = YHDrawModel.new
        .string(@"V", @{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:10]})
        .fill(color)
        .radius(2, UIRectCornerAllCorners)
        .size(CGSizeMake(15, 15))
        .draw;
    [attrMutStr yh_appendAttachmentImage:img1 offsetY:2];
    [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    
    NSAttributedString *attr2 = [[NSAttributedString alloc] initWithString:@"ID" attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    UIImage *img2 = YHDrawModel.new
        .attributes(attr2)
        .fill(UIColor.whiteColor)
        .padding(0.5, 4, 0.5, 4)
        .stroke(color, 1)
        .radius(2, UIRectCornerAllCorners)
        .draw;
    [attrMutStr yh_appendAttachmentImage:img2 offsetY:2];
    
    [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这是固定高富文本图片，固定宽高如下：" attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    UIImage *img = YHDrawModel.new
        .attributes(attr)
        .fill(UIColor.whiteColor)
        .stroke(color, 1)
        .radius(2, UIRectCornerAllCorners)
        .padding(0, 6, 0, 4)
        .size(CGSizeMake(0, 15))
        .margin(0, 1, 0, 1)
        .draw;
    [attrMutStr yh_appendAttachmentImage:img offsetY:2];
    
    for(int i = 0 ; i < 99 ; i++){
        UIColor *colorBg = [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1];
        CGFloat r = 0, g, b, a;
        [colorBg getRed:&r green:&g blue:&b alpha:&a];
        UIColor *colorTxt = [UIColor colorWithRed:1-r green:1-g blue:1-b alpha:1];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", i + 1] attributes:@{NSForegroundColorAttributeName:colorTxt, NSFontAttributeName:[UIFont boldSystemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(colorBg)
            .radius(2, UIRectCornerAllCorners)
            .size(CGSizeMake(15, 15))
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr yh_appendAttachmentImage:img offsetY:2];
    }
    
    UIImage *img3 = YHDrawModel.new
        .fill(UIColor.whiteColor)
        .radius(11.0/2, UIRectCornerAllCorners)
        .stroke(color, 2)
        .size(CGSizeMake(15, 15))
        .margin(0, 1, 0, 1)
        .draw;
    [attrMutStr yh_appendAttachmentImage:img3 offsetY:2];
    
    {
        [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这是固定宽富文本图片，高度自动调节" attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(UIColor.whiteColor)
            .stroke(color, 1)
            .radius(2, UIRectCornerAllCorners)
            .size(CGSizeMake(60, 0))
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr yh_appendAttachmentImage:img offsetY:2];
    }
    {
        [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这自适应宽富文本图片，\n宽高根据内部文本自动调节\n设置内边距(4,6,4,6)" attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(UIColor.whiteColor)
            .stroke(color, 1)
            .radius(2, UIRectCornerAllCorners)
            .padding(4, 6, 4, 6)
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr yh_appendAttachmentImage:img offsetY:2];
    }
    
    {
        [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        
        NSMutableAttributedString *attrSub = [[NSMutableAttributedString alloc] init];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"100" attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(color)
            .radius(2, UIRectCornerAllCorners)
            .size(CGSizeMake(0, 15))
            .margin(0, 1, 0, 1)
            .draw;
        [attrSub yh_appendAttachmentImage:img offsetY:3.5];
        [attrSub appendAttributedString:[[NSAttributedString alloc] initWithString:@"套娃🪆"]];
        {
            UIImage *img = YHDrawModel.new
                .attributes(attrSub)
                .fill(UIColor.whiteColor)
                .stroke(color, 1)
                .radius(2, UIRectCornerAllCorners)
                .padding(4, 6, 4, 6)
                .margin(0, 1, 0, 1)
                .draw;
            [attrMutStr yh_appendAttachmentImage:img offsetY:0];
        }
    }
    
    self.lb.attributedText = attrMutStr;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
