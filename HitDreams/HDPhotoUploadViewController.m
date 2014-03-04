//
//  HDPhotoUploadViewController.m
//  HitDreams
//
//  Created by Esther Aguilar on 3/2/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDPhotoUploadViewController.h"
#import "HDWishList.h"
#import "HDWebServiceFetcher.h"

@interface HDPhotoUploadViewController ()

@end

@implementation HDPhotoUploadViewController

- (IBAction)uploadPhoto:(id)sender {
    HDWish *wishToSubmit = [[HDWish alloc] init];
    [wishToSubmit setWishListId:self.wishListIdSelected];
    [wishToSubmit setDescription:self.wishDescription.text];
    
    //UIImage* image = nil;
    //NSData* dataImage = UIImagePNGRepresentation(self.photoPicked);
    CGDataProviderRef provider = CGImageGetDataProvider(self.photoPicked.CGImage);
    NSData* dataImage = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    NSString* base64Image = [dataImage base64Encoding];
    
    /*
    
    CGDataProviderRef provider = CGImageGetDataProvider(self.photoPicked.CGImage);
    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    const uint8_t* bytes = [data bytes];
    
    NSData *dataToSubmit = [[NSData alloc] initWithBytes:bytes length:data.length];
    
    NSString *photo = [[NSString alloc] initWithData:dataToSubmit encoding:NSUTF8StringEncoding];
    */
    
    [wishToSubmit setPhoto: base64Image];
    
    NSString *url = @"https://posttestserver.com/post.php";
    
    //[self.parentViewController dismissViewControllerAnimated:YES completion:NULL];
    
    HDWebServiceFetcher *fetcher = [[HDWebServiceFetcher alloc] init];
    fetcher.delegate = self;
    [fetcher jsonSubmitToServer: url theWish: wishToSubmit];
}

- (void)didFinishUploadWish:(HDWish *)uploadedWish
{
    [self.delegate didFinishUploading:uploadedWish];
}

- (IBAction)cancelUpload:(id)sender {
    
    [self.delegate didFinishUploading:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andWishLists:(NSArray *)lists
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.wishLists = lists;
        self.wishListIdSelected= -1;
        if (lists.count > 0)
        {
            HDWishList *wishList = lists[0];
            self.wishListIdSelected = wishList.wishListId;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wishImage.image = self.photoPicked;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UIPickerViewDatasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.wishLists.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    HDWishList *wishList = self.wishLists[row];
    return wishList.name;
}

#pragma - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    HDWishList *wishListSelected = self.wishLists[row];
    self.wishListIdSelected = wishListSelected.wishListId;
}

@end
