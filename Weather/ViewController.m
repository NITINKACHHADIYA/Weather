//
//  ViewController.m
//  Weather
//
//  Created by yourcompnay on 159/06/15.
//  Copyright (c) 2015 YourCompany. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize QueryTextView;
@synthesize ResultsTextView;
@synthesize yql;

-(void)viewDidLoad {
    [super viewDidLoad];
    yql = [[YQL alloc] init];
    
    NSMutableArray *arrayWetherTypes=[[NSMutableArray alloc] init];
    
    [arrayWetherTypes addObject:@"tornado"];
    [arrayWetherTypes addObject:@"tropical storm"];
    [arrayWetherTypes addObject:@"hurricane"];
    [arrayWetherTypes addObject:@"severe thunderstorms"];
    [arrayWetherTypes addObject:@"thunderstorms"];
    [arrayWetherTypes addObject:@"mixed rain and snow"];
    [arrayWetherTypes addObject:@"mixed rain and sleet"];
    [arrayWetherTypes addObject:@"mixed snow and sleet"];
    [arrayWetherTypes addObject:@"freezing drizzle"];
    [arrayWetherTypes addObject:@"drizzle"];
    [arrayWetherTypes addObject:@"freezing rain"];
    [arrayWetherTypes addObject:@"showers"];
    [arrayWetherTypes addObject:@"showers"];
    [arrayWetherTypes addObject:@"snow flurries"];
    [arrayWetherTypes addObject:@"light snow showers"];
    [arrayWetherTypes addObject:@"blowing snow"];
    [arrayWetherTypes addObject:@"snow"];
    [arrayWetherTypes addObject:@"hail"];
    [arrayWetherTypes addObject:@"sleet"];
    [arrayWetherTypes addObject:@"dust"];
    [arrayWetherTypes addObject:@"foggy"];
    [arrayWetherTypes addObject:@"haze"];
    [arrayWetherTypes addObject:@"smoky"];
    [arrayWetherTypes addObject:@"blustery"];
    [arrayWetherTypes addObject:@"windy"];
    [arrayWetherTypes addObject:@"cold"];
    [arrayWetherTypes addObject:@"cloudy"];
    [arrayWetherTypes addObject:@"mostly cloudy (night)"];
    [arrayWetherTypes addObject:@"mostly cloudy (day)"];
    [arrayWetherTypes addObject:@"partly cloudy (night)"];
    [arrayWetherTypes addObject:@"partly cloudy (day)"];
    [arrayWetherTypes addObject:@"clear (night)"];
    [arrayWetherTypes addObject:@"sunny"];
    [arrayWetherTypes addObject:@"fair (night)"];
    [arrayWetherTypes addObject:@"fair (day)"];
    [arrayWetherTypes addObject:@"mixed rain and hail"];
    [arrayWetherTypes addObject:@"hot"];
    [arrayWetherTypes addObject:@"isolated thunderstorms"];
    [arrayWetherTypes addObject:@"scattered thunderstorms"];
    [arrayWetherTypes addObject:@"scattered thunderstorms"];
    [arrayWetherTypes addObject:@"scattered showers"];
    [arrayWetherTypes addObject:@"heavy snow"];
    [arrayWetherTypes addObject:@"scattered snow showers"];
    [arrayWetherTypes addObject:@"heavy snow"];
    [arrayWetherTypes addObject:@"partly cloudy"];
    [arrayWetherTypes addObject:@"thundershowers"];
    [arrayWetherTypes addObject:@"snow showers"];
    [arrayWetherTypes addObject:@"isolated thundershowers"];
    [arrayWetherTypes addObject:@"not available"];
}
-(IBAction)Run_OnClick:(id)sender {
    
    //NSDictionary *results = [yql query:@"select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"Ahmedabad\")"];
    NSDictionary *results = [yql query:@"select * from weather.forecast where woeid in (select woeid from geo.placefinder where text=\"23.0203458,72.5797426\" and gflags=\"R\")"];
    NSLog(@"%@",results);
    
    NSString *search=[NSString stringWithFormat:@"weather type: %@\n",[results valueForKeyPath:@"query.results.channel.item.condition.text"]];
    
    search=[search stringByAppendingString:[NSString stringWithFormat:@"Temp: %.0f\n",([[results valueForKeyPath:@"query.results.channel.item.condition.temp"] integerValue]-30)/1.8]];
    
    search=[search stringByAppendingString:[NSString stringWithFormat:@"winds: %@ %@\n",[results valueForKeyPath:@"query.results.channel.wind.speed"],[results valueForKeyPath:@"query.results.channel.units.speed"]]];
    
    search=[search stringByAppendingString:[NSString stringWithFormat:@"Precipitation: %%%@\n",[results valueForKeyPath:@"query.results.channel.atmosphere.visibility"]]];
    
    search=[search stringByAppendingString:[NSString stringWithFormat:@"humidity: %%%@\n",[results valueForKeyPath:@"query.results.channel.atmosphere.humidity"]]];
    
    ResultsTextView.text = search;
}


@end
