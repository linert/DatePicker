//
//  LHPickerView.h
//  DatePicker
//
//  Created by linert on 16/7/19.
//  Copyright © 2016年 TRMedia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Callback)(NSString *province,NSString *city);

@interface LHPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,copy)Callback callback;
@property (nonatomic,strong)UIPickerView *pickerView;
-(instancetype)initWithFrame:(CGRect)frame andCallback:(Callback)callback;
-(void)showView:(UIView *)view;
@end
