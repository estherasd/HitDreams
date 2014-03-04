//
//  HDWishCell.h
//  HitDreams
//
//  Created by Esther Aguilar on 3/1/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDWishList.h"
#import "HDWish.h"

@interface HDWishCell : UITableViewCell

@property (nonatomic, strong) HDWishList *wishList;

@property (weak, nonatomic) IBOutlet UIImageView *wishPhoto;
@property (weak, nonatomic) IBOutlet UILabel *wishDescription;
@property (weak, nonatomic) IBOutlet UILabel *wishShop;
@property (weak, nonatomic) IBOutlet UIImageView *wishShopPhoto;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList: (HDWishList *)wList;
- (id) initWithWishList: (HDWishList *)wList reuseIdentifier:(NSString *)reuseIdentifier;

- (void) configureWithWish:(HDWish *)wish;
@end
