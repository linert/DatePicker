//
//  ViewController.m
//  DatePicker
//
//  Created by linert on 16/7/19.
//  Copyright © 2016年 TRMedia. All rights reserved.
//

#import "ViewController.h"
#import "LHPickerView.h"
@interface ViewController (){
    UIDatePicker *_datePicker;
    UIView *_datePickerNav;
    UIPickerView *_pickerView;
    NSArray *_provinces;
    NSArray *_cities;
    LHPickerView *_LHPickerView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _LHPickerView = [[LHPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 160, self.view.bounds.size.width, 160) andCallback:^(NSString *province, NSString *city) {
        NSLog(@"province---%@--------city-----%@",province,city);
    }];
  
    [self.view addSubview:_LHPickerView];
    
}


-(void)createDatePicker{
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 160, self.view.bounds.size.width, 160)];
    _datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_datePicker];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    _datePicker.locale = locale;
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
}



-(void)dateChanged:(UIDatePicker *)sender{
    NSDate *date = sender.date;
    NSLog(@"%@",date);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
