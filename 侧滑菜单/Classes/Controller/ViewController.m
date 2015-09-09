//
//  ViewController.m
//  侧滑菜单
//
//  Created by liu on 15-3-26.
//  Copyright (c) 2015年 liu. All rights reserved.
//

#import "ViewController.h"
#import "FrontViewController.h"
#import "MenuViewController.h"
#import "RightMenuViewController.h"
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define MenuW 150
@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MenuViewController *menu = [[MenuViewController alloc]init];
    menu.view.frame = CGRectMake(0, 0, MenuW, ScreenH);
    [self addChildViewController:menu];
    [self.view addSubview:menu.view];
    
    //右菜单栏
    RightMenuViewController *rightMenu = [[RightMenuViewController alloc]init];
    rightMenu.view.frame = CGRectMake(ScreenW - MenuW, 0, MenuW, ScreenH);
    [self addChildViewController:rightMenu];
    [self.view addSubview:rightMenu.view];

    
    
    FrontViewController *front = [[FrontViewController alloc]init];
    front.view.frame = self.view.bounds;
    [self addChildViewController:front];
    [self.view addSubview:front.view];

    [front.view addGestureRecognizer:[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(menuViewAppear:)]];
}
#pragma mark - 左滑菜单栏
#if 0
- (void)menuViewAppear:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];

    if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded)
    {
        if (pan.view.frame.origin.x >= 75)
        {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformIdentity;
            }];
        
        }
    }
    else
    {
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, 0);
        [pan setTranslation:CGPointZero inView:pan.view];
        if (pan.view.frame.origin.x >= 150)
        {
            pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
        }
        else if(pan.view.frame.origin.x <= 0)
        {
            pan.view.transform = CGAffineTransformIdentity;
        }
    
    }

}
# endif
#pragma mark - 右滑菜单栏
#if 0
- (void)menuViewAppear:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded)
    {
        if (pan.view.frame.origin.x <= -MenuW * 0.5)
        {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(-MenuW, 0);
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformIdentity;
            }];
            
        }
    }
    else
    {
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, 0);
        [pan setTranslation:CGPointZero inView:pan.view];
        if (pan.view.frame.origin.x <= -MenuW)
        {
            pan.view.transform = CGAffineTransformMakeTranslation( -MenuW, 0);
        }
        else if(pan.view.frame.origin.x >= 0)
        {
            pan.view.transform = CGAffineTransformIdentity;
        }
        
    }
    
}
#endif
#pragma mark - 左右菜单栏
- (void)menuViewAppear:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded)
    {
        if (pan.view.frame.origin.x >=MenuW*0.5) {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
            }];
        }
        else if (pan.view.frame.origin.x <= -MenuW * 0.5)
        {
            
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformMakeTranslation(-MenuW, 0);
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                pan.view.transform = CGAffineTransformIdentity;
            }];
            
        }
    }
    else
    {
        
        pan.view.transform = CGAffineTransformTranslate(pan.view.transform, point.x, 0);
        [pan setTranslation:CGPointZero inView:pan.view];
        if (pan.view.frame.origin.x >= MenuW)
        {
            pan.view.transform = CGAffineTransformMakeTranslation(150, 0);
        }
       
        if (pan.view.frame.origin.x <= -MenuW)
        {
            pan.view.transform = CGAffineTransformMakeTranslation( -MenuW, 0);
        }
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
