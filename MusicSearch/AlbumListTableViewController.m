//
//  albumListTableViewController.m
//  MusicSearch
//
//  Created by KishorePenumalli on 9/1/15.
//  Copyright (c) 2015 InfyAdmin. All rights reserved.
//

#import "AlbumListTableViewController.h"
#import "Album.h"
#import "AlbumCustomTableViewCell.h"


@interface AlbumListTableViewController()

@property (strong, nonatomic) NSArray *albumArray;
@property (strong, nonatomic) Album *album;
@end

@implementation AlbumListTableViewController
    
- (id) init
{
    self = [super init];
    
    if (self != nil)
    {
        //_albumArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self retriveData:self.searchTerm];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
   
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AlbumCustomTableViewCell class]) bundle:nil]  forCellReuseIdentifier:@"customCell"];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
   

}

-(void)retriveData:(NSString *)searchStr{
    
    NSString *urlAsString = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@", searchStr];
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
   
    
    NSDictionary *dictFromData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:nil];
    
    NSArray *results = [dictFromData valueForKey:@"results"];
    
    NSMutableArray *albums = [[NSMutableArray alloc]init];
    
    for (NSDictionary *resultDict in results) {
        Album *album = [[Album alloc] init];
        album.artistName = [resultDict objectForKey:@"artistName"];
        album.albumName = [resultDict objectForKey:@"trackName"];
        album.albumImageUrl = [resultDict objectForKey:@"artworkUrl30"];
        
        [albums addObject:album];
        
    }
    
    self.albumArray = albums; 
    [self.tableView reloadData];
}

//-(void)didReceiveData:(NSDictionary *)data
//{
//    NSArray *resultArray = [[NSArray alloc] init];
//    //resultCount = (int)[parsedObject objectForKey:@"resultCount"];
//    resultArray = (NSArray *)[data objectForKey:@"results"];
//    [self setAlbumArrayFrom:resultArray];
//    [self.tableView reloadData];
//}

//-(void)setAlbumArrayFrom:(NSArray *)resultArray
//{
//   // albumArray = [[NSMutableArray alloc] init];
//    for (NSDictionary * albumDict in resultArray)
//    {
//        Album * album = [[Album alloc] init];
//        album.artistName = [albumDict objectForKey:@"artistName"];
//        album.albumName = [albumDict objectForKey:@"trackName"];
//        album.albumImageUrl = [albumDict objectForKey:@"artworkUrl30"];
//        [self.albumArray addObject:album];
//    
//    }
//    
//}

-(void)fetchingDataFailedWithError:(NSError *)error
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.albumArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    AlbumCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    
    cell.artistName.text = [self.albumArray[indexPath.row] artistName];
    cell.albumName.text = [self.albumArray[indexPath.row] albumName];
    cell.albumImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self.albumArray[indexPath.row] albumImageUrl]]]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
