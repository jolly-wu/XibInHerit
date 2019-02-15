//
//  BaseViw.h
//  XIbInHerit
//
//  Created by jolly on 2019/2/15.
//  Copyright © 2019 jolly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView
@property(nonatomic,assign)int a;
@property(nonatomic,strong)IBOutlet UIView * headPhotoView;
@property(nonatomic,strong)IBOutlet UIButton * queryButton;
@end

NS_ASSUME_NONNULL_END
