//
//  SecView.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "SecView.h"
#import "../loader+UIView.h"
@implementation SecView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BaseView *)baseView
{
    if (!_baseView) {
        _baseView = (BaseView *)[self iv_viewOfClass:BaseView.class];
    }
    return _baseView;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//}
@end
