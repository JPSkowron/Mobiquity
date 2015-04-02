//
//  SelectedImageCollectionViewCell.m
//  Mobiquity
//
//  Created by JP Skowron on 4/1/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "SelectedImageCollectionViewCell.h"

@interface SelectedImageCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SelectedImageCollectionViewCell

- (void)setSelectedImage:(UIImage *)selectedImage {
    _selectedImage = selectedImage;

    self.imageView.image = selectedImage;
}
@end
