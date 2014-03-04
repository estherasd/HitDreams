//
//  HDPendingBusinessesViewController.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/22/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDPendingBusinessesViewController.h"

@interface HDPendingBusinessesViewController ()

@end

@implementation HDPendingBusinessesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.navigationItem.title=@"Asuntos Pendientes";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewNotesClick:(id)sender {
}

- (IBAction)showGalleryClick:(id)sender {
}

- (IBAction)showGaleryClick:(id)sender {
}
@end
