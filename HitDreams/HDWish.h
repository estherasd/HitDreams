//
//  HDWish.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDWish : NSObject{
    NSInteger wishListId;
    NSString *description;
    NSString *photo;
    NSString *lat;
    NSString *lon;
    NSString *shop;
    NSString *shopAdress;
};

@property (nonatomic, readwrite) NSInteger wishListId;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *lat;
@property (nonatomic, copy) NSString *lon;
@property (nonatomic, copy) NSString *shop;
@property (nonatomic, copy) NSString *shopAdress;

@end

