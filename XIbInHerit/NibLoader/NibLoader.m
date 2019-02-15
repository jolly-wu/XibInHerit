//
//  IView.m
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import "NibLoader.h"

@interface NibLoader()
{
    NSMapTable<NSString *,UINib *> * nibTable;
}
@end

@implementation NibLoader

- (instancetype)init
{
    if (self = [super init]) {
        nibTable = [NSMapTable strongToStrongObjectsMapTable];
    }
    return self;
}

+ (instancetype)shared
{
    static NibLoader * loader = nil;
    if (loader == nil) {
        loader = [[NibLoader alloc] init];
    }
    return loader;
}


- (id)loadFrom:(Class )cla
{
    NSString * nib = NSStringFromClass(cla);
    UINib * uNib = [nibTable objectForKey:nib];
    id targetObject = nil;
    if (!uNib) {
    //存储加载nib的归档
        uNib = [UINib nibWithNibName:nib bundle:nil];
        [nibTable setObject:uNib forKey:nib];
    }
    
    //从nib解档
    NSArray * ary = [uNib instantiateWithOwner:nil options:nil];
    for (id object in ary) {
        if ([object isKindOfClass:cla]) {
            targetObject = object;
            break;
        }
    }
    return targetObject;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
