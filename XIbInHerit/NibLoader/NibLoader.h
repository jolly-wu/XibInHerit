//
//  IView.h
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NibLoader:NSObject

+ (instancetype)shared;
- (id)loadFrom:(Class )cla;

@end

NS_ASSUME_NONNULL_END
