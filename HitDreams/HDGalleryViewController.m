//
//  HDGalleryViewController.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/23/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDGalleryViewController.h"
#import "HDGalleryViewCell.h"
#import "HDWish.h"

@interface HDGalleryViewController ()

@end

@implementation HDGalleryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithWishList:(HDWishList *)wishes
{
    self = [super initWithNibName: nil bundle:nil];
    
    if (self)
    {
        self.wishList = wishes;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.collectionView registerClass:[HDGalleryViewCell class] forCellWithReuseIdentifier:@"CVCell"];
    self.collectionView.backgroundColor = [UIColor grayColor];
    
    /*_dressImages = [@[@"dress1.jpeg",
                  @"dress2.jpeg",
                  @"dress3.jpg",
                  @"dress4.jpeg",
                  @"dress5.jpeg",
                    @"dress6.jpeg"
                  ] mutableCopy];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return _dressImages.count;
    return _wishList.wishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HDGalleryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    
    // Configure the cell...
    // MEter los datos de la nota en la celda
    
    UIImage *image;
    int row = [indexPath row];
    
    //image = [UIImage imageNamed:_dressImages[row]];
    HDWish *wish = _wishList.wishes[row];
    image = [UIImage imageWithContentsOfFile: wish.photo];
    //image = [UIImage imageNamed:_wishList.wishes[row]];
    cell.imageView.image = image;
    
    /*cell.imageView.text = [NSString stringWithFormat:@"%d",indexPath.item];*/
    return cell;
}
@end
