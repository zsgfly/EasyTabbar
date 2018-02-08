//
//  EasyTabbar.m
//  JD
//
//  Created by 腾盈 on 2018/2/7.
//  Copyright © 2018年 腾盈. All rights reserved.
//

#import "EasyTabbar.h"
#import "ButtonView.h"

@interface EasyTabbar()

@property (nonatomic, strong) ButtonView *currentView;

@end

@implementation EasyTabbar

- (instancetype)init{
    if (self = [super init]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    //五个按钮
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    for (int i = 0; i < 5; i++) {
        ButtonView *buttonView = [ButtonView new];
        buttonView.tag = 100+i;
        buttonView.title = _titleArray[i];
        if (i == 0) {
            buttonView.imageName = _selectedImageArray[i];
            buttonView.isSelected = YES;
            _currentView = buttonView;
        }else{
            buttonView.imageName = _normalImageArray[i];
        }
        buttonView.backgroundColor = [UIColor whiteColor];
        [self addSubview:buttonView];
        buttonView.sd_layout.leftSpaceToView(self, i*width/5).topEqualToView(self).bottomEqualToView(self).widthIs(width/5);
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    for (int i = 0; i < 5; i++) {
        ButtonView *buttonView = (ButtonView *)[self viewWithTag:100+i];
        buttonView.title = _titleArray[i];
        if (i == 0) {
            buttonView.imageName = _selectedImageArray[i];
            buttonView.isSelected = YES;
            _currentView = buttonView;
        }else{
            buttonView.imageName = _normalImageArray[i];
        }
        buttonView.sd_layout.leftSpaceToView(self, i*width/5).topEqualToView(self).bottomEqualToView(self).widthIs(width/5);
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSInteger tag = touch.view.tag;
    if (tag >= 100 && tag < 105) {
        ButtonView *btnView = (ButtonView *)touch.view;
        btnView.isSelected = YES;
        btnView.imageName = _selectedImageArray[tag-100];
        if (![_currentView isEqual:btnView]) {
            //重复点击
            _currentView.isSelected = NO;
            _currentView.imageName = _normalImageArray[_currentView.tag-100];
        }
        _currentView = btnView;
        if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
            [self.delegate didSelectedIndex:tag-100];
        }
    }
}
- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
}
- (void)setNormalImageArray:(NSArray *)normalImageArray{
    _normalImageArray = normalImageArray;
}
- (void)setSelectedImageArray:(NSArray *)selectedImageArray{
    _selectedImageArray = selectedImageArray;
}


@end
