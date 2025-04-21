# Project 5 



## Part 1 - Semantic Versioning

## Generating Tags

  - To see tags in a github repo on the homepage in the github repo click on 
  main and then click on tags.

 - ![seeingtags](githubhowtoaccesstags.jpg)

  - To generate a tag in a github repository, make sure the change is made to 
  the image file in this case index.html. Once that is changed run ```git add index.html ```.
  Then git commit -m "updating changes", but instead of running git push run ```git tag -a v.*.*.*```
  this will add the tag to make to the main branch. After that command run ```git push origin v.*.*.*```.
  This command will push the tag to the github repo.

  - ![taggedimagetopush](tagpushedtorepo.jpg)


## CI with GitHub Actions


  - In my workflow when a git tag is created and push the workflow begins to make a tag on the image container
  in my Dockerhub repository. It also has major and minor versions as specified in the workflow as well as a 
  latest tag as that comes built in. 

  - The steps of my workflow consits of:
  1. Logging into Dockerhub using github sercets did this first because the signing is important
  to make sure we can build and push to the dockerhub repo.

  2. Runs the checkout which clones the repository where the workflow is running.

  3. The docker meta step is next in my workflow which takes the tagged images created
  to my dockerhub repo. This step also sets up the semantic versioning with major, major.minor
  and the latest tags.

  4. The next step is the QEMU action step. QEMU stands for quick emulator, this step
  allows you to create can emulate different architectures, enabling you to build images for various platforms.
  Which is ideal because we need to be able to build the images.

  5. The next step is setting up the docker build which is important because this 
   is an extension of Docker that provides a powerful build environment.

  6. The final step is the docke build and push step which builds the image using the dockerfile created
  and pushes to the dockerhub repo identified in the docker meta step.

  
  - The changes from the previous workflow in Project 4 is that the docker meta step is added. As well in the 
  build and push step it's important to note that since my Dockerfile is in a sub-directory I had to add a context step
  that paths to my dockerfile. Also in this push build step we added in these instructions ``` tags: ${{ steps.meta.outputs.tags }}```
  and ``` labels: ${{ steps.meta.outputs.labels }}```. These instructions grab those tags and labels from the meta step to push to the
  the dockerhub repo.


  - Link to workflow: https://github.com/WSU-kduncan/ceg3120-cicd-chaizedelo25/blob/main/.github/workflows/project4.yml

  - To vaildate that the workflow did the tasking required is to go to the actions button in the github repo. This
  will show if the dockerhub action ran smoothly or not. It will also show the error in each instruction step on the workflow.
  
  - To vaildate the workflow worked on the dockerhub repo side log into the dockerhub repo and check the tag section, there will be 
  the pushed tags from the github workflow.

    
  - ![dockerhubtags](dockerhubtagsinrepo.jpg)

 
  - ![workflowimage](actualdockerfileupdatedworkingprojectfive.jpg)

## Ciations
  - https://semver.org/
  - https://www.restack.io/p/github-actions-docker-setup-answer-cat-ai
  - https://spacelift.io/blog/github-actions-checkout
  - https://github.com/docker/metadata-action?tab=readme-ov-file#semver
  - https://forums.docker.com/t/error-docker-buildx-build-requires-exactly-1-argument-with-vs-code/136577/9
  - https://docs.docker.com/build/ci/github-actions/manage-tags-labels/ 
