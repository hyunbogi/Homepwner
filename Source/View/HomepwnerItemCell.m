#import "Possession.h"
#import "View/HomepwnerItemCell.h"

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
    NSString *currencySybol = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencySymbol];
    [valueLabel_ setText:[NSString stringWithFormat:@"%@%@", currencySybol, [possession valueInDollars]]];
    [nameLabel_ setText:[possession possessionName]];
    [imageView_ setImage:[possession thumbnail]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    const float kInset = 5.0;
    CGRect bounds = [[self contentView] bounds];
    float h = bounds.size.height;
    float w = bounds.size.width;
    
    const float kValueWidth = 40.0;
    CGSize thumbnailSize = [Possession thumbnailSize];
    float imageSpace = h - thumbnailSize.height;
    CGRect imageFrame = CGRectMake(kInset, imageSpace / 2.0, thumbnailSize.width, thumbnailSize.height);
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
