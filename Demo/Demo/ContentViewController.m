//
//  ContentViewController.m
//  Demo
//
//  Created by Neo Apostol on 12/24/13.
//  Copyright (c) 2013 com.alek.production. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController () <SADWebViewDelegate>
{
    SADWebView* webView;
}
-(void)loadData;
@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reloadSADView:(id)sender
{
    [self loadData];
}

-(void)loadData
{
    if (!webView /*&& self.place!=AD_NOPLACE*/) {
        
        webView = [[SADWebView alloc]initWithId:APPLICATION_ID];
        webView.sadDelegate = self;
    }
    
    [webView loadAd:LANGUAGE_RU andPlaceId:self.place];
}

#pragma mark SADViewBannerdelegate
-(void)onReceivedAd
{
    webView.frame=CGRectMake(0, 100, self.view.bounds.size.width, webView.height);
    [self.view addSubview:webView];
}

@end
