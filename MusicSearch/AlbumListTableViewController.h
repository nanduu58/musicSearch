//
//  albumListTableViewController.h
//  MusicSearch
//
//  Created by KishorePenumalli on 9/1/15.
//  Copyright (c) 2015 InfyAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumListTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, copy) NSString * searchTerm;

@property (strong, nonatomic) NSMutableDictionary *jsonDictionary;

@end
