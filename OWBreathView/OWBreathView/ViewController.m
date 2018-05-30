//
//  ViewController.m
//  OWBreathView
//
//  Created by Owen Chen on 2018/5/30.
//  Copyright © 2018年 Owen. All rights reserved.
//

#import "ViewController.h"
#import "OWBreathView.h"

@interface ViewController ()<OWBreathViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    OWBreathView *breathView = [[OWBreathView alloc] initWithPoint:CGPointMake(100.0, 200.0) InsetWidth:8.0 outSetWidth:25.0];
    breathView.delegate = self;
    breathView.tintColor = [UIColor blueColor];
    breathView.breathSpeed = 2;
    breathView.startAlpha = 0.6;
    [self.view addSubview:breathView];
    [breathView startAnimation];
}

#pragma mark - OWBreathViewDelegate
-(void)didClickBreathView:(OWBreathView *)breathView
{
    NSLog(@"点击了 breathview");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
