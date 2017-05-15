
#### R

 - add the CRAN repository to the system file: 
   - open the file: sudo nano /etc/apt/sources.list
   - add following entry (linux 16): deb http://cran.rstudio.com/bin/linux/ubuntu xenial/
   - add the public key of Michael Rutter to secure apt: 
		gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
		gpg -a --export E084DAB9 | sudo apt-key add -

 - update & upgrade apt-get: 
	sudo apt-get update
	sudo apt-get upgrade
   
 - install *R*: 
	sudo apt-get install r-base
	sudo apt-get install r-base-dev

 #### RStudio Server

 - install auxiliary Ubuntu libraries: 
	sudo apt-get install gdebi-core
	sudo apt-get install libapparmor1

 - download Rstudio Server visiting [this page](http://www.rstudio.com/products/rstudio/download/preview/ '') and copying the address for the link *RStudio Server x.yy.zzzz - Ubuntu 12.04+/Debian 8+ (64-bit)*: 
	wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-1.0.143-amd64.deb
   
 - install Rstudio Server: sudo gdebi rstudio-server-1.0.143-amd64.deb

 
 ### Shiny

 - Install first the shiny package from inside R
    sudo su
    R
    install.packages('shiny')
    q()
    exit

 - download Shiny Server visiting [this page](https://www.rstudio.com/products/shiny/download-server/ '') and copying the address of the current version: 
	wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.3.838-amd64.deb

 - install Shiny Server: sudo gdebi shiny-server-1.5.3.838-amd64.deb

 
### Additional Packages

#### Install dependencies

 - devtools: 
		sudo apt-get install curl libssl-dev libcurl4-gnutls-dev
 - RMySQL: 
		sudo apt-get install libmysqlclient-dev
 - rgdal/rgeos/spdplyr: 
		sudo add-apt-repository ppa:ubuntugis/ppa 
		sudo apt-get update 
		sudo apt-get install gdal-bin
		sudo apt-get install libgdal-dev libgeos-dev libproj-dev
 - sf (must be installed AFTER previous deps): 
		sudo apt-get install libudunits2-dev
 - geojsonio/tmap (must be installed AFTER previous deps): 
		sudo apt-get install libv8-3.14-dev
 - Cairo/gdtools: sudo apt-get install libcairo2-dev libxt-dev
 - RccpGSL: sudo apt-get install libgsl0-dev
 - GMP: sudo apt-get install libgmp3-dev 
 - rgl: sudo apt-get install r-cran-rgl libcgal-dev libglu1-mesa-dev libglu1-mesa-dev
 - rJava: 
		sudo apt-get install openjdk-8-*
		sudo apt-get install r-cran-rjava
		sudo R CMD javareconf
 
 
 
#### Install CRAN Packages

 - All packages should be installed as **su** to ensure a unique shared library between normal users and the shiny-srv user, and avoid duplication and possible mismatches in versions:
	sudo su
	R
	install.packages("pkg_name")
	q()
	exit

   The single installation line could be replaced by the following in case of multiple installations:
	dep.pkg <- c(...) # list of packages
	pkgs.not.installed <- dep.pkg[!sapply(dep.pkg, function(p) require(p, character.only = TRUE))]
	if( length(pkgs.not.installed) > 0 ) install.packages(pkgs.not.installed, dependencies = TRUE)

 - Even if not directly needed for installing packages from CRAN, it is important to install devtools as the first package because some packages need to install packages dependencies that need to be compiled from source. 

	pkgs <- c(
		'broom', 'Cairo', 'circlize', 'classInt', 'colourpicker', 'data.table', 'DT', 'dygraphs', 'e1071', 'flexdashboard', 'forcats', 'forecast', 'extrafont',
		'GGally', 'geojsonio', 'ggplot2', 'ggiraph', 'ggmap', 'ggparallel', 'ggrepel', 'ggspatial', 'ggthemes', 'glmnet',
		'highcharter', 'htmltools', 'jsonlite', 'leaflet', 'leaflet.extras', 'lme4', 'lubridate', 
		'mapview', 'maptools', 'mgcv', 'mlr', 'modelr', 'multcomp', 'nlme', 'odbc', 'openxlsx', 'party', 'plyr', 'pool', 'quantmod',
		'RColorBrewer', 'rgeos', 'rgdal', 'rmapshaper', 'rmarkdown', 'rbokeh', 'RMySQL', 'rpart', 'rpart.plot', 'rpivotTable', 'rvest', 
		'scales', 'sf', 'shinydashboard', 'shinyjs', 'shinythemes', 'shinyWidgets', 'showtext', 'sp', 'spdplyr', 'stringr', 
		'tidyverse', 'tmap', 'vcd', 'viridis', 'xml2', 'xts', 'zoo'
	)
	install.packages(pkgs, dependencies = TRUE)

 - Subsequently, it'd be better first list the package not already installed:
	pkgs.not.installed <- pkgs[!sapply(pkgs, function(p) require(p, character.only = TRUE))]
	if(length(pkgs.not.installed) > 0) install.packages(pkgs.not.installed, dependencies = TRUE)


sqldf, qcc, reshape2, randomForest, ggvis, rgl, diagrammeR, network3D, googleVis, googlesheets, car, glmnet, survival, caret, xtable,
maps, diffobj, feather, foreach, gmodels, highcharter, Hmisc, mice, nnet, e1071, kernLab, 


	
#### Install GitHub Packages

	
	library(devtools)
	
	install_github('bhaskarvk/leaflet.extras')
	install_github('rstudio/pool')
	

#### Install fonts (linux only)

 - install and load the extrafont package:
	install.packages('extrafont')
	library(extrafont)

 - install and load the fontcm package:
	install.packages('fontcm')
	library(fontcm)

 - install fonts from fontcm:
	font_install('fontcm')

See also *showtext* (https://github.com/yixuan/showtext)


### GIT

 - install git: sudo apt-get install git-core
 - check executable has been found in RStudio: Tools => Global Options => Git
 

### MYSQL

 - install mysql: 
		sudo apt-get install mysql-server
		sudo mysql_secure_installation 
		
 - create .my.cnf with credentials 
		sudo nano /etc/mysql/.my.cnf
		add following lines for each group
		[groupname]
		host = 
		user = 
		password = 
		
	if that does not work, try to save it in the home folder of the user, or add "default.file = location" in the R connection string
 - install web interface (dbninja?)
 
 - run script (text file with SQL statements!) to add tables to a database: 
		mysql -u username -p password dbname < fpath + fname
 


 ### GUI (if on a headless server)



### WORKING WITH SHINYcd /var/log/shiny-server
 
#### 
	Because of the way permissions work in Linux, and being the path /srv/shiny-server created by the user shiny, we can’t copy files directly there because they can’t be open by the shiny user
	A workaround is to create a group, say shiny-apps, and add shiny and all necessary users to it, giving the group the correct permissions:
		sudo groupadd shiny-apps
		sudo usermod -aG shiny-apps shiny
		sudo usermod -aG shiny-apps username
		cd /srv/shiny-server
		sudo chown -R username:shiny-apps .
		sudo chmod g+w .
		sudo chmod g+s .
 
 
#### MOVE SCRIPT FROM HOME FOLDER TO SHINY FOLDER

	
		sudo mkdir /srv/shiny-server/<APP-NAME>
		sudo cp -R /home/<USER>/<APP-PATH>/* /srv/shiny-server/<APP-NAME>/

		
		
#### DEBUGGING


#### READ ERROR LOGS

	Shiny Server error logs can be found at these locations:
		- for the server: /var/log/shiny-server.log
		- for the apps:   /var/log/shiny-server/*.log
		
