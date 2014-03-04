//
//  HDWishList.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDWishList : NSObject{
    NSInteger wishListId;
    NSString *name;
    NSMutableArray *wishes;
}

@property (nonatomic, readwrite) NSInteger wishListId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSMutableArray *wishes;

- (id) init;

@end
