//
//  Album.h
//  MusicSearch
//
//  Created by KishorePenumalli on 9/1/15.
//  Copyright (c) 2015 InfyAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy) NSString * artistName;
@property (nonatomic, copy) NSString * albumName;
@property (nonatomic, copy) NSString * albumImageUrl;
@property (nonatomic) NSArray * trackNames;

@end
