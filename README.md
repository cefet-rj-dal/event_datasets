# event_datasets

## Description and Content
Repository for organizing datasets used for developing and testing methods for time series events detection. Each dataset will be organized in a separate directory with documentation about its origin, data files (when available) and R Script for its load. The repository will preferably consist of datasets with labels to assist in evaluating the performance of the methods applied in the experiments.

To use the series from the files, the repository must be cloned and the usage examples reproduced from the `original_datasets` directory. Although it is possible to use it through files, it is recommended to follow the guidance in the next section for use through the R package.


| Dataset | Labels  | Number of series | Content | Files and Code / Documentation | Origin URL |
| ------- | ------- | ---------------- | ------- | ------------------- | ------ |
| Gecco Challenge | Yes | 9 | Data collection for water quality monitoring |Available / Available | [Gecco Challenge 2018](https://www.spotseven.de/gecco/gecco-challenge) |
| Yahoo Labs | Yes | 367 | Data collection of network traffic, internet and synthetic data | Available / Available | [Yahoo Research](https://yahooresearch.tumblr.com/post/114590420346) |
| Numenta | Yes | 58 | Cloud services and synthetic data | Pending / Pending | [Numenta](https://www.numenta.com) |
| RARE | Yes | 7062 | Memory consumption in cloud services | Pending / Pending | |
| UCR Archive | Yes | 250 | Synthetic data | Pending / Pending | [UCR Archive](https://paperswithcode.com/dataset/ucr-anomaly-archive) |
| UCI 3W | Yes | 649 | Oil well drilling | Available / Pending | [UCI](https://archive.ics.uci.edu/ml/datasets/3W+dataset) |
| Mortality CNES | Yes | 1 | Child mortality dataset. Data for assessing infant mortality, an important health indicator. | Available / Pending | |
| Finance Indexes | Yes | 10 | Finance: Securities Price Indexes (Brazil) | Available / Pending | [b3](https://www.b3.com.br/pt_br/market-data-e-indices/) and [BR Investing](https://br.investing.com/indices/) |
| EIA Oil Prices | No | 7 | Finance: Prices of crude oil and petroleum products | Available / Pending | [EIA](https://www.eia.gov/petroleum/data.php) |


## Usage Example

Another way to use series from this data repository is through the R package `dalevents`. The following usage example describes installing the package and loading a series. This is the easiest and most recommended way to use the series contained in this repository.

```
#Install package
install.packages("devtools")
library(devtools)
devtools::install_github("cefet-rj-dal/event_datasets", force=TRUE)
library(dalevents)

#Load a series
data(yahoo_a1)
series <- yahoo_a1$real_1

#Use the loaded series
summary(series)
plot(series$series, type = "l")

#Get information about a series
?yahoo_a1
```

### Series available in the package


List of series already available for loading through the package. For each series the `data(serie_name)` function must be used, according to the usage example above. This will create a linked list with the same name as the dataset. When browsing through the list the last level will represent each series ready for use with the desired function.


| Dataset Identifier | Loading |
| ---------------- | ---------------- |
| gecco | `data(gecco)` |
| yahoo_a1 | `data(yahoo_a1)` |
| yahoo_a2 | `data(yahoo_a2)` |
| yahoo_a3 | `data(yahoo_a3)` |
| yahoo_a4 | `data(yahoo_a4)` |
| oil_3w_Type_0 | `data(oil_3w_Type_0)` |
| oil_3w_Type_1 | `data(oil_3w_Type_1)` |
| oil_3w_Type_2 | `data(oil_3w_Type_2)` |
| oil_3w_Type_5 | `data(oil_3w_Type_5)` |
| oil_3w_Type_6 | `data(oil_3w_Type_6)` |
| oil_3w_Type_7 | `data(oil_3w_Type_7)` |
| oil_3w_Type_8 | `data(oil_3w_Type_8)` |
| mortality_cnes | `data(mortality_cnes)` |
| fi_br | `data(fi_br)` |
| eia_oil_prices | `data(eia_oil_prices)` |
