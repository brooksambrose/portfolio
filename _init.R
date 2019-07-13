latex<-is_latex_output()
docx<-'docx'%in%knitr::opts_knit$get("rmarkdown.pandoc.to")

# png optimization
knit_hooks$set(optipng = hook_optipng)
knit_hooks$set(pngquant = hook_pngquant)

#synctex integration
opts_knit$set(concordance=TRUE)

#color pallete
cb<-RColorBrewer::brewer.pal(8,'Dark2')

# asa.csl -----------------------------------------------------------------------
# download asa citation style sheet
if(!file.exists('asa.csl')) 'https://www.zotero.org/styles/american-sociological-association' %>%
  readLines(warn = F) %>% writeLines('asa.csl')

# references.bib ----------------------------------------------------------

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



