//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Hyunbok Lee on 12. 9. 20..
//  Copyright (c) 2012년 Hyunbok Lee. All rights reserved.
//

#import "View/HomepwnerItemCell.h"
#import "Possession.h"

@implementation HomepwnerItemCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        valueLabel_ = [[UILabel alloc] initWithFrame:CGRectZero];
        [[self contentView] addSubview:valueLabel_];
        [valueLabel_ release];
        
        nameLabel_ = [[UILabel alloc] initWithFrame:CGRectZero];
        [[self contentView] addSubview:nameLabel_];
        [nameLabel_ release];
        
        imageView_ = [[UIImageView alloc] initWithFrame:CGRectZero];
        [[self contentView] addSubview:imageView_];
        [imageView_ setContentMode:UIViewContentModeCenter];
        [imageView_ release];
    }
    return self;
}

- (void)setPossession:(Possession *)possession {
    [valueLabel_ setText:[NSString stringWithFormat:@"$%d", [possession valueInDollars]]];
    [nameLabel_ setText:[possession possessionName]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const float kInset = 5.0;
    CGRect bounds = [[self contentView] bounds];
    float h = bounds.size.height;
    float w = bounds.size.width;
    
    const float kValueWidth = 40.0;
    
    CGRect imageFrame = CGRectMake(kInset, kInset, 40, 40);
    [imageView_ setFrame:imageFrame];
    
    CGRect nameFrame = CGRectMake(imageFrame.size.width + imageFrame.origin.x + kInset,
                                  kInset,
                                  w - (h + kValueWidth + kInset * 4.0),
                                  h - kInset * 2.0);
    [nameLabel_ setFrame:nameFrame];
    
    CGRect valueFrame = CGRectMake(nameFrame.size.width + nameFrame.origin.x + kInset,
                                   kInset,
                                   kValueWidth,
                                   h - kInset * 2.0);
    [valueLabel_ setFrame:valueFrame];
}

@end
