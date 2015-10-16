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

@end

@implementation IconLabel

-(id)initWithFrame:(CGRect)frame text:(NSString *)text andIcon:(UIImage *)icon {
    self = [super initWithFrame:frame];
    if (self) {
        self.icon = icon;
        [self setText:text andIcon:self.icon];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

-(void)setText:(NSString *)text andIcon:(UIImage *)icon {
    NSMutableAttributedString *textAttrString= [[NSMutableAttributedString alloc] init];
    if (icon) {
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = icon;
        float bottom = self.font.descender;
        float size = self.font.lineHeight;
        float dif = MAX(icon.size.height, size) - MIN(icon.size.height, size);
        attachment.bounds = CGRectMake(0, bottom + (dif/2), icon.size.width, icon.size.height);
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

-(UIImage *)getIcon {
    return self.icon;
}

-(void)setIcon:(UIImage *)icon {
    if (icon) {
        if (self.frame.size.height > 0 && icon.size.height > self.frame.size.height) {
            CGSize size = CGSizeMake(icon.size.width, self.frame.size.height);
            UIGraphicsBeginImageContext(size);
            [icon drawInRect:CGRectMake(0, 0, size.width, size.height)];
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            _icon = newImage;
        }else {
            _icon = icon;
        }
    }
    [self setText:self.text andIcon:self.icon];
}

@end
