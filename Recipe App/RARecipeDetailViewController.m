//
//  RARecipeDetailViewController.m
//  Recipe App
//
//  Created by Benjamin Thomas Gurrola on 9/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat margin = 15;

@interface RARecipeDetailViewController ()

@end

@implementation RARecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 64 + margin;
    CGFloat heightForDescription = [self heightForDescription:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, self.view.frame.size.width -  2 * margin, heightForDescription)];
    
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)heightForDescription:(NSString *)description {
    
    CGRect bounding = [description boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    
    return bounding.size.height;
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
