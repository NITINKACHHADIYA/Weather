//
//  ViewController.h
//  Weather
//
//  Created by yourcompnay on 159/06/15.
//  Copyright (c) 2015 YourCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YQL.h"

@interface ViewController : UIViewController {
    YQL *yql;
}

@property (nonatomic, retain) IBOutlet UITextView *QueryTextView;
@property (nonatomic, retain) IBOutlet UITextView *ResultsTextView;
@property (strong, nonatomic) YQL *yql;

-(IBAction)Run_OnClick:(id)sender;


@end

