//
//  ViewController.m
//  折叠cell
//
//  Created by 夏楠 on 2023/8/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //折叠cell=======
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(270, 200, 95, 80) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArray = [NSMutableArray arrayWithObjects:@"cell1", @"cell2", @"cell3", @"cell4", nil];
    [self.view addSubview:_tableView];
    
    _zhedie = [UIButton buttonWithType:UIButtonTypeSystem];
    _zhedie.frame = CGRectMake(270 + 95, 200, 20, 20);
    _zhedie.backgroundColor = [UIColor whiteColor];
    [_zhedie setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
    [_zhedie addTarget:self action:@selector(pressUp:)
      forControlEvents:UIControlEventTouchUpInside];
    _zhedie.tag = 1001;
    [self.view addSubview:_zhedie];
    
    if (_zhedie.tag == 1001) {
        _tableView.frame = CGRectMake(270, 200, 95, 20);
    }
    //=======折叠cell}
    
}

//====折叠cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedItem = _dataArray[indexPath.section];
    [_dataArray removeObjectAtIndex:indexPath.section];
    [_dataArray insertObject:selectedItem atIndex:0];
    
    [_tableView reloadData];
    [self pressUp:_zhedie];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *strID = @"ID";
    //尝试获取可以复用的单元格
    //如果得不到，返回为nil
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:strID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    //单元格文字赋值
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;

    return cell;
}

- (void)pressUp:(UIButton *)btn {
    if (btn.tag == 1002) {
        [btn setImage:[UIImage imageNamed:@"shou.png"] forState:UIControlStateNormal];
        _tableView.frame = CGRectMake(270, 200, 95, 20);
        btn.tag--;
    } else {
        [btn setImage:[UIImage imageNamed:@"fang.png"] forState:UIControlStateNormal];
        _tableView.frame = CGRectMake(270, 200, 95, 80);
        btn.tag++;
    }
}
@end
