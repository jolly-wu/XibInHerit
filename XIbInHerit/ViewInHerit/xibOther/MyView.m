//
//  MyView.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "MyView.h"
#import "../loader+UIView.h"
@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil];
        NSArray * ary = [nib instantiateWithOwner:self options:nil];
        UIView * subView = ary.firstObject;
        [self addSubview:subView];
        CGRect fr = self.frame;
        fr.size = subView.frame.size;
        self.frame = fr;
    }
    return self;
}

- (void)didMoveToWindow
{
    if (self.window) {
        [self.subviews[0] iv_setSize:self.frame.size];
    }
}

@end
