# packages
library(tilit)
library(plagiat)
library(ggplot2)
library(knitr)
library(magrittr)
library(data.table)

#
latex<-is_latex_output()
docx<-'docx'%in%knitr::opts_knit$get("rmarkdown.pandoc.to")

# png optimization
knit_hooks$set(optipng = hook_optipng)
knit_hooks$set(pngquant = hook_pngquant)

#synctex integration
opts_knit$set(concordance=TRUE)

#color pallete
cb<-RColorBrewer::brewer.pal(8,'Dark2')

# ggplot
blanky<-theme(axis.text.y = element_blank(),axis.ticks.y = element_blank(),panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())
blankx<-theme(axis.text.x = element_blank(),axis.ticks.x = element_blank(),panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())
tl<-theme(legend.position = c(x=.05,y=.95),legend.justification = c("left", "top"),legend.box.just = "left",legend.background =  element_rect(color=NA,fill=NA))
ml<-theme(legend.position = c(x=.05,y=.5),legend.justification = c("left", "center"),legend.box.just = "left",legend.background =  element_rect(color=NA,fill=NA))
ll<-theme(legend.position = c(x=.05,y=.05),legend.justification = c("left", "bottom"),legend.box.just = "left",legend.background =  element_rect(color=NA,fill=NA))
mr<-theme(legend.position = c(x=.95,y=.5),legend.justification = c("right", "center"),legend.box.just = "left",legend.background =  element_rect(color=NA,fill=NA))
lr<-theme(legend.position = c(x=.95,y=.05),legend.justification = c("right", "bottom"),legend.box.just = "left",legend.background =  element_rect(color=NA,fill=NA))

# asa.csl -----------------------------------------------------------------------
# download asa citation style sheet
if(!file.exists('asa.csl')) 'https://www.zotero.org/styles/american-sociological-association' %>%
  readLines(warn = F) %>% writeLines('asa.csl')

# references.bib ----------------------------------------------------------
if(T){
# download bibtex from zotero cloud
ini<-'https://api.zotero.org/users/2730456/collections/SAY3BJDZ/items?format=bibtex&key=9ekyrSk1IIye3OH3Yh2l7ftJ&limit=100'
gt<-list()
gt[[1]]<-try(httr::GET(ini),silent = T)
while(inherits(gt[[1]],'try-error')) gt[[1]]<-try(httr::GET(ini),silent = T)
nxtf<-function(x) {{httr::headers(gt[[length(gt)]])$link} %>% strsplit(split=',') %>%  unlist %>% grep('next',.,value = T) %>% sub('.*<([^>]+).+','\\1',.) %>% paste0('&key=9ekyrSk1IIye3OH3Yh2l7ftJ') %>% {r<-sub('(.+collections/)([^/]+)(.+)','\\2',.);sub('(.+collections/)([^/]+)(.+)',paste0('\\1',toupper(r),'\\3'),.)}}
nxt<-nxtf(gt[[1]])
con<-list()
con[[1]]<-httr::content(gt[[1]],type='text',encoding = 'UTF-8')
n<-0
while(({httr::headers(gt[[length(gt)]])$link %>% httr::parse_media(.)} %>% unlist %>% grepl('^next',.) %>% any)&n<10) {
  gt[[length(gt)+1]]<-try(httr::GET(nxt),silent = T)
  while(inherits(gt[[length(gt)]],'try-error')) gt[[length(gt)]]<-try(httr::GET(nxt),silent = T)
  con[[length(con)+1]]<-httr::content(gt[[length(gt)]],type='text',encoding = 'UTF-8')
  nxt<-nxtf(gt[[length(gt)]])
  n<-n+1
}

writeLines(do.call(c,con),'references.bib')

# manually replace zotero default with better bibtex citekeys
bib<-readLines('references.bib')
sr<-grep('^@',bib)
br<-grep('(bibtex)|(Citation Key):',bib)
for(i in br) bib[sr[which(i>sr) %>% max]] %<>% sub('\\{[^,]+',paste0('{',sub('.+: ([^}]+).*','\\1',bib[i])),.)
writeLines(bib,'references.bib')
rm(bib,sr,br,i,ini,gt,con,nxt,nxtf,n)

# check for complete author year
if(F){
  tb<-RefManageR::ReadBib('references.bib')
  wa<-sapply(tb%>% RefManageR::fields(),function(x) which(!any(ec('editor,author')%in%x))) %>% unlist
  wy<-sapply(tb%>% RefManageR::fields(),function(x) which(!any(ec('year')%in%x))) %>% unlist
  if(any(length(wa)|length(wy))) stop('missing author or year field')
}
}
