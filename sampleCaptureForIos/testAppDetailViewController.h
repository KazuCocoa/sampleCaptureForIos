//
//  testAppDetailViewController.h
//  sampleCaptureForIos
//
//  Created by KazuakiMATSUO on 7/20/14.
//  Copyright (c) 2014 KazuakiMATSUO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testAppDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
