## UITextField_Encapsulation

今天有时间把项目中所有的emailName、Password、UserName的textfield输入都封装在StellarTextField中，减少视图层的代码冗余，防止代码重复，使以后自己看着清晰，别人看着不累


1. EmailName输入 

2. Password输入

3. UserName输入

* 枚举

        typedef enum: NSUInteger {
                EmailType = 0,
                PasswordType = 1,
                EnterNameType = 2,
        }EmailOrPassword;

*  定义两个方法：

        -(void)textFieldDidChange:(UITextField *)textField;

        -(void)setUpUI;
        
* 修改placeholder颜色

        NSMutableAttributedString * placeholder = [[NSMutableAttributedString alloc] initWithString:str];
            [placeholder addAttribute:NSForegroundColorAttributeName
                                value:[UIColor lightGrayColor]
                                range:NSMakeRange(0, str.length)];
            self.attributedPlaceholder = placeholder;

* 编辑时一键清除

        self.clearButtonMode = UITextFieldViewModeWhileEditing;