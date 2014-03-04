//
//  HDWebServiceFetcher.m
//  HitDreams
//
//  Created by Esther Aguilar on 2/25/14.
//  Copyright (c) 2014 Esther Aguilar. All rights reserved.
//

#import "HDWebServiceFetcher.h"

@implementation HDWebServiceFetcher

@synthesize wishLists, currentString, currentFields, currentWishList, wishDict;

- (id) init
{
    self = [super init];
    
    if (self)
    {
        wishLists = [[NSMutableArray alloc] init];
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        img_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        serverURL = @"http://192.168.1.105:8000";
    }
    return self;
}

- (NSArray *) fetchListsWithError:(NSError **)outError
{
    BOOL success;
    
    //change URL with the right one
    NSURL *xmlURL = [NSURL URLWithString:@"http://wsf.cdyne.com/WeatherWS/Weather.asmx/GetWeatherInformation"];
    //
    NSURLRequest *req = [NSURLRequest requestWithURL:xmlURL
                                         cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                     timeoutInterval:30];
    //
    
    /*NSURL *jsonURL = [NSURL URLWithString:@"http://192.168.1.105:8000/services/v1/user/3/"];
    
    NSURLRequest *jsonReq = [NSURLRequest requestWithURL:jsonURL
                                         cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                     timeoutInterval:30];

    NSError *error;
    NSURLResponse *jsonResp = nil;
    NSData *jsonData =[NSURLConnection sendSynchronousRequest:jsonReq
                                            returningResponse:&jsonResp
                                                        error:outError];
    */
    NSURLResponse *resp = nil;
    NSData *data =[NSURLConnection sendSynchronousRequest:req
                                                       returningResponse:&resp
                                                                   error:outError];
    NSLog(@"%@", resp.suggestedFilename);
    if (!data)
        //TODO: if there is no data --> tell the user
        return nil;
    /*
    if (!data || !jsonData)
        return nil;*/
    //
    [wishLists removeAllObjects];
    wishNum = 0;
    wishListNum = 0;
    /*
    //JSON
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:kNilOptions
                                                               error:&error];
    NSLog(@"JSON: %@", jsonDict);
    /////////// END JSON
    
    NSArray *wishLs = [jsonDict objectForKey:@"wishlists"];
    NSLog(@"JSON: %@", wishLs);

    
    [self jsonParseDictionary:wishLs];*/
    /*{
     date = "2014-02-23T01:00:00";
     description = "Quiero un Ferrari";
     direction = "<null>";
     id = 1;
     img = "/media/ferrari.jpg";
     latitude = "-1";
     longitude = "-1";
     "resource_uri" = "/services/v1/wish/1/";
     shop = "<null>";
     },
     {
     date = "2014-03-02T01:00:00";
     description = Anillo;
     direction = "<null>";
     id = 3;
     img = "/media/joya.jpg";
     latitude = "-1";
     longitude = "-1";
     "resource_uri" = "/services/v1/wish/3/";
     shop = "<null>";
     }

     */
    NSXMLParser *parser;
    parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    
    //
    success = [parser parse];
    if (!success)
    {
        *outError = [parser parserError];
        return nil;
    }
    
    NSArray *output = [wishLists copy];
    return output;
    
}


