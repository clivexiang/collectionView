//
//  MyHeadView.m
//  myTableView
//
//  Created by 向春晓 on 16/3/23.
//  Copyright © 2016年 Person. All rights reserved.
//

#import "MyHeadView.h"
#import "Masonry.h"

@implementation MyHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor yellowColor];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.equalTo(self);
        }];
        
    }
    return self;
}

@end
