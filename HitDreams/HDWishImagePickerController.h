//
//  HDWishImagePickerController.h
//  HitDreams
//
//  Created by Esther Aguilar on 3/2/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDWishImagePickerController : UIImagePickerController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *wishPicture;
@property (strong, nonatomic) IBOutlet UIView *wishToolBar;

- (IBAction)takePhoto:(id)sender;
- (IBAction)displayPhotoMenu:(id)sender;

@end
