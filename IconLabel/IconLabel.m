//
//  IconLabel.m
//  IconLabel
//
//  Created by César Vilera on 8/26/15.
//  Copyright (c) 2015 18Feats. All rights reserved.
//

#import "IconLabel.h"

@interface IconLabel ()
@property (strong, nonatomic) UIImage *icon;
@property CGRect iconFrame;

@end

@implementation IconLabel

-(id)initWithFrame:(CGRect)frame text:(NSString *)text andIcon:(UIImage *)icon {
    self = [super initWithFrame:frame];
    if (self) {
        [self setText:text andIcon:icon];
    }
    return self;
}

-(void)setText:(NSString *)text andIcon:(UIImage *)icon {
    _icon = icon;
    NSMutableAttributedString *textAttrString= [[NSMutableAttributedString alloc] init];
    if (icon) {
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = icon;
        attachment.bounds = (_iconFrame.size.height && _iconFrame.size.width) ? _iconFrame : CGRectMake(0, self.font.descender/2, MAX(icon.size.width, icon.size.height), MAX(icon.size.width, icon.size.height));
        NSAttributedString *iconAttrString = [NSAttributedString attributedStringWithAttachment:attachment];
        [textAttrString appendAttributedString:iconAttrString];
    }
    
    if (text) {
        [textAttrString appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
    }
    
    self.attributedText = textAttrString;
    [self sizeToFit];
}

-(void)setText:(NSString *)text {
    [self setText:text andIcon:_icon];
}

-(void)setIcon:(UIImage *)icon {
    [self setText:self.text andIcon:_icon];
}

-(UIImage *)getIcon {
    return self.icon;
}


@end
