//
//  HDWishImagePickerController.m
//  HitDreams
//
//  Created by Esther Aguilar on 3/2/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWishImagePickerController.h"

@interface HDWishImagePickerController ()

@end

@implementation HDWishImagePickerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    imagePickerController.showsCameraControls = NO;
        
        /*
         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
         */
    [[NSBundle mainBundle] loadNibNamed:@"HDWishPhotoView" owner:self options:nil];
        self.wishToolBar.frame = imagePickerController.cameraOverlayView.frame;
        imagePickerController.cameraOverlayView = self.wishToolBar;
        self.wishToolBar = nil;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    //[self takePicture];
}

- (IBAction)displayPhotoMenu:(id)sender {
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Seleccione opción:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Subir como Deseo",
                            nil];
    
    [popup showInView:self.view];    
}

#pragma mark - UIImagePickerDelegate Methods

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Seleccione opción:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Subir como Deseo",
                            nil];
    
    [popup showInView:self.view];
    
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.wishPicture setImage: image];
    
    //[self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end
