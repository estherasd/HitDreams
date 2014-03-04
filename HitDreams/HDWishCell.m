//
//  HDWishCell.m
//  HitDreams
//
//  Created by Esther Aguilar on 3/1/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWishCell.h"
#import "HDWishList.h"
#import "HDWish.h"

@implementation HDWishCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList: (HDWishList *)wList
{
    self = [super initWithStyle:style reuseIdentifier:  reuseIdentifier];
    if (self) {
        self.wishList = wList;
    }
    return self;
}

- (id) initWithWishList: (HDWishList *)wList reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    
    if (self) {
        self.wishList = wList;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureWithWish: (HDWish *) wish
{
    
    NSURL *url = [NSURL URLWithString:wish.photo];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = nil;
    if (imageData == nil){
        image = [UIImage imageWithData:[[NSData alloc] initWithBase64Encoding:wish.photo]];
    }
    else image = [UIImage imageWithData:imageData];

    /*UIImage *image = [UIImage imageWithContentsOfFile:wish.photo];*/
    
    /*UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dress1" ofType:@"jpeg"]];
    */
    
    self.wishPhoto.image = image;
    self.wishDescription.text = wish.description;
    self.wishShop.text =@"A Shop";
    
    if  (wish.description != nil)
    {
        self.wishDescription.text = wish.description;
    }
        
}

@end
