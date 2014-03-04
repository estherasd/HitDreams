//
//  HDWishListViewCell.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/26/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWishListViewCell.h"
#import "HDGalleryViewCell.h"

@implementation HDWishListViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList:(HDWishList *)wishList
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        /*layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
        layout.itemSize = CGSizeMake(44, 44);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;*/
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10);
        [flowLayout setItemSize:CGSizeMake(80, 80)];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [flowLayout setMinimumInteritemSpacing:10.0f];
        [flowLayout setMinimumLineSpacing:10.0f];
        
        /*self.collectionView = [[HDGalleryView alloc] initWithFrame:CGRectMake(0, 20, 300, 300) collectionViewLayout:flowLayout wishList: wishList];*/
        
        [self.collectionView registerClass:[HDGalleryViewCell class] forCellWithReuseIdentifier:@"CVCell"];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate index:(NSInteger)index
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    //self.collectionView.index = index;
    
    /*[self.contentView addSubview:self.collectionView];
    [self.collectionView reloadData];*/
}


@end
