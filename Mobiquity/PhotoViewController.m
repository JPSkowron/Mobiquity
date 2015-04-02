//
//  PhotoViewController.m
//  Mobiquity
//
//  Created by JP Skowron on 4/1/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController () <UIImagePickerControllerDelegate, UIDocumentInteractionControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) UIImage *selectedImage;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onCameraButtonTapped:(UIButton *)sender {

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;

    [self presentViewController:imagePickerController animated:YES completion:nil];



}

- (IBAction)onCameraRollButtonTapped:(UIButton *)sender {

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.selectedImage = (UIImage *)[info valueForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = self.selectedImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.delegate selectedPhoto:self.selectedImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
