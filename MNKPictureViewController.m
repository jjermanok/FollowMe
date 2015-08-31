//
//  MNKPictureViewController.m
//  Follow Me
//
//  Created by Jake Jermanok on 6/17/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//




//Not Currently Used

#import "MNKPictureViewController.h"

@implementation MNKPictureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (([touch locationInView:self.view].x > _sheepBL.center.x - 40 &
        [touch locationInView:self.view].x < _sheepBL.center.x + 40) &&
        ([touch locationInView:self.view].y > _sheepBL.center.y - 40 &
        [touch locationInView:self.view].y < _sheepBL.center.y + 40) && sheepTRselected == FALSE)
        sheepBLselected = TRUE;
    else
        sheepBLselected = FALSE;
    if (([touch locationInView:self.view].x > _sheepTR.center.x - 40 &
         [touch locationInView:self.view].x < _sheepTR.center.x + 40) &&
        ([touch locationInView:self.view].y > _sheepTR.center.y - 40 &
         [touch locationInView:self.view].y < _sheepTR.center.y + 40) && sheepBLselected == FALSE)
        sheepTRselected = TRUE;
    else
        sheepTRselected = FALSE;
}

- (void)touchesMoved:(NSSet *)set withEvent:(UIEvent *)event
{
    UITouch *drag = [[event allTouches] anyObject];
    if (sheepBLselected)
        _sheepBL.center = [drag locationInView:self.view];
    if (sheepTRselected)
        _sheepTR.center = [drag locationInView:self.view];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ((_sheepBL.center.x > 113 & _sheepBL.center.x < 127) &&
        (_sheepBL.center.y > 426 & _sheepBL.center.y < 440) &&
        (_sheepTR.center.x > 193 & _sheepTR.center.x < 207) &&
        (_sheepTR.center.y > 346 & _sheepTR.center.y < 360))
        [self performSegueWithIdentifier:@"outOfSheep" sender:self];
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
