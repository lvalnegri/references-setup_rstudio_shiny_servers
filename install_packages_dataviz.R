####################################
# # #  ===>  C  R  A  N  <===  # # # 
# # CLASSICS
pkg.lst <- c(
    'Amelia', 'broom', 'car', 'caret', 'classInt', 'corrplot', 'colourpicker', 'data.table', 'devtools', 'dplyr', 
    'forecast', 'foreach', 'funModeling', 'ggvis', 'glmnet', 'gmodels', 'googleVis', 'gridExtra',
    'Hmisc', 'httr', 'janitor', 'jsonlite', 'listviewer', 'lme4', 'lubridate', 'metafor', 'mgcv', 'mlr', 'multcomp', 
    'nlme', 'parallel', 'plyr', 'psych', 'quantmod', 
    'randomForest', 'RColorBrewer', 'Rcpp', 'readr', 'readxl', 'reshape2', 'rio', 'RMySQL', 'rvest', 
    'scales', 'simpletable', 'sjPlot', 'sjmisc', 'sparklyr', 'stringr', 'survival',
    'tidyr', 'validate', 'vcd', 'viridis', 'xml2', 'xts', 'xtable', 'zoo'
)
install.packages(pkg.lst, dependencies = TRUE)

# # required for reading SPATIAL OBJECTS, plotting MAPS and SPATIAL ANALYSIS
pkg.lst <- c(
    'cartography', 'cshapes', 'fields', 'gdistance', 'geojsonio', 'geosphere', 'ggmap', 'GISTools', 
    'mapmisc', 'maps', 'maptools', 'mapview', 
    'quickmapr', 'raster', 'rgdal', 'rgeos', 'RgoogleMaps', 'rworldmap', 'rworldxtra', 'sf', 'sp', 'tigris', 'tmap', 'tmaptools'
)
install.packages(pkg.lst, dependencies = TRUE)

# # required for plotting NETWORKS
pkg.lst <- c('igraph', 'network', 'networkDynamic', 'sna')
install.packages(pkg.lst, dependencies = TRUE)

# # GGPLOT EXTENSIONS: http://www.ggplot2-exts.org/gallery/, https://www.ggplot2-exts.org/ggiraph.html, https://github.com/ggplot2-exts/ggplot2-exts.github.io
pkg.lst <- c('ggplot2',
    'geomnet', 'GGally', 'ggalt', 'ggedit', 'ggExtra', 'ggfortify', 'ggforce', 'ggiraph', 'ggnetwork', 'ggpmisc', 'ggQC',
    'ggraph', 'ggrepel', 'ggtern', 'ggthemes', 'waffle'
)
install.packages(pkg.lst, dependencies = TRUE)
# geomnet:      , https://github.com/sctyner/geomnet
# ggally:       install_github("ggobi/ggally"), https://ggobi.github.io/ggally/docs.html
# ggalt:        install_github("hrbrmstr/ggalt")
# ggedit:       install_github("metrumresearchgroup/ggedit"), https://metrumresearchgroup.github.io/ggedit/
# ggExtra:      install_github("daattali/ggExtra")
# ggforce:      install_github('thomasp85/ggforce'), https://github.com/thomasp85/ggforce
# ggfortify:    install_github('sinhrks/ggfortify'), https://journal.r-project.org/archive/accepted/tang-horikoshi-li.pdf
# ggiraph:      install_github('davidgohel/ggiraph'), http://davidgohel.github.io/ggiraph/introduction.html
# ggnetwork:    install_github("briatte/ggnetwork"), https://briatte.github.io/ggnetwork/, http://curleylab.psych.columbia.edu/netviz/
# ggpmisc:      , https://bitbucket.org/aphalo/ggpmisc/src
# ggQC:         install_github("kenithgrey/ggQC"), http://ggqc.r-bar.net/index.html
# ggraph:       install_github('thomasp85/ggraph')
# ggrepel:      install_github("slowkow/ggrepel")
# ggtern:       install_git('https://bitbucket.org/nicholasehamilton/ggtern'), https://github.com/nicholasehamilton/ggtern, http://www.ggtern.com/
# ggthemes:     install_github('jrnold/ggthemes'), https://github.com/jrnold/ggthemes
# waffle:       , https://github.com/hrbrmstr/waffle

