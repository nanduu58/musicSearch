//
//  AlbumCustomTableViewCell.h
//  MusicSearch
//
//  Created by KishorePenumalli on 9/2/15.
//  Copyright (c) 2015 InfyAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumCustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *artistName;

@end
