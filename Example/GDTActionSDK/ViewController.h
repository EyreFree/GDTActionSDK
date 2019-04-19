//
//  ViewController.h
//  GDTActionSDKSample
//
//  Created by Chao Gao on 2017/11/23.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *actionNamePickerView;
@property (weak, nonatomic) IBOutlet UITextField *actionNameReportView;
@property (weak, nonatomic) IBOutlet UITextView *actionParamView;

@end

