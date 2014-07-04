//
//  ViewController.h
//  ch1_init
//
//  Created by Alexander Popov on 7/1/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_items;
}

@end
