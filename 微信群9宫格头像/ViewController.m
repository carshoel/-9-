//
//  ViewController.m
//  微信群9宫格头像
//
//  Created by carshoel on 16/11/3.
//  Copyright © 2016年 carshoel. All rights reserved.
//

#import "ViewController.h"
#import "AEIconView.h"

#define kTestUrlStr  @"http://diy.qqjay.com/u2/2014/1130/f71c04514a23a9ecc1661b15b3a62e1f.jpg"

@interface ViewController ()


@property (nonatomic, weak)AEIconView *iconV;//九宫格头像

@property (nonatomic, strong)NSMutableArray <NSString *>*images;//获取到的图片的url

@property (nonatomic, weak)UIButton *selectedBtn;//选中的操作按钮

@end

@implementation ViewController

//懒加载图片url数组
-(NSMutableArray<NSString *> *)images{
    if(!_images){
        _images = [NSMutableArray array];
    }
    return _images;
}

-(void)setSelectedBtn:(UIButton *)selectedBtn{
    if(_selectedBtn.tag == selectedBtn.tag)return;
    _selectedBtn.backgroundColor = [UIColor redColor];
    selectedBtn.backgroundColor = [UIColor orangeColor];
    _selectedBtn = selectedBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1设置控制器view背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //2设置仿微笑群头像
    [self setUpIconView];
    
    //3 设置操作面板
    [self setUpOperationView];
    
}

//设置头像图
- (void)setUpIconView{
    CGFloat w = 200;
    CGFloat h = w;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - w) * 0.5;
    CGFloat y = 50;
    AEIconView *iconV = [[AEIconView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _iconV = iconV;
    iconV.image = [UIImage imageNamed:@"icon.jpg"];
    //设置背景色
    iconV.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:iconV];
}

//设置操作面板
- (void)setUpOperationView{

    //创建一个外框
    CGFloat w = 300;
    CGFloat h = w;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - w) * 0.5;
    CGFloat y = CGRectGetMaxY(self.iconV.frame);
    UIView *bjView = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    [self.view addSubview:bjView];
    
    int column = 3;//三列
    w = w / column;
    h = w;
    
    NSString *title = nil;
    SEL action = @selector(operationBtnClick:);
    UIButton *btn = nil;
    for (int i = 0; i < 9; i ++) {
        x = (i % column) * w;
        y = (i / column) * w;
        
        switch (i) {
            case 0:
                title = @"一张图";
                break;
            case 1:
                title = @"两张图";
                break;
            case 2:
                title = @"三张图";
                break;
            case 3:
                title = @"四张图";
                break;
            case 4:
                title = @"五张图";
                break;
            case 5:
                title = @"六张图";
                break;
            case 6:
                title = @"七张图";
                break;
            case 7:
                title = @"八张图";
                break;
            case 8:
                title = @"九张图";
                break;
                
            default:
                title = @"";
                break;
        }
        
        btn = [self btnWithTitle:title frame:CGRectMake(x, y, w, h) action:action];
        btn.tag = i + 1;
        [bjView addSubview:btn];
    }
    
    
}


//创建一个按钮
- (UIButton *)btnWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 1.0;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor redColor];
    return btn;
}

//按钮点击事件
- (void)operationBtnClick:(UIButton *)btn{
    if(_selectedBtn.tag == btn.tag)return;
    self.selectedBtn = btn;
    [self imagesWithCount:btn.tag];
}

//根据图片个数创建测试数组
- (void)imagesWithCount:(int)count{
    self.images = nil;
    for (int i = 0 ; i < count; i++ ) {
        [self.images addObject:kTestUrlStr];
    }
    self.iconV.images = self.images;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
