//
//  HDGalleryView.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDGalleryView.h"
#import "HDGalleryViewCell.h"
#import "HDWish.h"

@implementation HDGalleryView

@synthesize wishList;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame
collectionViewLayout:(UICollectionViewFlowLayout *)layout
wishList:(HDWishList *)wishes
{
    self = [super initWithFrame:CGRectZero
           collectionViewLayout:layout];
    
    if (self)
    {
        self.wishList = wishes;
    }
    
    return self;
    
}

- (id) initWithWishList:(HDWishList *)wishes
{
    self = [super init];
    
    if (self)
    {
        self.wishList = wishes;
        
        [self registerClass:[HDGalleryViewCell class] forCellWithReuseIdentifier:@"CVCell"];
        self.backgroundColor = [UIColor grayColor];
        
    }
    
    return self;
}

#pragma UICollectionViewControllerDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.wishList.wishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HDGalleryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    UIImage *image;
    int row = [indexPath row];
    
    //image = [UIImage imageNamed:self.wishList.wishes[row]];
    
    HDWish *wish = self.wishList.wishes[row];
    image = [UIImage imageWithContentsOfFile: wish.photo];
    cell.imageView.image = image;
    
    return cell;
}

@end
