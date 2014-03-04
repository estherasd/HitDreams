//
//  HDViewController.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/22/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDViewController.h"
#import "HDPendingBusinessesViewController.h"
#import "HDGalleryViewController.h"
#import "HDWishListViewCell.h"
#import "HDWishListCell.h"
#import "HDWish.h"
#import "HDWishCell.h"
#import "HDWishImagePickerController.h"
#import "HDPhotoUploadViewController.h"

@interface HDViewController ()

@end

@implementation HDViewController
@synthesize photoUploadController;

- (id) initWithWishLists:(NSArray *)lists
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self)
    {
        self.wishLists = lists;
    }
    
    return self;
}

- (void) viewDidLayoutSubviews
{
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title=@"HitDreams";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.wishListsTableView.delegate = self;
    [self.wishListsTableView registerNib:[UINib nibWithNibName:@"HDWishCell" bundle:nil ] forCellReuseIdentifier:@"WCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (IBAction)pendingClick:(id)sender {
    
    HDPendingBusinessesViewController *pendingBusinessVC = [[HDPendingBusinessesViewController alloc] init];
    
    self.navigationItem.title=@"Volver";
    
    [self.navigationController pushViewController:pendingBusinessVC animated:YES];

    
    /*[self presentViewController: pendingBusinessVC
                       animated: YES
                     completion:nil];*/
}

- (IBAction)takePhoto:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    
    /*
     The user wants to use the camera interface. Set up our custom overlay view for the camera.
     */
    //imagePickerController.showsCameraControls = NO;
    
    /*
     Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
     */
    //[[NSBundle mainBundle] loadNibNamed:@"HDWishPhotoView" owner:self options:nil];
    //self.wishToolBar.frame = imagePickerController.cameraOverlayView.frame;
    //imagePickerController.cameraOverlayView = self.wishToolBar;
    //self.wishToolBar = nil;
    
    self.imagePickerController = imagePickerController;
    [self.navigationController presentViewController:self.imagePickerController animated:YES completion:nil];
    
    
    /*HDWishImagePickerController *picker = [[HDWishImagePickerController alloc] initWithNibName:@"HDWishImagePickerController" bundle:nil];
    
    picker.allowsEditing = YES;
    
    [self presentViewController: picker
                       animated: YES
                     completion:nil];
    
  */
    /*UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = YES;
    //picker.delegate = self;
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    // queremos cambiar el estilo de la navigationBar del image picker
    // lo actualizaremos en cuanto se muestre el navigation controller
    // por eso, decimos picker.delegate = self y nos implementamos los delegados
    //<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
    // Asi tendremos navigationController:(UINavigationController *)navigationController
    //willShowViewController: y imagePickerController:(UIImagePickerController *)picker
    // didFinishPickingMediaWithInfo:(NSDictionary *)info
    //picker.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    //self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController: picker
                       animated: YES
                     completion:nil];*/
}

- (IBAction)showGallery:(id)sender {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    [flowLayout setItemSize:CGSizeMake(80, 80)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:10.0f];
    [flowLayout setMinimumLineSpacing:10.0f];

    
    HDGalleryViewController *galleryVC = [[HDGalleryViewController alloc] initWithCollectionViewLayout:flowLayout];

    self.navigationItem.title=@"Volver";
    
    [self.navigationController pushViewController:galleryVC animated:YES];
    
}

- (IBAction)showPhotoMenu:(id)sender {
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Seleccione opción:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Subir como Deseo",
                            nil];
    
    [popup showInView:self.view];
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.wishLists.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HDWishList *wishList = self.wishLists[section];
    return wishList.wishes.count;
}

