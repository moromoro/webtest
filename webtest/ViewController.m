//
//  ViewController.m
//  webtest
//
//  Created by moro on 2013/08/03.
//  Copyright (c) 2013年 moro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(id)sender {
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.co.jp"]];
    
    [self.webView loadRequest:req];
}

- (IBAction)tapExitButton:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [paths objectAtIndex:0];
    NSString *bundleID = [[NSBundle mainBundle]bundleIdentifier];
    NSString *appCacheDir = [cacheDir stringByAppendingPathComponent:bundleID];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDirectoryEnumerator *directoryEnm = [fm enumeratorAtPath:appCacheDir];
    
    NSString *file;
    NSError *error;
    while (file = [directoryEnm nextObject]) {
        NSLog(@"%@",file);
        error = nil;
        [fm removeItemAtPath:[appCacheDir stringByAppendingPathComponent:file] error:&error];
        if(error != nil){
            NSLog(@"ERROR %@",[error localizedDescription]);
        }
    }

    _exit(0);
}
@end
