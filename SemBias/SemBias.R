#SemBias Results
GloVe <- c(80.2,  10.9, 8.9) 
glove <- c(57.5, 20, 22.5)
HARD_GloVe <- c(84.1, 6.4, 9.5) 
hard <- c(25, 27.5, 47.5) 
GN_GloVe <- c(97.7, 1.4, 0.9) 
gn <- c(75, 15, 10)  
GP_GloVe <- c(84.3, 7.9, 7.7)
gp <-c(65, 15, 20)
GP_GNGloVe <- c(98.4,1.1,0.5)
gpgn <-c(82.5, 12.5,5.0)  
HSR_GloVe <- c(85.91, 3.86, 10.23)
hsr <-c(10.0, 30.0, 60.0) 
DHD_GloVe <- c(25.0, 12.3, 62.7)
dhd <-c(0.0, 15.0, 85.0)
RAN_GloVe <- c(92.7, 1.14, 6.14)
ran <-c(97.5,0.0,2.5)
HRAN <- c(92.3, 0.9, 6.8)
hran <- c(92.5, 0.0, 7.5)
sembias <- c('SemBias', 'SemBias', 'SemBias', 'SemBias', 'SemBias', 'SemBias', 'SemBias', 'SemBias', 'SemBias',
             'subset', 'subset', 'subset','subset', 'subset', 'subset','subset', 'subset', 'subset')

data <- as.data.frame(rbind(GloVe, HARD_GloVe, GN_GloVe, GP_GloVe, GP_GNGloVe, HSR_GloVe, DHD_GloVe, RAN_GloVe, HRAN,
                            glove, hard, gn, gp, gpgn, hsr, dhd, ran, hran ))
names(data) <- c('Definition', 'Stereotype', 'None')
data$sembias <- sembias

data$method <- c('GloVe', 'HARD', 'GN', 'GP', 'GPGN', 'HSR', 'DHD', 'RAN', 'RANHSR','GloVe', 'HARD', 'GN', 'GP', 'GPGN', 'HSR', 'DHD', 'RAN', 'RANHSR')
library(ggplot2)
library(dplyr)
data = data %>% 
  group_by(sembias) %>% 
  mutate(positionDef = rank(-Definition))
data = data %>% 
  group_by(sembias) %>% 
  mutate(positionSte = rank(-Stereotype))
data = data %>% 
  group_by(sembias) %>% 
  mutate(positionNone = rank(-None))


ggplot(data, aes(sembias, Definition, fill=method, group=positionDef))+geom_bar(position = "dodge", 
                                                                                stat="identity", colour='black')+
  geom_text(aes(label = Definition),
            position=position_dodge(width=0.9), size = 6,vjust=-0.5)+xlab('SemBias')+ylab('Percentage of accuracy')+
  theme(axis.title=element_text(size=20), axis.text = element_text(size=15), legend.title = element_text(size=15), legend.text = element_text(size=15),
        panel.background = element_rect(colour = 'white', fill='white'), axis.line = element_line(colour='black'))+
  scale_fill_discrete(labels=c('DHD', 'GloVe', 'GN','GP','GP-GN','HARD','HSR','RAN','HSR-RAN'))


ggplot(data, aes(sembias, Stereotype, fill=method, group=positionSte))+geom_bar(position = position_dodge2(padding=0), 
                                                                                stat="identity", colour='black')+
  geom_text(aes(label = Stereotype),
            position=position_dodge2(width=0.9), size = 6,vjust=-0.5)+ylab('Percentage of accuracy')+
  theme(axis.title=element_text(size=20), axis.text = element_text(size=15), legend.title = element_text(size=15), legend.text = element_text(size=15),
        panel.background = element_rect(colour = 'white', fill='white'), axis.line = element_line(colour='black'))+
  scale_fill_discrete(labels=c('DHD', 'GloVe', 'GN','GP','GP-GN','HARD','HSR','RAN','HSR-RAN'))


ggplot(data, aes(sembias, None, fill=method, group=positionNone))+geom_bar(position = "dodge", 
                                                                           stat="identity", colour='black')+
  geom_text(aes(label = None),
            position=position_dodge(width=0.9), size = 6,vjust=-0.5)+
  ylab('Percentage of accuracy')+
  theme(axis.title=element_text(size=20), axis.text = element_text(size=15), legend.title = element_text(size=15), legend.text = element_text(size=15),
        panel.background = element_rect(colour = 'white', fill='white'), axis.line = element_line(colour='black'))+ 
  scale_fill_discrete(labels=c('DHD', 'GloVe', 'GN','GP','GP-GN','HARD','HSR','RAN','HSR-RAN'))

