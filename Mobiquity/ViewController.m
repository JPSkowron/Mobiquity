//
//  ViewController.m
//  Mobiquity
//
//  Created by JP Skowron on 3/31/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "ViewController.h"
#import <DropboxSDK/DropboxSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didPressLink {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
}

@end
