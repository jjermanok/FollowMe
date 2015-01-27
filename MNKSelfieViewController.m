//
//  MNKSelfieViewController.m
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKSelfieViewController.h"

@implementation MNKSelfieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchZoomSheep:)];
    pinchGestureRecognizer.delegate = self;
    [self.sheepView addGestureRecognizer:pinchGestureRecognizer];
    UIPanGestureRecognizer  *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panSheep:)];
    panGestureRecognizer.maximumNumberOfTouches = 1;
    panGestureRecognizer.delegate = self;
    [self.sheepView addGestureRecognizer:panGestureRecognizer];
}

- (void) pinchZoomSheep:(UIPinchGestureRecognizer *)sender
{
    UIView *sheep = [sender view];
    // The scale factor between the two fingers
    CGFloat factor = [sender scale];
    // Apply transformation only for the beginning or changing states
    if (sender.state == UIGestureRecognizerStateBegan || sender.state == UIGestureRecognizerStateChanged ) {
        // Apply an affine transformation based on the factor
        sheep.transform = CGAffineTransformMakeScale(factor, factor);
    }    
}

- (void) panSheep:(UIPanGestureRecognizer *)sender
{
    UIView *sheep = [sender view];
    if ([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged) {
        // Get the panning move point relative to the parent view
        CGPoint translation = [sender translationInView:[sheep superview]];
        //NSLog(@"x: %1.2f, y: %1.2f",translation.x,translation.y);
        // Add it to the center point of the beard view so that it stays
        // under the finger of the user
        [sheep setCenter:CGPointMake([sheep center].x + translation.x, [sheep center].y + translation.y)];
        // Reset the translation to reduce panning velocity
        // Removing this line will result in the beard view disappearing very quickly
        [sender setTranslation:CGPointZero inView:[sheep superview]];
        
    }               
}

- (void) cameraBtnAction:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    self.photoView.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [_photoView setAlpha:1.0];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) shareBtnAction:(UIButton *)sender {
    
    if (self.photoView.image != nil) {
        
    // An array of content that needs to posted
    NSArray *activityItems = @[@"What a great sheep!", UIImageJPEGRepresentation([self blendImages],0.75)];
    
    
    // Create a new UIActivityViewController with the activityItems array
    UIActivityViewController *activityController = [[UIActivityViewController alloc]
                                                    initWithActivityItems:activityItems applicationActivities:nil];
    // Exclude activities that are irrelevant
    activityController.excludedActivityTypes = @[UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact];
    
    // Present the activityController
    [self presentViewController:activityController
                       animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)blendImages
{
    UIImage *photoImage = self.photoView.image;
    UIImage *sheepImage = self.sheepView.image;
    // Get the size of the photo
    CGSize photoSize = CGSizeMake(photoImage.size.width, photoImage.size.height);
    // Create a bitmap graphics context of the photoSize
    UIGraphicsBeginImageContext( photoSize );
    // Draw the photo in the specified rectangle area
    [photoImage drawInRect:CGRectMake(0,0,photoSize.width,photoSize.height)];
    CGPoint origin = self.sheepView.frame.origin;
    CGSize size = self.sheepView.frame.size;
    CGFloat xScale = photoImage.size.width / self.view.bounds.size.width;
    CGFloat yScale = photoImage.size.height / (self.view.bounds.size.height-44);
    // Draw the beard in the specified rectangle area
    [sheepImage drawInRect:CGRectMake((origin.x * xScale), (origin.y * yScale),
                                      size.width * xScale, size.height * yScale)
                 blendMode:kCGBlendModeNormal alpha:1.0];
    // Save the generated image to an image object
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
