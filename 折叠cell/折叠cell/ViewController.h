//
//  ViewController.h
//  折叠cell
//
//  Created by 夏楠 on 2023/8/29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArray;
@property (nonatomic, strong)UIButton *zhedie;

@end

