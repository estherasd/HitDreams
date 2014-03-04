//
//  HDPhotoUploadViewController.h
//  HitDreams
//
//  Created by Esther Aguilar on 3/2/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDWish.h"
#import "HDWebServiceFetcher.h"

@protocol PhotoUploadViewControllerDelegate

- (void) didFinishUploading: (HDWish *) uploadedWish;

@end

@interface HDPhotoUploadViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, FinishUploadControllerDelegate>


@property (copy, nonatomic) NSArray *wishLists;
@property (copy, nonatomic) UIImage *photoPicked;
@property (readwrite, nonatomic) NSInteger wishListIdSelected;

@property (weak) id<PhotoUploadViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *wishList;
//@property (weak, nonatomic) IBOutlet UITextField *wishListName;
@property (weak, nonatomic) IBOutlet UITextField *wishDescription;
@property (weak, nonatomic) IBOutlet UITextField *shopName;
@property (weak, nonatomic) IBOutlet UITextField *shopAddress;
@property (weak, nonatomic) IBOutlet UIImageView *wishImage;

- (IBAction)uploadPhoto:(id)sender;
- (IBAction)cancelUpload:(id)sender;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andWishLists: (NSArray *) lists;

@end