# # SHINY, RMARKDOWN, INTERACTIVE REPORTING
pkg.lst <- c(
    'bookdown', 'bsplus', 'commonmark', 'flexdashboard', 'htmlTable', 'prettydoc',
    'revealjs', 'rmarkdown', 'rmdformats', 'rmdshower', 'rsconnect', 
    'shiny', 'shinycssloaders', 'shinydashboard', 'shinyDND', 'shinyjqui', 'shinyjs', 'shinythemes', 'shinyWidgets'
    'tufte', 'tufterhandout'
)
install.packages(pkg.lst, dependencies = TRUE)
# install_github('rstudio/rmarkdown')                    # http://rmarkdown.rstudio.com/
# install_github('daattali/shinyjs')                     # https://github.com/daattali/shinyjs
#
#
#
#
#

# # HTMLWIDGETS: http://gallery.htmlwidgets.org/, http://www.htmlwidgets.org/showcase_leaflet.html
pkg.lst <- c(
    'htmlwidgets', 'DiagrammeR', 'DT', 'dygraphs', 'edgebundleR', 'formattable', 'googleway',
    'highcharter', 'leaflet', 'mapview', 'networkD3', 'qtlcharts', 'pairsD3', 'plotly', 
    'rAmCharts', 'rbokeh', 'rhandsontable', 'scatterD3', 'sunburstR', 'timevis', 'tmap', 'visNetwork'
)
install.packages(pkg.lst, dependencies = TRUE)
# DiagrammeR:       install_github('rich-iannone/DiagrammeR')           http://rich-iannone.github.io/DiagrammeR/
# DT:               install_github('rstudio/DT')                        http://rstudio.github.io/DT/
# dygraphs:         install_github('rstudio/dygraphs')                  http://rstudio.github.io/dygraphs/
# edgebundleR:      install_github('garthtarr/edgebundleR')             https://github.com/garthtarr/edgebundleR
# formattable:      install_github('renkun-ken/formattable')            http://renkun.me/formattable/
# googleway:        install_github('SymbolixAU/googleway')              https://github.com/SymbolixAU/googleway
# highcharter:      install_github('jbkunst/highcharter')               http://jkunst.com/highcharter/
# leaflet:          install_github('rstudio/leaflet')                   http://rstudio.github.io/leaflet/
# listviewer:       install_github('timelyportfolio/listviewer')        http://github.com/timelyportfolio/listviewer
# mapview:          install_github('environmentalinformatics-marburg/mapview', ref = 'develop')   # https://github.com/environmentalinformatics-marburg/mapview
# networkD3:                                                            http://christophergandrud.github.io/networkD3/
# pairsD3:          install_github('garthtarr/pairsD3')                 https://github.com/garthtarr/pairsD3
# plotly:           install_github('ropensci/plotly')                   https://plot.ly/r/
# qtlcharts:        install_github('kbroman/qtlcharts')                 http://kbroman.org/qtlcharts/
# rAmCharts:        install_github('datastorm-open/rAmCharts')          http://datastorm-open.github.io/introduction_ramcharts/
# rbokeh:           install_github('bokeh/rbokeh')                      http://hafen.github.io/rbokeh/
# rhandsontable:    install_github('jrowen/rhandsontable')              http://jrowen.github.io/rhandsontable/
# scatterD3:        install_github('juba/scatterD3')                    https://github.com/juba/scatterD3
# slickR:           install_github('metrumresearchgroup/slickR')        https://metrumresearchgroup.github.io/slickR
# sunburstR:        install_github('timelyportfolio/sunburstR')         https://github.com/timelyportfolio/sunburstR, http://www.buildingwidgets.com/blog/2015/7/2/week-26-sunburstr
# timevis:          install_github('daattali/timevis')                  https://github.com/daattali/timevis
# tmap:             install_github('mtennekes/tmap', subdir = 'pkg')    https://github.com/mtennekes/tmap
# visNetwork:       install_github('datastorm-open/visNetwork')         http://datastorm-open.github.io/visNetwork/
# crosstalk:        