- (void) jsonSubmitToServer: (NSString *)url theWish: (HDWish *)wish
{
    NSURL *serverUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:serverUrl];
    NSString *requestString = [NSString stringWithFormat: @"?dump&description=%@&img=%@&wishList=%d", wish.description, wish.photo, wish.wishListId];
    
    NSMutableData *postData=[NSMutableData data];
    [postData appendData:[requestString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSLog(@"content length %d",[postData length]);
    [request setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection *connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [self setUploadedWish:wish];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Did fail with error %@" , [error localizedDescription]);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *httpResponse;
    httpResponse = (NSHTTPURLResponse *)response;
    int statusCode = [httpResponse statusCode];
    NSLog(@"Status code was %d", statusCode);
    NSLog(@"Respuesta: %@", httpResponse.allHeaderFields );
    
    if (statusCode == 200)
    {
        [self.delegate didFinishUploadWish:self.uploadedWish];
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   
    
}
- (void) jsonParseDictionary:(NSArray *)jsonWishLists
{
    for (int i=0; i<jsonWishLists.count; i++) {
        
        currentWishList = [[HDWishList alloc] init];
        NSDictionary *jsonWishList = jsonWishLists[i];
        NSNumber *wishListId = [jsonWishList objectForKey:@"id"];
        
        currentWishList.name = [jsonWishList objectForKey:@"name"];
        currentWishList.wishListId = [wishListId intValue];
        
        NSArray *wishes = [jsonWishList objectForKey:@"wishes"];
        for (int j=0; j<wishes.count; j++) {
            NSDictionary *jsonWish = wishes[j];
            HDWish *wish = [[HDWish alloc] init];
            [wish setDescription:[jsonWish objectForKey:@"description"]];
            [wish setWishListId: [[jsonWish objectForKey:@"id"] intValue]];
            [wish setPhoto: [@"http://192.168.1.105:8000" stringByAppendingString:[jsonWish objectForKey:@"img"]]];
            
            [currentWishList.wishes addObject:wish];
        }
        
        [wishLists addObject:currentWishList];
        
        //NSDictionary *jsonWishes = [jsonDictionary objectForKey:@"wishes"];
        //HDWish *wish = [[HDWish alloc] init];
    
    }
    //
    
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"WeatherDescription"])
    {
        currentFields = [[NSMutableDictionary alloc] init];
        wishNum++;
    }
    else if (attributeDict.count == 0) return;
    //WeatherID = UserID
    else if ([elementName isEqualToString:@"WeatherID"])
    {
        [currentFields setObject:[attributeDict objectForKey:@"WeatherID"] forKey:@"WeatherID"];
    }
    else if ([elementName isEqualToString:@"Description"])
    {
        [currentFields setObject:[attributeDict objectForKey:@"Description"] forKey:@"Description"];
    }
    else if ([elementName isEqualToString:@"PictureURL"])
    {
        [currentFields setObject:[attributeDict objectForKey:@"PictureURL"] forKey:@"PictureURL"];
    }
    else if ([elementName isEqualToString:@"Lat"])
    {
        [currentFields setObject:[attributeDict objectForKey:@"Lat"] forKey:@"Lat"];
    }
    else if ([elementName isEqualToString:@"Lon"])
    {
        [currentFields setObject:[attributeDict objectForKey:@"Lon"] forKey:@"Lon"];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"WeatherDescription"])
    {
        //
        currentWishList = [[HDWishList alloc] init];
        wishListNum++;
        //
        [currentWishList setWishListId:wishListNum];
        [currentWishList setName:[currentFields objectForKey:@"Description"]];
        
        /*dispatch_async(img_queue, ^{
            
            NSURL *url = [NSURL URLWithString:[currentFields objectForKey:@"PictureURL"]];
            NSError *error = nil;
            NSData *image = [NSData dataWithContentsOfURL:url options:0 error:&error];
            
            if(!error && image && [image length] > 0)
            {
                HDWish *wish = [[HDWish alloc] init];
                [wish setDescription:[@"Wish Number" stringByAppendingFormat:@" %d", wishNum]];
                wish.photo = [UIImage imageWithData:image];
                //
                [currentWishList.wishes addObject:wish];
                [wishDict setValue:wish forKey:currentWishList.name];
            };
        });*/
        
        HDWish *wish = [[HDWish alloc] init];
        [wish setDescription:[@"Wish Number" stringByAppendingFormat:@" %d", wishNum]];
        [wish setPhoto:[currentFields objectForKey:@"PictureURL"]];
        [wish setWishListId:currentWishList.wishListId];
        //
        [currentWishList.wishes addObject:wish];
        [wishLists addObject:currentWishList];
        //
        currentWishList = nil;
        currentFields = nil;
    }
    else
    {
        if (currentFields && currentString)
        {
            NSString *trimmed;
            trimmed = [currentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [currentFields setObject:trimmed forKey:elementName];
        }
        
    }
    
    currentString = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!currentString)
    {
        currentString = [[NSMutableString alloc] init];
    }
    //
    [currentString appendString:string];
}
@end
