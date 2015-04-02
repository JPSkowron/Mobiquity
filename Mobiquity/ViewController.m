//
//  ViewController.m
//  Mobiquity
//
//  Created by JP Skowron on 3/31/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "ViewController.h"
#import <DropboxSDK/DropboxSDK.h>
#import "PhotoViewController.h"
#import "SelectedImageCollectionViewCell.h"

@interface ViewController () <DBRestClientDelegate, UICollectionViewDataSource, UICollectionViewDelegate, PhotoViewControllerDelegate>

@property (nonatomic, strong) DBRestClient *restClient;
@property (strong, nonatomic) NSArray *photoArray;
@property (strong, nonatomic) NSMutableArray *photoMuttableArray;
@property (strong, nonatomic) PhotoViewController *photoVC;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    self.restClient.delegate = self;

    self.photoArray = [NSArray new];
    self.photoMuttableArray = [NSMutableArray new];

    self.photoVC.delegate = self;
}
- (void)didPressLink {
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SelectedImageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    if (self.photoArray.count > 0) {
        cell.selectedImage = self.photoArray[indexPath.row];
    }
    return cell;
}
#pragma - Photo Related

- (void)selectedPhoto:(UIImage *)photo {
    [self.photoMuttableArray addObject:photo];
    self.photoArray = self.photoMuttableArray;
}

- (void)setPhotoArray:(NSArray *)photoArray {
    _photoArray = photoArray;
    [self.collectionView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Segue"]) {
        PhotoViewController *photoVC = segue.destinationViewController;
        photoVC.delegate = self;
    }
}

@end
