//
//  MNKScrollViewController.m
//  Follow Me
//
//  Created by Jake Jermanok on 6/17/14.
//  Copyright (c) 2014 Manok Inc. All rights reserved.
//

#import "MNKScrollViewController.h"

@implementation MNKScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *tempImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sheep 166.png"]];
    _imageView = tempImageView;
    [_scrollView setScrollEnabled:YES];
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.maximumZoomScale = 4.0;
    _scrollView.delegate = self;
    [self.scrollView setClipsToBounds:YES];
    [_scrollView addSubview:_imageView];
    // Do any additional setup after loading the view.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    UIView *endView = (UIView *)view;
    NSLog(@"%f %f", endView.window.frame.origin.x, endView.window.frame
        .origin.y);
    if (endView.center.x > 160 - 5 & endView.center.x < 160 + 5 &
        endView.center.y > 210 - 5 & endView.center.y < 210 + 5)
        [self performSegueWithIdentifier:@"outOfSheepEye" sender:self];
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
