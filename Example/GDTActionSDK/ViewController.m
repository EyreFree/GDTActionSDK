//
//  ViewController.m
//  GDTActionSDKSample
//
//  Created by Chao Gao on 2017/11/23.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "ViewController.h"
#import <GDTActionSDK/GDTAction.h>

@interface ViewController ()
{
    NSArray *actionNames;
    NSDictionary *actionParam;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    actionNames = @[GDTSDKActionNameApply,GDTSDKActionNameStartApp,GDTSDKActionNameAddToCart,GDTSDKActionNameSearch,GDTSDKActionNameRate,GDTSDKActionNameShare,GDTSDKActionNameConsult,GDTSDKActionNamePageView,GDTSDKActionNamePurchase,GDTSDKActionNameRegister,GDTSDKActionNameDownloadApp,GDTSDKActionNameReservation,GDTSDKActionNameViewContent,GDTSDKActionNameInitiateCheckOut,GDTSDKActionNameCompleteOrder,GDTSDKActionNameAddToWishList];
    actionParam = @{@"apply_name":@"Tencent",
                    @"is_adult":@(YES),
                    @"product_id":@"12345", //商品id，字符串类型
                    @"value":@(12000),      //金额，单位分，整数类型
                    @"favourite_items":@[@"Travelling",@"Flying",@"Shopping"],
                    GDTSDKActionParamKeyAudienceType:@(GDTActionParamAudienceType_UsedAudience) //带有此标示的App启动行为系统会认定为老客户的App启动行为，不再判定是否为激活行为。
                    };
    NSError *error = nil;
    [_actionParamView setText:[self dictionaryToStr:actionParam error:error]];
}

-(NSString *)dictionaryToStr:(NSDictionary *)dic error:(NSError *)error
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    if (!error) {
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonStr;
    }
    return @"";
}

-(NSDictionary *)strToDictionary:(NSString *)str error:(NSError *)error
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (!error && [jsonData isKindOfClass:[NSDictionary class]] ) {
        return (NSDictionary *)jsonData;
    }
    return nil;
}
- (IBAction)report:(id)sender {
    
    NSError *error = nil;
    NSDictionary *d =  [self strToDictionary:[_actionParamView text] error:error];
    if (d != nil) {
        [GDTAction logAction:[_actionNameReportView text] actionParam:d];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Param 格式错误" message:[error description] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil] show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [actionNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return actionNames[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_actionNameReportView setText:actionNames[row]];
}

-(IBAction)textFiledReturnEditing:(id)sender {
    
    [sender resignFirstResponder];
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
