//
//  ViewController.m
//  Mobiquity
//
//  Created by JP Skowron on 3/31/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "ViewController.h"
#import <DropboxSDK/DropboxSDK.h>

@interface ViewController () <DBRestClientDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) DBRestClient *restClient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    self.restClient.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

//}

//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

//}
- (void)didPressLink {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
}

@end
