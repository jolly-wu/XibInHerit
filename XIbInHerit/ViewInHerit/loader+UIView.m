//
//  IUIView.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "loader+UIView.h"
#import "../NibLoader/NibLoader.h"
#import <objc/runtime.h>

@implementation UIView(loader)

/*
 作者:jolly
 函数名:nib_load
 功能说明:$funcDes
 入参描述:
 返回值描述:
 */

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeMethod:@selector(hitTest:withEvent:) target:@selector(iv_hitTest:withEvent:)];
    });
}

+ (void)exchangeMethod:(SEL)ori target:(SEL)target
{
    Method mOri = class_getInstanceMethod(self, ori);
    Method mTar = class_getInstanceMethod(self, target);
    method_exchangeImplementations(mOri, mTar);
}

+ (id)nib_load:(Class)cla
{
    static NibLoader * loader = nil;
    if (loader == nil) {
        loader = [NibLoader shared];
    }
    UIView* target = [loader loadFrom:cla];
    Class supperCla = cla;
    
    NSMutableArray * claList = [NSMutableArray new];
    while ((supperCla = [supperCla superclass])) {
        if (supperCla == UIView.class) {
            break;
        }
        [claList insertObject:supperCla atIndex:0];
    }
    
    NSArray * selfSubViews = target.subviews;
    for (Class supperCla in claList) {
        UIView *current = [loader loadFrom:supperCla];
        if (current == nil) {
            current = [[supperCla alloc] initWithFrame:target.frame];
        }
        current.frame = [target bounds];
        current.backgroundColor = [UIColor colorWithRed:1 green:2 blue:1 alpha:0.7];
        
        //取出父类成员，并加进子类中
        unsigned propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList(supperCla, &propertyCount);
        //(const char *) attri = 0x000000010b0c0cf7 "T@\"BaseView\",&,N,V_baseView"
        
        for ( int i = 0 ; i < propertyCount ; i++ ) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if (propertyName)
            {
                //父类控件成员
                id val = [current valueForKey:propertyName];
                [target setValue:val forKey:propertyName];
            }
        }
        [target addSubview:current];
    }
    
    for (UIView * v in selfSubViews) {
        [target bringSubviewToFront:v];
    }
    return target;
}

- (void)iv_setOrigin:(CGPoint )pt
{
    CGRect frame = self.frame;
    frame.origin = pt;
    self.frame = frame;
}

- (void)iv_setSize:(CGSize )size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIView *)iv_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [self iv_hitTest:point withEvent:event];
    if(hitView == self && self.touchPassThrough == YES){
        return nil; //该hitView不响应事件，事件则透传下去。
    }
    return hitView;
}

- (void)setTouchPassThrough:(BOOL)touchPassThrough
{
    objc_setAssociatedObject(self, &(@selector(setTouchPassThrough:)), @(touchPassThrough), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)touchPassThrough
{
    NSNumber * ret = objc_getAssociatedObject(self, &(@selector(setTouchPassThrough:)));
    return ret.boolValue;
}

- (UIView *)iv_viewOfClass:(Class)cla
{
    for (UIView * v in self.subviews) {
        if (v.class == cla) {
            return v;
        }
    }
    return nil;
}


@end
