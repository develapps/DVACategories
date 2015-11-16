//
//  DVAViewController.m
//  DVACategories
//
//  Created by Pablo Romeu on 05/07/2015.
//  Copyright (c) 2014 Pablo Romeu. All rights reserved.
//

#import "DVAViewController.h"
#import <UILabel+DVABadgeLabel.h>

@interface DVAViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) UILabel *label;

@end

@implementation DVAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_label dva_addBadgeLabelToView:self.image andPosition:DVABadgeViewTopRight andOffset:UIOffsetMake(-10, 10)];
    [_label layoutIfNeeded];
    [self dispatchAgain:self];
    
}
- (IBAction)dispatchAgain:(id)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_label dva_setBadgeString:@"1" animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_label dva_setBadgeString:@"2" animated:YES];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_label dva_setBadgeString:@"" animated:YES];
            });
            
        });
    });
}
@end
