//
//  ViewController.m
//  ch1_init
//
//  Created by Alexander Popov on 7/1/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "ViewController.h"
#import "glesInitViewController.h"
#import "glesInitMiscViewController.h"
#import "glesInitTextureViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    _items = @[
               @"VA init & draw",
               @"OO VA init & draw",
               @"Texture display"
               ];

    [[[self navigationController] navigationBar] setTranslucent:NO];
    [self setTitle:@"Samples"];
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_items count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [[cell textLabel] setText:_items[[indexPath row]]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger index = [indexPath row];
   
    UIViewController *vc = nil;
    
    if (index == 0) {
        vc = [[glesInitViewController alloc] init];
    } else if (index == 1) {
        vc = [[glesInitMiscViewController alloc] init];
    } else if (index == 2) {
        vc = [[glesInitTextureViewController alloc] init];
    }
    
    [[self navigationController] pushViewController:vc animated:YES];
    
}

@end
