//
//  IconLabel.h
//  IconLabel
//
//  Created by César Vilera on 8/26/15.
//  Copyright (c) 2015 18Feats. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IconLabel : UILabel
-(id)initWithFrame:(CGRect)frame text:(NSString *)text andIcon:(UIImage *)icon;
-(void)setIcon:(UIImage *)icon;
-(UIImage *)getIcon;
@end