// método que nos pregunta acerca de la celda a usar.
// el cuerpo del método construye la celda con el caracter que corresponda en el array según
// el índice

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *identifier = @"TVCell";
    static NSString *identifier = @"WCell";
    
    HDWishCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        /*cell = [[HDWishCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier wishList:self.wishLists[indexPath.row]];*/
        cell = [[HDWishCell alloc] initWithWishList:self.wishLists[indexPath.row] reuseIdentifier:identifier];
    }
    
    HDWishList *wishList = self.wishLists[indexPath.section];
    HDWish *wish = wishList.wishes[indexPath.row];
    
    //TODO: quitar esto...
    /*UIImage *image = [UIImage imageWithContentsOfFile:wish.photo];*/
    /*cell.wishPhoto.image = [UIImage imageWithData:[[NSData alloc] initWithBase64Encoding:wish.photo]];*/
    //cell.wishPhoto.image = image;
    
    /*if  (wish.description == nil)
    {
            wish.description = @"Autogenerated description";
    }*/
    //cell.wishPhoto.image = [UIImage imageWithContentsOfFile:wish.photo];
    
    //cell.wishDescription.text = wish.description;
    //cell.wishShop.text = wish.shop;
    
    //HDWishList *wishList = self.wishLists[indexPath.row];
    
    /*cell.imageView.image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dress1" ofType:@"jpeg"]];
    
    self.testImage.image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dress1" ofType:@"jpeg"]];*/
    /*cell.textLabel.text = [NSString stringWithFormat:@"%@", wishList.name];
    cell.detailTextLabel.text = @"Wish list de <user>";*/
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    HDWishList *wishList = self.wishLists[section];
    
    return wishList.name;
}


/*- (void)tableView:(UITableView *)tableView willDisplayCell:(HDWishListViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath*/
- (void)tableView:(UITableView *)tableView willDisplayCell:(HDWishCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    HDWishList *wishList = self.wishLists[indexPath.section];
    HDWish *wish = wishList.wishes[indexPath.row];
    
    [cell configureWithWish:wish];
    
    /*HDGalleryView *galleryView = [[HDGalleryView alloc] initWithWishList:self.wishLists[indexPath.row]];*/
    
    //[cell setCollectionViewDataSourceDelegate:self index:indexPath.row];
    
    //[cell setCollectionViewDataSourceDelegate];
}

#pragma mark - UITableViewDelegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    HDWishList *wishList = self.wishLists[0];
    return wishList.wishes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HDGalleryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CVCell" forIndexPath:indexPath];
    
    // Configure the cell...
    // MEter los datos de la nota en la celda
    
    UIImage *image;
    int row = [indexPath row];
    
    HDWishList *wishList = self.wishLists[0];
    HDWish *wish = wishList.wishes[row];
    image = [UIImage imageWithContentsOfFile: wish.photo];
    
    //image = [UIImage imageNamed:_wishList.wishes[row]];
    cell.imageView.image = image;
    
    return cell;

}

#pragma mark - UIScrollViewDelegate Methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (![scrollView isKindOfClass:[HDGalleryView class]]) return;
    
    CGFloat horizontalOffset = scrollView.contentOffset.x;
    
    HDGalleryView *collectionView = (HDGalleryView *)scrollView;
    //NSInteger index = collectionView.index;
    //self.contentOffsetDictionary[[@(index) stringValue]] = @(horizontalOffset);
}

#pragma mark - UIImagePickerDelegate Methods

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Seleccione opción:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Subir como Deseo",
                            nil];
    
    //[popup showInView:self.view];
    
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    self.photoPicked = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    
    //[self.wishPicture setImage: image];
    
    //[self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        HDPhotoUploadViewController *photoUpController = [[HDPhotoUploadViewController alloc] initWithNibName:@"HDPhotoUploadViewController" bundle:nil andWishLists:self.wishLists];
        
        self.photoUploadController = photoUpController;
        self.photoUploadController.photoPicked = self.photoPicked;
        
        /*[self.navigationController presentViewController:photoUploadController animated:YES completion:nil];*/
        [self dismissViewControllerAnimated:YES completion:NULL];
        self.imagePickerController = nil;
        if (self.photoUploadController != nil)
        {
            /*[self.navigationController presentViewController:self.photoUploadController animated:YES completion:nil];*/
            
            self.photoUploadController.delegate = self;
            [self.navigationController pushViewController:self.photoUploadController animated:YES];
        }
    }
}
- (void)didFinishUploading:(HDWish *)uploadedWish
{
    //elimina todo lo que haya por encima
    if ([[self.navigationController viewControllers] count] > 1)
        [self.navigationController popToRootViewControllerAnimated:YES];
    HDWishList *updatedWishList = self.wishLists[uploadedWish.wishListId];
    
    [updatedWishList.wishes addObject:uploadedWish];
    [self.wishListsTableView reloadData];
}

@end

