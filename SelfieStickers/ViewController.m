//
//  ViewController.m
//  SelfieStickers
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "ViewController.h"
#import "Sticker.h"


@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property Sticker *stickerView;
@property Sticker *whiskerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stickerView = [[Sticker alloc]initWithImage:[UIImage imageNamed:@"glasses"]];
    [self.view addSubview:self.stickerView];
    self.stickerView.center = self.view.center;
    
    self.whiskerView = [[Sticker alloc]initWithImage:[UIImage imageNamed:@"whiskers"]];
    [self.view addSubview:self.whiskerView];
    self.whiskerView.center = self.view.center;
}

- (IBAction)onTakePhotoPressed:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)onChoosePhotoPressed:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];

}

@end
