//
//  HDViewController.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/22/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDPhotoUploadViewController.h"

@interface HDViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, PhotoUploadViewControllerDelegate>

@property (strong, nonatomic) NSArray *wishLists;
@property (strong, nonatomic) UIImage *photoPicked;
@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@property (weak, nonatomic) IBOutlet UITableView *wishListsTableView;
@property (weak, nonatomic) IBOutlet UIToolbar *wishToolBar;
@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) HDPhotoUploadViewController *photoUploadController;

- (id) initWithWishLists: (NSArray *) lists;

- (IBAction)pendingClick:(id)sender;
- (IBAction)takePhoto:(id)sender;
- (IBAction)showGallery:(id)sender;
- (IBAction)showPhotoMenu:(id)sender;

@end
