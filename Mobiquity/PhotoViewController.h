//
//  PhotoViewController.h
//  Mobiquity
//
//  Created by JP Skowron on 4/1/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PhotoViewControllerDelegate

- (void)selectedPhoto:(UIImage *)photo;

@end

@interface PhotoViewController : UIViewController

@property (strong, nonatomic) id<PhotoViewControllerDelegate>delegate;

@end
