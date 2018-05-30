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
    
    OWBreathView *breathView2 = [[OWBreathView alloc] initWithPoint:CGPointMake(50.0, 100.0) InsetWidth:6 outSetWidth:18.0];
    breathView2.delegate = self;
    breathView2.tintColor = [UIColor redColor];
    breathView2.breathSpeed = 1;
    breathView2.startAlpha = 0.6;
    [self.view addSubview:breathView2];
    [breathView2 startAnimation];
    
    OWBreathView *breathView3 = [[OWBreathView alloc] initWithPoint:CGPointMake(200.0, 150.0) InsetWidth:6 outSetWidth:35.0];
    breathView3.delegate = self;
    breathView3.tintColor = [UIColor yellowColor];
    breathView3.breathSpeed = 1;
    breathView3.startAlpha = 0.5;
    [self.view addSubview:breathView3];
    [breathView3 startAnimation];
    
    OWBreathView *breathView4 = [[OWBreathView alloc] initWithPoint:CGPointMake(250.0, 300.0) InsetWidth:10.0 outSetWidth:50.0];
    breathView4.delegate = self;
    breathView4.tintColor = [UIColor blackColor];
    breathView4.breathSpeed = 3;
    breathView4.startAlpha = 0.7;
    [self.view addSubview:breathView4];
    [breathView4 startAnimation];
    
    OWBreathView *breathView5 = [[OWBreathView alloc] initWithPoint:CGPointMake(80.0, 350.0) InsetWidth:13.0 outSetWidth:80.0];
    breathView5.delegate = self;
    breathView5.tintColor = [UIColor purpleColor];
    breathView5.breathSpeed = 4;
    breathView5.startAlpha = 0.6;
    [self.view addSubview:breathView5];
    [breathView5 startAnimation];
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
