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
    [self showAlert:@"点击了被遮挡的视图"];
}

- (void)showAlert:(NSString *)msg
{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"" message:msg preferredStyle:UIAlertControllerStyleAlert];
    __weak typeof(alertVC) weakAlert = alertVC;
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakAlert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertVC addAction:action];
    [self.window.rootViewController presentViewController:alertVC animated:YES completion:nil];
}

@end
