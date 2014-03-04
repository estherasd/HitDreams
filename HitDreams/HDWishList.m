//
//  HDWishList.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWishList.h"

@implementation HDWishList
@synthesize wishListId, name, wishes;

- (id) init
{
    self = [super init];
    
    if (self)
    {
        wishes = [[NSMutableArray alloc] init];
    }
    
    return self;
}
@end
