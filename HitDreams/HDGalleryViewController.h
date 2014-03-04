//
//  HDGalleryViewController.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/23/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDGalleryViewCell.h"
#import "HDWishList.h"

@interface HDGalleryViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *dressImages;
@property (strong, nonatomic) HDWishList *wishList;

- (id) initWithWishList: (HDWishList *) wishes;

@end
