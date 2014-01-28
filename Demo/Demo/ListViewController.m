//
//  ListViewController.m
//  Demo
//
//  Created by Neo Apostol on 12/24/13.
//  Copyright (c) 2013 com.alek.production. All rights reserved.
//

#import "ListViewController.h"
#import "SADWebView.h"

@interface ListViewController () <SADWebViewDelegate>
{
    NSMutableArray* data;
    SADWebView* webView;
}
@end

@implementation ListViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        data = [NSMutableArray arrayWithObjects:@"Android", @"iPhone", @"WindowsMobile", @"BlackBerry", @"WebOS", @"Ubuntu",@"Windows7",
                @"Mac OS X", @"Linux", @"OS/2", nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor=UIColorFromRGB(0x0099cc);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!webView) {
        webView = [[SADWebView alloc]initWithId:APPLICATION_ID];
        webView.sadDelegate = self;
        [webView loadAd:LANGUAGE_EN andPlaceId:nil];
    }
}

#pragma mark SADViewBannerdelegate

-(void)onShowedAd
{
    [data insertObject:@"" atIndex:0];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (webView.isLoaded && indexPath.row==0) {
        return webView.height;
    }
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* SimpleTableIdentifier = [NSString stringWithFormat:@"Cell=%ld",(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    
    if (webView.isLoaded && indexPath.row==0) {
        
        [webView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, webView.height)];
        CGRect cellFrame = cell.frame;
        [cell setFrame:CGRectMake(cellFrame.origin.x, cellFrame.origin.y, cellFrame.size.width, webView.height)];
        [cell.contentView addSubview:webView];

    } else {

        cell.textLabel.text = [data objectAtIndex:indexPath.row];
    }
    
    cell.contentView.backgroundColor=UIColorFromRGB(0x0099cc);
    
    return cell;
}

@end
