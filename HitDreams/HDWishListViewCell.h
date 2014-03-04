//
//  HDWishListViewCell.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/26/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDGalleryView.h"
#import "HDWishList.h"

@interface HDWishListViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet HDGalleryView *collectionView;

@property (nonatomic, copy) HDWishList *wishList;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList: (HDWishList *)wishList;

- (void) setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index;


@end
