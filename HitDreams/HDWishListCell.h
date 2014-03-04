//
//  HDWishCell.h
//  HitDreams
//
//  Created by Esther Aguilar on 3/1/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDWishList.h"

@interface HDWishListCell : UITableViewCell<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) HDWishList *wishList;

@property (weak, nonatomic) IBOutlet UITableView *wishListTable;

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList: (HDWishList *)wList;

- (void) setCollectionViewDataSourceDelegate;
@end