# # OTHERS
pkg.lst <- c('ndtv')
install.packages(pkg.lst, dependencies = TRUE)
# ndtv:             


###################################
# # #  ===> G I T H U B <===  # # # 
library(devtools)

# # GENERICS


# # GGPLOT
install_github('hadley/ggplot2')                    # ggplot dev:   
install_github("dgrtwo/gganimate")                  # gganimate:    https://github.com/dgrtwo/gganimate
install_github("robjohnnoble/ggmuller")             # ggmuller:     https://thesefewlines.wordpress.com/2016/08/20/how-to-ggmuller/
install_github("guiastrennec/ggplus")               # ggplus:       https://github.com/guiastrennec/ggplus
install_github("lionel-/ggstance")                  # ggstance:     https://github.com/lionel-/ggstance
install_github('Ather-Energy/ggTimeSeries')         # ggTimeSeries: https://github.com/Ather-Energy/ggTimeSeries
install_github("sachsmc/plotROC")                   # plotROC:      https://github.com/sachsmc/plotROC

# # SHINY


# # HTMLWIDGETS
install_github('jcheng5/bubbles')                                           # bubbles:          https://github.com/jcheng5/bubbles
install_github('Kitware/candela', subdir='R/candela', dependencies = TRUE)  # candela:          https://candela.readthedocs.io/en/latest/index.html
install_github('neuhausi/canvasXpress')                                     # canvasXpress:     https://github.com/neuhausi/canvasXpress/
install_github('yutannihilation/chartist')                                  # chartist:         https://github.com/yutannihilation/chartist
install_github('armish/coffeewheel')                                        # coffeewheel:      https://github.com/armish/coffeewheel, https://www.jasondavies.com/coffee-wheel/
install_github('rstudio/d3heatmap')                                         # d3heatmap:        https://github.com/rstudio/d3heatmap
install_github(c('rstudio/crosstalk', 'ThomasSiegmund/D3TableFilter'))      # D3TableFilter:    https://github.com/ThomasSiegmund/D3TableFilter 
install_github("timelyportfolio/exportwidget")                              # exportwidget:     https://github.com/timelyportfolio/exportwidget
install_github('prpatil/healthvis')                                         # healthvis:        https://github.com/prpatil/healthvis
install_github('56north/hexamapmaker')                                      # hexamapmaker:     https://github.com/56north/hexamapmaker
install_github('hrbrmstr/metricsgraphics')                                  # metricsgraphics:  http://hrbrmstr.github.io/metricsgraphics/
install_github("dgrapov/networkly")                                         # networkly:        https://github.com/dgrapov/networkly, http://dgrapov.github.io/networkly/
install_github('timelyportfolio/parcoords')                                 # parcoords:        https://github.com/timelyportfolio/parcoords
install_github('smartinsightsfromdata/rpivotTable')                         # rpivotTable:      https://github.com/smartinsightsfromdata/rpivotTable
install_github('ramnathv/rChartsCalmap')                                    # rChartsCalmap:    http://cal-heatmap.com/
install_github('bwlewis/rthreejs')                                          # rthreejs:         https://github.com/bwlewis/rthreejs
install_github('htmlwidgets/sparkline')                                     # sparklines:       https://github.com/htmlwidgets/sparkline
install_github('hrbrmstr/streamgraph')                                      # streamgraph:      http://hrbrmstr.github.io/streamgraph/
install_github('hrbrmstr/taucharts')                                        # taucharts:        https://github.com/hrbrmstr/taucharts
install_github('lchiffon/wordcloud2')                                       # wordcloud2:       https://github.com/lchiffon/wordcloud2

