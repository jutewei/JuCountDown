//
//  ViewController.m
//  JuCountDown
//
//  Created by Juvid on 2018/3/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "ViewController.h"
#import "JuCountDown.h"

@interface ViewController (){

    JuCountDown *countDown;
}
@property (weak, nonatomic) IBOutlet UIView *sh_view;
@property (weak, nonatomic) IBOutlet UILabel *ju_labTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    NSDate *endDate = [dateFormatter dateFromString:[self juGetEndDate]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate] + 24*3600)];

    countDown=[[JuCountDown alloc]init];


    [countDown juSetEndDate:endDate_tomorrow handle:^(id result) {
        self.ju_labTime.text=result;
    }];

    // Do any additional setup after loading the view, typically from a nib.
}


-(NSString *)juGetEndDate{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd";
    NSString *dayStr = [formatDay stringFromDate:now];

    return dayStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
