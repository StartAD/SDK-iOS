//
//  ViewController.m
//  Demo
//
//  Created by Neo Apostol on 12/24/13.
//  Copyright (c) 2013 com.alek.production. All rights reserved.
//

#import "MainViewController.h"
#import "ContentViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"SeguePush"]) {
        
        UIButton* btn=(UIButton*)sender;
        const long tag = btn.tag;
        ContentViewController* content = (ContentViewController*)[segue destinationViewController];
        
        switch (tag) {
            case 1:
                content.place=@"default_ad";
                break;
            case 2:
                content.place=@"custom";
                break;
                
            default:
                break;
        }
    }
}

@end
