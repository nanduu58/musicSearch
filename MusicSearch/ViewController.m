//
//  ViewController.m
//  MusicSearch
//
//  Created by KishorePenumalli on 8/31/15.
//  Copyright (c) 2015 InfyAdmin. All rights reserved.
//

#import "ViewController.h"
#import "AlbumListTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder: aDecoder];
    if (self) {
        
           
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonTapped:(id)sender
{
    [self performSegueWithIdentifier:@"search" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AlbumListTableViewController *albumListTableViewController = segue.destinationViewController;
    albumListTableViewController.searchTerm = self.searchTextField.text;
}
@end
