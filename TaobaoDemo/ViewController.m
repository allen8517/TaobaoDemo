//
//  ViewController.m
//  TaobaoDemo
//
//  Created by 建装网 on 16/6/17.
//  Copyright © 2016年 Alen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
{
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popAlter:) name:@"past" object:nil];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.center = self.view.center;
    label.text = @"可以通过其他出复制内容，再打开本App";
    _label = label;
    [self.view addSubview:_label];
    
}



- (void)popAlter:(id)sender{

    NSString  *string = [UIPasteboard generalPasteboard].string;
    if (string) {
        UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"淘宝分享" message:string delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定 ", nil];
        [alert show];
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex) {
        _label.text = [UIPasteboard generalPasteboard].string;
        [UIPasteboard removePasteboardWithName:[UIPasteboard generalPasteboard].string];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
