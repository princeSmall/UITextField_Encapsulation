//
//  StellarTextField.m
//  stellar-wifi
//
//  Created by iOS on 2017/7/12.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "StellarTextField.h"

@implementation StellarTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:normalTextSize];
        self.backgroundColor = rgba(255, 255, 255, 0.2);
        self.textColor = [UIColor whiteColor];
        [self setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
        
    }
    return self;
}
-(void)setUpUI{
    if (self.type == EmailType) {
        self.placeholder = NSLocalizedString(@"EMAIL_PLACEHOLDER", nil);
        self.leftView = ({
            NSString * str = NSLocalizedString(@"EMAIL_PLACEHOLDER", nil);
            NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:str];
            [placeholder addAttribute:NSForegroundColorAttributeName
                                value:[UIColor lightGrayColor]
                                range:NSMakeRange(0, str.length)];
            
            self.attributedPlaceholder = placeholder;
            self.keyboardType = UIKeyboardTypeEmailAddress;
            UIImageView *userNameImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-email"]];
            [userNameImage setFrame:CGRectMake(0, 0, 40, 40)];
            userNameImage.contentMode = UIViewContentModeCenter;
            userNameImage;
        });
        
    }else if(self.type == PasswordType){
        self.leftView = ({
            NSString * str = NSLocalizedString(@"PASSWORD_PLACEHOLDER", nil);
            NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:str];
            [placeholder addAttribute:NSForegroundColorAttributeName
                                value:[UIColor lightGrayColor]
                                range:NSMakeRange(0, str.length)];
            self.attributedPlaceholder = placeholder;
            self.secureTextEntry = YES;
            UIImageView *userNameImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-password"]];
            [userNameImage setFrame:CGRectMake(0, 0, 40, 40)];
            userNameImage.contentMode = UIViewContentModeCenter;
            userNameImage;
        });
    }else if(self.type == EnterNameType){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        self.textColor = [UIColor blackColor];
        self.layer.borderColor = LIGHT_TEXTCOLOR.CGColor;
        self.layer.borderWidth = 1;
        self.placeholder = NSLocalizedString(@"CONFIG_NAME_PLACEHOLDER", nil);
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.leftView = ({
            UIView *emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 37)];
            emptyView;
        });

    }else{
        
    }

}
- (void)textFieldDidChange:(UITextField *)textField
{
        if (textField.text.length > 23) {
            textField.text = [textField.text substringToIndex:23];
    }
}



@end
