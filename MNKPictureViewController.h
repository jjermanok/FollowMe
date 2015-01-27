//
//  MNKPictureViewController.h
//  Follow Me
//
//  Created by Jake Jermanok on 6/17/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//



//Not Currently Used

#import "MNKViewController.h"

@interface MNKPictureViewController : MNKViewController {
    UIImageView *selectedImage;
    BOOL sheepTRselected;
    BOOL sheepBLselected;
}

@property IBOutlet UIImageView *sheepTR;
@property IBOutlet UIImageView *sheepBL;

@end
