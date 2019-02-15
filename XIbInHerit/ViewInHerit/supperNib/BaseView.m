//
//  BaseViw.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "BaseView.h"
#import "../loader+UIView.h"

@implementation BaseView

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
        _a = 100;
    }
    return self;
}

- (void)didMoveToWindow
{
    self.headPhotoView.touchPassThrough = NO;
    UITapGestureRecognizer * gz = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.headPhotoView addGestureRecognizer:gz];
}

- (void)onTap:(UITapGestureRecognizer *)gz
{
    NSLog(@"onTap-----[gz=%@]",gz);
}

- (void)showAlert:(NSString *)msg
{
    
}

@end
