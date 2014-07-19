//
//  testAppMasterViewController.h
//  sampleCaptureForIos
//
//  Created by KazuakiMATSUO on 7/20/14.
//  Copyright (c) 2014 KazuakiMATSUO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class testAppDetailViewController;

@interface testAppMasterViewController : UITableViewController

@property (strong, nonatomic) testAppDetailViewController *detailViewController;

@end
