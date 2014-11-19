//
//  ViewController.m
//  DyAttachmentDemo
//
//  Created by Hao Zheng on 11/17/14.
//  Copyright (c) 2014 Hao Zheng. All rights reserved.
//

#import "ViewController.h"
#import "MovingBehavior.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *mainAnimator;

@property (nonatomic, strong) MovingBehavior *movingBehavior;

@property (weak, nonatomic) IBOutlet UIButton *clickMeBtn;

@end

@implementation ViewController

#define SCREENHEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])
#define SCREENWIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setup UI
    _clickMeBtn.backgroundColor = [UIColor grayColor];
    _clickMeBtn.center = CGPointMake(SCREENWIDTH/2, SCREENHEIGHT/2);
    
    self.mainAnimator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    
}

- (IBAction)pressedBtn:(id)sender {
    if (!self.movingBehavior) {
        self.movingBehavior = [[MovingBehavior alloc] initWithItem:_clickMeBtn];
    }
    self.movingBehavior.targetPoint = CGPointMake(SCREENWIDTH/2, SCREENHEIGHT/4);
    //self.dragBehavior.velocity = 0;
    
    //once added, it will effect
    [self.mainAnimator addBehavior:self.movingBehavior];
    
    
}
@end
