//
//  SubView.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "SubView.h"
#import "../loader+UIView.h"

@implementation SubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (SecView *)secView
{
    if (!_secView) {
        _secView = (SecView *)[self iv_viewOfClass:SecView.class];
    }
    return _secView;
}

@end
