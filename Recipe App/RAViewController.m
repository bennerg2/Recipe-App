//
//  RAViewController.m
//  Recipe App
//
//  Created by Benjamin Thomas Gurrola on 9/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RARecipes.h"
#import "RARecipeDetailViewController.h"

static NSString *recipeID = @"recipeID";

@interface RAViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.frame;
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:recipeID];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    [tableView   dequeueReusableCellWithIdentifier:recipeID];

    return [RARecipes count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:recipeID];
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RARecipeDetailViewController *viewController = [RARecipeDetailViewController new];
    viewController.recipeIndex = indexPath.row;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
