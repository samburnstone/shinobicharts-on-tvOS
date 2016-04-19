//
//  DetailChartViewController.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 18/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

class DetailChartViewController: UIViewController
{
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var detailChart: TVChart!
    
    var chartDatasource: SChartDatasource?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        titleLabel.text = title
        
        detailChart.datasource = chartDatasource
    }
}
