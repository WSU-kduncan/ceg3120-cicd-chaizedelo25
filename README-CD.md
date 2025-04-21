# Project 5 



## Part 1 - Semantic Versioning

## Generating Tags

  - To see tags in a github repo on the homepage in the github repo click on 
  main and then click on tags. 

  - To generate a tag in a github repository, make sure the change is made to 
  the image file in this case index.html. Once that is changed run ```git add index.html ```.
  Then git commit -m "updating changes", but instead of running git push run ```git tag -a v.*.*.*```
  this will add the tag to make to the main branch. After that command run ```git push origin v.*.*.*```.
  This command will push the tag to the github repo. 
