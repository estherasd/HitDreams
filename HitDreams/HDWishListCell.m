//
//  HDWishCell.m
//  HitDreams
//
//  Created by Esther Aguilar on 3/1/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWishListCell.h"
#import "HDWish.h"
#import "HDWishCell.h"

@implementation HDWishListCell

@synthesize wishList;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier wishList: (HDWishList *)wList
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.wishList = wList;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wishList.wishes.count;
}

// método que nos pregunta acerca de la celda a usar.
// el cuerpo del método construye la celda con el caracter que corresponda en el array según
// el índice

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WCell";
    
    HDWishCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[HDWishCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    HDWish *wish = self.wishList.wishes[indexPath.row];
    
    cell.wishPhoto.image = [UIImage imageWithContentsOfFile:wish.photo];
    
    cell.wishDescription.text = wish.description;
    cell.wishShop.text = wish.shop;
    
    //cell.textLabel.text = wish.description;
    //cell.detailTextLabel.text = wish.shop;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(HDWishCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*HDGalleryView *galleryView = [[HDGalleryView alloc] initWithWishList:self.wishLists[indexPath.row]];*/
    
    /*[cell setCollectionViewDataSourceDelegate:self index:indexPath.row];*/

}

- (void) setCollectionViewDataSourceDelegate
{
    
    
    self.wishListTable.delegate = self;
    self.wishListTable.dataSource = self;
    
    [self.contentView addSubview:self.wishListTable];
    [self.wishListTable reloadData];
}

@end
