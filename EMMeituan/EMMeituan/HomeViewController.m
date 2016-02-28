//
//  HomeViewController.m
//  EMMeituan
//
//  Created by mazhi'hua on 16/2/28.
//  Copyright © 2016年 easemob. All rights reserved.
//

#import "HomeViewController.h"
#import "MapViewController.h"
#import "SearchViewController.h"
#import "SanViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)UIImageView *arrowImage;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //设置导航栏
    [self setNav];
    
    
}

///设置导航栏
-(void)setNav
{
    ///创建导航栏
    UIView * navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navView.backgroundColor = My_Color(33, 192, 174);
    [self.view addSubview:navView];
    ///1 选择城市
    //城市
    UIButton * cityBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 40, 25)];
    cityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cityBtn setTitle:@"北京" forState:UIControlStateNormal];
    [cityBtn addTarget:self action:@selector(cityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:cityBtn];
    
    //向下箭头
    UIImageView * arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_homepage_downArrow"]];
    arrowImage.frame = CGRectMake(CGRectGetMaxX(cityBtn.frame), 38, 13, 10);
    [navView addSubview:arrowImage];
    self.arrowImage = arrowImage;
    
    ///2 地图按钮
    UIButton * mapBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 42, 28, 42, 30)];
    [mapBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [mapBtn addTarget:self action:@selector(mapButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:mapBtn];
    
    ///3 搜索框
    //搜索框
    UIButton * searchView = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cityBtn.frame)+21, 28, CGRectGetMinX(mapBtn.frame)-21-CGRectGetMaxX(cityBtn.frame)-36, 30)];
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = 14;
    [searchView addTarget:self action:@selector(searchViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:searchView];
    
    //搜索图片
    UIImageView * searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 7, 15, 15)];
    searchImage.image = [UIImage imageNamed:@"icon_homepage_search"];
    [searchView addSubview:searchImage];
    
    //站位文字
    UILabel * placeHolerLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, CGRectGetWidth(searchView.frame)-22, 30)];
    placeHolerLabel.text = @"主人想搜什么，点这里哦";
    placeHolerLabel.font = [UIFont systemFontOfSize:14];
    placeHolerLabel.textColor = [UIColor grayColor];
    [searchView addSubview:placeHolerLabel];
    
    ///4 扫一扫
    CGFloat sanBtnWH = 24;
    UIButton * sanBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 42 - sanBtnWH , 32, sanBtnWH, sanBtnWH)];
    [sanBtn setBackgroundImage:[UIImage imageNamed:@"icon_homepage_scan"] forState:UIControlStateNormal];
    [sanBtn addTarget:self action:@selector(sanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:sanBtn];
}

#pragma mark 按钮点击事件
// 城市按钮的点击事件
-(void)cityButtonClick:(UIButton *)cityBtn
{
    NSLog(@"城市按钮被点击了，主人出去游玩，要换地方啦！");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1f];
    self.arrowImage.transform = CGAffineTransformRotate(self.arrowImage.transform, M_PI);
    [UIView commitAnimations];
}

//地图按钮的点击事件
-(void)mapButtonClick:(UIButton *)mapBtn
{
    NSLog(@"主人对这个城市不熟悉，要查一下具体位置啊");
    MapViewController * mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

//搜索框按钮的点击事件
-(void)searchViewButtonClick:(UIButton *)searchView
{
    NSLog(@"主人想要搜索，热门服务快点过来啊！");
    SearchViewController * searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}

//扫一扫按钮的点击事件
-(void)sanButtonClick:(UIButton *)sanBtn
{
    NSLog(@"主人想要扫一扫哦，可能要付费咯！");
    SanViewController * sanVC = [[SanViewController alloc] init];
    [self.navigationController pushViewController:sanVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
