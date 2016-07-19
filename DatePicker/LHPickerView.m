//
//  LHPickerView.m
//  DatePicker
//
//  Created by linert on 16/7/19.
//  Copyright © 2016年 TRMedia. All rights reserved.
//

#import "LHPickerView.h"

@implementation LHPickerView{
    NSArray *_provinces;
    NSArray *_cities;
    NSArray *state;
    NSString *province;
    NSString *city;
}
-(void)showView:(UIView *)view{
    [view addSubview:self];
}

-(instancetype)initWithFrame:(CGRect)frame andCallback:(Callback)callback{
    self = [super initWithFrame:frame];
    if (self) {
        self.callback = callback;
        self.frame = frame;
        self.pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        self.pickerView.backgroundColor = [UIColor redColor];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.pickerView];
        
        _provinces = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"]];
        province = [[_provinces objectAtIndex:0] objectForKey:@"state"];
        _cities = [[_provinces objectAtIndex:0] objectForKey:@"cities"];
    }
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _provinces.count;
    }else if (component == 1){
        return _cities.count;
    }else
        return 0;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
      if (component == 0) {
        NSString *title = [[_provinces objectAtIndex:row] objectForKey:@"state"];
        
        return title;
    }else if (component == 1){
        NSString *title = [_cities objectAtIndex:row];
        
        return title;
    }else
        return nil;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
    
    if (component == 0) {
        _cities = [[_provinces objectAtIndex:row] objectForKey:@"cities"];
        [_pickerView selectRow:0 inComponent:1 animated:YES];
        [_pickerView reloadAllComponents];
        province = [[_provinces objectAtIndex:row] objectForKey:@"state"];
        city = [_cities objectAtIndex:0];
    }else if(component == 1){
       
        city = [_cities objectAtIndex:row];
    }
    
    self.callback(province,city);
}




@end
