//
//  StellarTextField.h
//  stellar-wifi
//
//  Created by tongle on 2017/7/12.
//  Copyright © 2017年 qingpei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum: NSUInteger {
    EmailType = 0,
    PasswordType = 1,
    EnterNameType = 2,
}EmailOrPassword;

@interface StellarTextField : UITextField

@property (nonatomic,assign)EmailOrPassword type;

-(void)textFieldDidChange:(UITextField *)textField;

-(void)setUpUI;


@end
