//
//  ViewController.h
//  webtest
//
//  Created by moro on 2013/08/03.
//  Copyright (c) 2013年 moro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)tapButton:(id)sender;
- (IBAction)tapExitButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
