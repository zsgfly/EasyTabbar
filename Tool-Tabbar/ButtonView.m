//
//  ButtonView.m
//  JD
//
//  Created by 腾盈 on 2018/2/7.
//  Copyright © 2018年 腾盈. All rights reserved.
// self为固定高度49，宽度可变

#import "ButtonView.h"

@interface ButtonView ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ButtonView

- (instancetype)init{
    if (self = [super init]) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews{
    //可以用button代替,但可操作性降低
    _iconView = [UIImageView new];
    [self addSubview:_iconView];
    _iconView.sd_layout.topSpaceToView(self, 3).centerXEqualToView(self).widthIs(30).heightIs(30);
    
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:10];
    _titleLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_titleLabel];
    _titleLabel.sd_layout.topSpaceToView(_iconView, 2).centerXEqualToView(_iconView).heightIs(7).widthIs(40);
    
}

- (void)setImageName:(NSString *)imageName{
    _iconView.image = [UIImage imageNamed:imageName];
}
- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}
- (void)setIsSelected:(BOOL)isSelected{
    if (isSelected == YES) {
        _titleLabel.textColor = [UIColor redColor];
    }else{
        _titleLabel.textColor = [UIColor lightGrayColor];
    }
}

@end
