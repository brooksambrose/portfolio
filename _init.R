# options ----------------------------------------------------------------
knitr::opts_chunk$set(
  echo=F
  ,include=F
  ,fig.align='center'
  ,comment=NA
)
latex<-is_latex_output()

# asa.csl -----------------------------------------------------------------------
# download asa citation style sheet
if(!file.exists('asa.csl')) 'https://www.zotero.org/styles/american-sociological-association' %>% 
  readLines(warn = F) %>% writeLines('asa.csl')

# references.bib ----------------------------------------------------------

# download bibtex from zotero cloud
'https://www.zotero.org/api/users/2730456/collections/SAY3BJDZ/items/top?format=bibtex&key=9ekyrSk1IIye3OH3Yh2l7ftJ&v=1' %>%
  readLines(warn = F) %>% writeLines('references.bib')

# manually replace zotero default with better bibtex citekeys
bib<-readLines('references.bib')
sr<-grep('^@',bib)
br<-grep('(bibtex)|(Citation Key):',bib)
for(i in br) bib[sr[which(i>sr) %>% max]] %<>% sub('\\{[^,]+',paste0('{',sub('.+: ([^}]+).*','\\1',bib[i])),.)
writeLines(bib,'references.bib')
rm(bib)


