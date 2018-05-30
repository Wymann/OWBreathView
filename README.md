README
===========================
这个项目是实现呼吸灯效果。可以设置颜色，呼吸速度，颜色强度，呼吸灯大小。代码使用简单。代理方法实现点击事件。

****
	
|Author|陈怀章Owen|
|---|---
|E-mail 1|wymannchan@163.com
|E-mail 2|wymannchan@gmail.com


****
## 目录
* [使用方式](#使用方式)
* [效果图](#效果图)

### 使用方式
-----------
```Java
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
```
-----------

### 效果图
-----------
![image](http://github.com/itmyhome2013/readme_add_pic/raw/master/images/nongshalie.jpg)
-----------
