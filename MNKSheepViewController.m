//
//  MNKSheepViewController.m
//  Follow Me
//
//  Created by Jake Jermanok on 6/18/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKSheepViewController.h"

@implementation MNKSheepViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _petCount = 0;
    touchMoved = FALSE;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    if (CGRectContainsPoint(_sheep.frame, location) & touchMoved) {
        _petCount++;
        if (_petCount == 4)
            [self performSegueWithIdentifier:@"outOfPet" sender:self];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    touchMoved = TRUE;
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
