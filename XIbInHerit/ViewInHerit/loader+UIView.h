//
//  IUIView.h
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView(loader)

@property(nonatomic,assign)BOOL touchPassThrough;//事件透传
+ (id)nib_load:(Class)cla;
- (void)iv_setOrigin:(CGPoint )pt;
- (void)iv_setSize:(CGSize )size;
- (UIView *)iv_viewOfClass:(Class)cla;
@end

NS_ASSUME_NONNULL_END
