//
//  YHViewController.m
//  YHDrawImage
//
//  Created by ye_linux@126.com on 04/08/2022.
//  Copyright (c) 2022 ye_linux@126.com. All rights reserved.
//

#import "YHViewController.h"
#import "YHDrawModel.h"

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
    
    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:@"V" attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:10]}];
    UIImage *img1 = YHDrawModel.new
        .attributes(attr1)
        .fill(color)
        .radius(2, UIRectCornerAllCorners)
        .size(CGSizeMake(15, 15))
        .draw;
    [attrMutStr appendAttributedString:[self createAttachment:img1 y:2]];
    [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
    
    NSAttributedString *attr2 = [[NSAttributedString alloc] initWithString:@"ID" attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    UIImage *img2 = YHDrawModel.new
        .attributes(attr2)
        .fill(UIColor.whiteColor)
        .padding(0.5, 4, 0.5, 4)
        .stroke(color, 1)
        .radius(2, UIRectCornerAllCorners)
        .draw;
    [attrMutStr appendAttributedString:[self createAttachment:img2 y:2]];
    
    [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
    
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这是固定高富文本图片，固定宽高：" attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
    UIImage *img = YHDrawModel.new
        .attributes(attr)
        .fill(color)
        .radius(2, UIRectCornerAllCorners)
        .padding(0, 6, 0, 4)
        .size(CGSizeMake(0, 15))
        .margin(0, 1, 0, 1)
        .draw;
    [attrMutStr appendAttributedString:[self createAttachment:img y:2]];
    
    for(int i = 0 ; i < 99 ; i++){
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", i + 1] attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont boldSystemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(color)
            .radius(2, UIRectCornerAllCorners)
            .size(CGSizeMake(15, 15))
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr appendAttributedString:[self createAttachment:img y:2]];
    }
    
    UIImage *img3 = YHDrawModel.new
        .fill(color)
        .radius(15.0/2, UIRectCornerAllCorners)
        .size(CGSizeMake(15, 15))
        .margin(0, 1, 0, 1)
        .draw;
    [attrMutStr appendAttributedString:[self createAttachment:img3 y:2]];
    
    {
        [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这是固定宽富文本图片，高度自动调节" attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(color)
            .radius(2, UIRectCornerAllCorners)
            .size(CGSizeMake(60, 0))
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr appendAttributedString:[self createAttachment:img y:2]];
    }
    {
        [attrMutStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"这自适应宽富文本图片，\n宽高根据内部文本自动调节" attributes:@{NSForegroundColorAttributeName:UIColor.whiteColor, NSFontAttributeName:[UIFont systemFontOfSize:10]}];
        UIImage *img = YHDrawModel.new
            .attributes(attr)
            .fill(color)
            .radius(2, UIRectCornerAllCorners)
            .margin(0, 1, 0, 1)
            .draw;
        [attrMutStr appendAttributedString:[self createAttachment:img y:2]];
    }
    
    self.lb.attributedText = attrMutStr;
    
}

-(NSAttributedString *)createAttachment: (UIImage *)img y: (CGFloat)y{
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc]init];
    textAttachment.image = img;
    CGRect frame = CGRectMake(0, 0, textAttachment.image.size.width, textAttachment.image.size.height);
    frame.origin.y -= y;
    textAttachment.bounds = frame;
    return [NSAttributedString attributedStringWithAttachment:textAttachment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
