//
//  MNKSelfieViewController.h
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKViewControllerUntimed.h"

@interface MNKSelfieViewController : MNKViewControllerUntimed <UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UIImageView *sheepView;
- (IBAction)cameraBtnAction:(id)sender;
- (IBAction)shareBtnAction:(id)sender;
- (IBAction)savePhoto:(id)sender;



@end
