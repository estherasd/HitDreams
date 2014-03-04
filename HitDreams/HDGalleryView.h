//
//  HDGalleryView.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDWishList.h"

@interface HDGalleryView : UICollectionView<UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) HDWishList *wishList;

- (id) initWithWishList: (HDWishList *) wishList;
- (id) initWithFrame:(CGRect)frame
collectionViewLayout:(UICollectionViewFlowLayout *)layout
            wishList:(HDWishList *)wishes;

@end
