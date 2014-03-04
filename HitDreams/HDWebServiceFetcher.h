//
//  HDWebServiceFetcher.h
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDWishList.h"
#import "HDWish.h"
#import <dispatch/queue.h>

@protocol FinishUploadControllerDelegate

- (void) didFinishUploadWish: (HDWish *) uploadedWish;
@end

@interface HDWebServiceFetcher : NSObject<NSXMLParserDelegate, NSURLConnectionDataDelegate>
{
    int wishNum;
    int wishListNum;
    dispatch_queue_t queue;
    dispatch_queue_t img_queue;
    NSString *serverURL;
}
@property (weak) id<FinishUploadControllerDelegate> delegate;

@property (nonatomic, copy) NSMutableArray *wishLists;
@property (nonatomic, copy) NSMutableString *currentString;
@property (nonatomic, copy) NSMutableDictionary *currentFields;
@property (nonatomic, copy) HDWishList *currentWishList;
@property (nonatomic, strong) HDWish *uploadedWish;
@property (nonatomic, copy) NSDictionary *wishDict;

- (id) init;
- (NSArray *) fetchListsWithError:(NSError **)outError;
- (void) jsonSubmitToServer: (NSString *)url theWish: (HDWish *)wish;

@end
