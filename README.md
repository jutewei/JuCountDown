# JuCountDown
GCD实现倒计时

调用方法
 NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
 
 [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    NSDate *endDate = [dateFormatter dateFromString:[self juGetEndDate]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate] + 24*3600)];

    countDown=[[JuCountDown alloc]init];


    [countDown juSetEndDate:endDate_tomorrow handle:^(id result) {
        self.ju_labTime.text=result;
    }];
