//
//  PhotoViewController.m
//  Mobiquity
//
//  Created by JP Skowron on 4/1/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DropboxSDK/DropboxSDK.h>
#import "PhotoViewController.h"

@interface PhotoViewController () <UIImagePickerControllerDelegate, UIDocumentInteractionControllerDelegate, UINavigationControllerDelegate, DBRestClientDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) UIImage *selectedImage;

@property (strong, nonatomic) DBRestClient *dbClient;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dbClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    self.dbClient.delegate = self;

}

- (IBAction)onCameraButtonTapped:(UIButton *)sender {

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];

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

    [self uploadImage];

    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.delegate selectedPhoto:self.selectedImage];
}

- (void)uploadImage {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy_HH-mm-ss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];


    NSString *filename = [NSString stringWithFormat:@"%@.png", dateString];
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];

    [UIImagePNGRepresentation(self.imageView.image) writeToFile:file atomically:YES];

    NSString *destDir = @"/";
    [self.dbClient uploadFile:filename toPath:destDir withParentRev:nil fromPath:file];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
