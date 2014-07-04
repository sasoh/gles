//
//  ViewController.m
//  ch1_init
//
//  Created by Alexander Popov on 7/1/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _items = @[
               @"Vertex array init & draw"
               ];

    [[[self navigationController] navigationBar] setTranslucent:NO];
    [self setTitle:@"Demos"];
    
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

@end
