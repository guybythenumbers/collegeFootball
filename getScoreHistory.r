getScoreHistory <- function(team = NULL){
# install required package
require(rvest)

# error handling
if(is.null(team)){

	print("You must select a team from this list:")
	
	webpage <- read_html("http://www.winsipedia.com/team")

    print(webpage %>% html_nodes("h3") %>% html_text(trim = TRUE))

	return(NULL)
	}

if(!is.null(team)){
	team <- tolower(team)
    team <- gsub("[()]", "", team)
	team <- gsub(" ", "-", team)
}
# get webpage address
address <- paste0("http://www.winsipedia.com/games/",team)
# ping webpage
webpage <- read_html(address)

# compile table of results
results1 <- webpage %>% html_nodes(".col1") %>% html_text(trim = TRUE)
results2 <- webpage %>% html_nodes(".col2") %>% html_text(trim = TRUE)
results3 <- webpage %>% html_nodes(".col3") %>% html_text(trim = TRUE)
results4 <- webpage %>% html_nodes(".col4") %>% html_text(trim = TRUE)
results5 <- webpage %>% html_nodes(".col5") %>% html_text(trim = TRUE)
results6 <- webpage %>% html_nodes(".col6") %>% html_text(trim = TRUE)
results7 <- webpage %>% html_nodes(".col7") %>% html_text(trim = TRUE)
 
 # create data frame
 dat <- data.frame(results1, results2, results3, results4, results5, results6, results7)
 names(dat) <- c("Result", "Date", "Opponent", "PF", "PA", "Location", "Bowl Name")

 dat <- subset(dat, dat$Result != "Result");nrow(dat)
 return(dat) 
 }
 