GloVe <-c( 0.0375,0.0373, 0.0378)

HARD<-c( 0.0008, 0.0008 , 0.0009 )

GN <- c( 0.0555, 0.0618, 0.0368  )

GP <- c(0.0366, 0.0381, 0.0343 )

GPGN <- c( 0.0456, 0.0431, 0.0482)

HSR <- c( 0.0217 , 0.0231 ,0.0198  )

DHD <- c( 0.0196 , 0.0211 ,0.0175 )

RAN <- c(0.0291 , 0.0289 ,  0.0294)

RANHSR <- c( 0.0277 ,0.0281 , 0.0271  )
data <- as.data.frame(t(cbind(GloVe, HARD, GN, GP, GPGN, HSR, DHD, RAN, RANHSR)))
names(data) <- c('avg', 'male', 'female')
data$methods <- rownames(data)
data
library(ggplot2)
male <- data$male
female <- data$female
bias <- c(male, female)
methods <- rep(rownames(data),2)
gender <- c(rep('male', 9), rep('female', 9))
data <- as.data.frame(cbind(bias, methods, gender))
data$bias <- as.numeric(data$bias)
data

method_names <- list(
  'GN'='GN',  'GP'='GP', 'DHD'='DHD','HSR'='HSR','RANHSR'='HSR-RAN',
  'GloVe'='GloVe','GPGN'='GP-GN','RAN'='RAN','HARD'='HARD'
  
)

methods_labeller <- function(variable,value){
  return(method_names[value])
}

ggplot(data, aes(gender, bias, fill=gender))+geom_bar(stat='identity', position='dodge')+
  facet_wrap(~factor(methods, levels=c('GN','GP','DHD','HSR', 'RANHSR', 'GloVe', 'GPGN', 'RAN', 'HARD')))+ geom_text(aes(label = bias),
                                       position=position_dodge(width=0), size = 6)+
  theme(axis.title=element_text(size=20), axis.text = element_text(size=15), legend.title = element_text(size=15), legend.text = element_text(size=15),
        panel.background = element_rect(colour = 'white', fill='white'), axis.line = element_line(colour='black'))+
  scale_x_discrete(labels=NULL) + scale_y_continuous(labels=NULL)

