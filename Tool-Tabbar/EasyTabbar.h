//
//  EasyTabbar.h
//  JD
//
//  Created by 腾盈 on 2018/2/7.
//  Copyright © 2018年 腾盈. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EasyTabbarDelegate <NSObject>

- (void)didSelectedIndex:(NSInteger)index;

@end

@interface EasyTabbar : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *normalImageArray;
@property (nonatomic, strong) NSArray *selectedImageArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, weak) id<EasyTabbarDelegate> delegate;

@end
