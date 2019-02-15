//
//  SubView.h
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../secNib/SecView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SubView :SecView
@property(nonatomic,strong)SecView *secView;
@end

NS_ASSUME_NONNULL_END
