
# Training_course

### Introduction to Git for GitLab projects [click link](https://www.youtube.com/watch?v=4lxvVj7wlZw)
#### Git workflow
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow
#### Git branch
```
# Create new branch
git checkout -b fix/branch1
# Switch branch
git checkout fix/branch1
# Merging branch to main branch
git checkout main
git merge fix/branch1
# delete branch after merging
git branch -d fix/branch1
# Store private folder (not a part of repository)
mkdir private
touch private/user.txt
git status
vim .gitignore (private/ -> save it)
git status
git add .
git commit -m "Update"
git push origin main
```
#### Rebasing commit 
```
git checkout -b new-branch
nano test.txt
git add .
git commit -m "Update"
git checkout main
nano read.md
git add .
git commit -m "Update"
git checkout new-branch
git rebase main
git checkout main
git merge new-branch
git branch -d new-branch
git push origin main
```

#### Merge conflicts
```
git checkout -b new-branch
nano test1.txt (This is test conflict from new-branch)
git add .
git commit -m "Update"
git checkout main
nano test1.txt (This is test conflict from main)
git add .
git commit -m "Update"
# Conflict here
# Go to the VS code to choose the text which you want to keep
git status
git add.
git commit -m "Update resolve problem"
git push orighin main
```

### GitLab CI: Pipelines, CI/CD and DevOps for Beginners [click link](https://bosch-bgsv.udemy.com/course/gitlab-ci-pipelines-ci-cd-and-devops-for-beginners/)
https://www.youtube.com/watch?v=PGyhBwLyK2U
https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

```
HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ node --version
v18.18.2

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ npm --version
9.8.1

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ npm install -g gatsby-cli

added 334 packages in 47s

51 packages are looking for funding
  run `npm fund` for details
npm notice
npm notice New major version of npm available! 9.8.1 -> 10.2.1
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v10.2.1>
npm notice Run `npm install -g npm@10.2.1` to update!
npm notice

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ gatsby new static-website
╔════════════════════════════════════════════════════════════════════════╗
║                                                                        ║
║   Gatsby collects anonymous usage analytics                            ║
║   to help improve Gatsby for all users.                                ║
║                                                                        ║
║   If you'd like to opt-out, you can use `gatsby telemetry --disable`   ║
║   To learn more, checkout https://gatsby.dev/telemetry                 ║
║                                                                        ║
╚════════════════════════════════════════════════════════════════════════╝
info Creating new site from git:
https://github.com/gatsbyjs/gatsby-starter-default.git

Cloning into 'static-website'...
remote: Enumerating objects: 31, done.
remote: Counting objects: 100% (31/31), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 31 (delta 2), reused 11 (delta 1), pack-reused 0
Receiving objects: 100% (31/31), 321.38 KiB | 1.49 MiB/s, done.
success Created starter directory layout
info Installing packages...
info Preferred package manager set to "npm"



added 1325 packages in 1m

226 packages are looking for funding
info Initialising git in static-website

info Create initial git commit in static-website
info
Your new Gatsby site has been successfully bootstrapped. Start developing it by
running:

  cd static-website
  gatsby develop



HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ ls
static-website/

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project
$ cd static-website/

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ ls
LICENSE    gatsby-browser.js  gatsby-node.js  node_modules/      package.json
README.md  gatsby-config.js   gatsby-ssr.js   package-lock.json  src/

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ gatsby develop
success compile gatsby files - 2.833s
success load gatsby config - 0.094s
success load plugins - 3.745s
success onPreInit - 0.018s
success initialize cache - 0.084s
success copy gatsby files - 0.408s
success Compiling Gatsby Functions - 6.279s
success onPreBootstrap - 6.376s
success createSchemaCustomization - 0.027s
success Checking for changed pages - 0.001s
success source and transform nodes - 0.141s
success building schema - 0.470s
success createPages - 0.035s
success createPagesStatefully - 0.327s
info Total nodes: 43, SitePage nodes: 8 (use --verbose for breakdown)
success Checking for changed pages - 0.001s
success write out redirect data - 0.008s
success Build manifest and related icons - 0.499s
success onPostBootstrap - 0.510s
info bootstrap finished - 43.463s
success onPreExtractQueries - 0.003s
success extract queries from components - 5.098s
success write out requires - 0.043s
success Running gatsby-plugin-sharp.IMAGE_PROCESSING jobs - 0.308s - 3/3 9.76/s
⠀
You can now view gatsby-starter-default in the browser.
⠀
  http://localhost:8000/
⠀
View GraphiQL, an in-browser IDE, to explore your site's data and schema
⠀
  http://localhost:8000/___graphql
⠀
Note that the development build is not optimized.
To create a production build, use gatsby build
⠀
success Building development bundle - 41.169s
success Writing page-data.json and slice-data.json files to public directory -
0.280s - 3/8 28.57/s
success onPreExtractQueries - 0.003s
success extract queries from components - 0.101s
success write out requires - 0.002s
success Running gatsby-plugin-sharp.IMAGE_PROCESSING jobs - 442.587s - 1/1
0.00/s
success Re-building development bundle - 0.226s

<i> [webpack-dev-middleware] wait until bundle finished: /commons.be581f497eead3success Writing page-data.json and slice-data.json files to public directory -
0.049s - 0/5 101.08/s
success onPreExtractQueries - 0.005s
success extract queries from components - 0.041s
success write out requires - 0.002s
success Re-building development bundle - 0.167s
success Writing page-data.json and slice-data.json files to public directory -
0.031s - 0/5 161.29/s
success onPreExtractQueries - 0.002s
success extract queries from components - 0.073s
success write out requires - 0.001s
success Re-building development bundle - 0.383s
success Writing page-data.json and slice-data.json files to public directory -
0.087s - 0/5 57.75/s
success onPreExtractQueries - 0.002s
success extract queries from components - 0.086s
success write out requires - 0.001s
success Re-building development bundle - 0.286s
success Writing page-data.json and slice-data.json files to public directory -
0.041s - 0/5 122.72/s

```

```
HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ git log
commit 38f3ae000197133dcce46017cfb008cbfca8c214 (HEAD -> master)
Author: github_username <you@domain.com>
Date:   Sat Oct 21 00:59:44 2023 +0700

    Initial commit from gatsby: (https://github.com/gatsbyjs/gatsby-starter-default.git)

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ git remote add origin https://gitlab.com/first5371341/my-static-website.git

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ git push -u origin master
Enumerating objects: 31, done.
Counting objects: 100% (31/31), done.
Delta compression using up to 8 threads
Compressing objects: 100% (28/28), done.
Writing objects: 100% (31/31), 318.07 KiB | 9.35 MiB/s, done.
Total 31 (delta 2), reused 0 (delta 0), pack-reused 0
remote:
remote: To create a merge request for master, visit:
remote:   https://gitlab.com/first5371341/my-static-website/-/merge_requests/new?merge_request%5Bsource_branch%5D=master
remote:
To https://gitlab.com/first5371341/my-static-website.git
 * [new branch]      master -> master
branch 'master' set up to track 'origin/master'.

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ gatsby build
success compile gatsby files - 1.393s
success load gatsby config - 0.042s
success load plugins - 0.506s
success onPreInit - 0.007s
success initialize cache - 0.077s
success copy gatsby files - 0.447s
success Compiling Gatsby Functions - 0.861s
success onPreBootstrap - 0.890s
success createSchemaCustomization - 0.007s
success Clean up stale nodes - 0.012s - 9/0 0.00/s
success Checking for changed pages - 0.001s
success source and transform nodes - 0.155s
info Writing GraphQL type definitions to
D:/DevOpt/Project/static-website/.cache/schema.gql
success building schema - 0.312s
success createPages - 0.024s
success createPagesStatefully - 0.153s
info Total nodes: 42, SitePage nodes: 8 (use --verbose for breakdown)
success Checking for changed pages - 0.001s
success Cleaning up stale page-data - 0.003s
success onPreExtractQueries - 0.003s
success extract queries from components - 2.849s
success write out redirect data - 0.005s
success Build manifest and related icons - 0.414s
success onPostBootstrap - 0.421s
info bootstrap finished - 17.175s
success write out requires - 0.022s
success Building production JavaScript and CSS bundles - 26.309s
success Building Rendering Engines - 38.265s
success Building HTML renderer - 7.834s
success Execute page configs - 0.054s
success Validating Rendering Engines - 3.566s
success Caching Webpack compilations - 0.001s
success run queries in workers - 0.138s - 5/5 36.28/s
success Running gatsby-plugin-sharp.IMAGE_PROCESSING jobs - 77.270s - 4/4 0.05/s
success Merge worker state - 0.006s
success Rewriting compilation hashes - 0.002s
success Writing page-data.json and slice-data.json files to public directory -
0.041s - 5/8 196.63/s
success Building static HTML for pages - 19.841s - 5/5 0.25/s
info There are no new or changed slice html files to build.
success stitching slices - 0.162s
success Delete previous page data - 0.002s
success onPostBuild - 0.000s


Pages

info Done building in 114.7463729 sec


Pages

┌ src/templates/using-dsg.js
│ └ D /using-dsg/
├ src/pages/404.js
│ ├   /404/
│ └   /404.html
├ src/pages/index.js
│ └   /
├ src/pages/page-2.js
│ └   /page-2/
├ src/pages/using-ssr.js
│ └ ∞ /using-ssr/
└ src/pages/using-typescript.tsx
  └   /using-typescript/

  ╭────────────────────────────────────────────────────────────────╮
  │                                                                │
  │   (SSG) Generated at build time                                │
  │ D (DSG) Deferred static generation - page generated at runtime │
  │ ∞ (SSR) Server-side renders at runtime (uses getServerData)    │
  │ λ (Function) Gatsby function                                   │
  │                                                                │
  ╰────────────────────────────────────────────────────────────────╯


HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ public
bash: public: command not found

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website (master)
$ cd public

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ ls
 404/
 404.html
 731-50a6dabafe7d779dd9de.js
 731-50a6dabafe7d779dd9de.js.LICENSE.txt
 731-50a6dabafe7d779dd9de.js.map
 843-4d22e4d87d98fa226c97.js
 843-4d22e4d87d98fa226c97.js.map
 _gatsby/
 app-a8f0118f129c0f4924bc.js
 app-a8f0118f129c0f4924bc.js.LICENSE.txt
 app-a8f0118f129c0f4924bc.js.map
 chunk-map.json
 component---src-pages-404-js-64b7b42e3d2efce6fb9f.js
 component---src-pages-404-js-64b7b42e3d2efce6fb9f.js.map
 component---src-pages-index-js-5ba63450eb3903da180b.js
 component---src-pages-index-js-5ba63450eb3903da180b.js.map
 component---src-pages-page-2-js-f9c0996d9fe1fe70f608.js
 component---src-pages-page-2-js-f9c0996d9fe1fe70f608.js.map
 component---src-pages-using-ssr-js-2fd9537e76fde49860ef.js
 component---src-pages-using-ssr-js-2fd9537e76fde49860ef.js.map
 component---src-pages-using-typescript-tsx-a3cd45a2e02c6d5e4798.js
 component---src-pages-using-typescript-tsx-a3cd45a2e02c6d5e4798.js.map
 component---src-templates-using-dsg-js-0d54b77c9f5deb8c7989.js
 component---src-templates-using-dsg-js-0d54b77c9f5deb8c7989.js.map
 favicon-32x32.png
 framework-6a525285796fb83f2864.js
 framework-6a525285796fb83f2864.js.LICENSE.txt
 framework-6a525285796fb83f2864.js.map
 icons/
 index.html
 manifest.webmanifest
 page-2/
 page-data/
 static/
 styles.8dc662cd4ca180166645.css
 using-typescript/
 webpack-runtime-d297a7b8224a8635fc92.js
 webpack-runtime-d297a7b8224a8635fc92.js.map
 webpack.stats.json
'~partytown'/

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ grep -q "sby" index.html

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ echo $?
0

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ grep "sdvdfsvsdfV" index.html

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ grep -q "sdvdfsvsdfV" index.html

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ echo  $?
1

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ npm install --global surge
npm WARN deprecated har-validator@5.1.5: this library is no longer supported
npm WARN deprecated uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
npm WARN deprecated request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142

added 112 packages in 23s

4 packages are looking for funding
  run `npm fund` for details

HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ surge

   Welcome to surge! (surge.sh)
   Login (or create surge account) by entering email & password.

          email: samelnguyen08@gmail.com
       password: Hieu26082001

   Running as samelnguyen08@gmail.com (Student)

        project: D:\DevOpt\Project\static-website\public\
         domain: needless-experience.surge.sh


     encryption: *.surge.sh, surge.sh (211 days)
             IP: 138.197.235.123

   Success! - Published to needless-experience.surge.sh



   Disconnected- Expected to complete.



HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$ surge token

   94db9354947cdf450131929d2d5efa00


HP@DESKTOP-AUG9CDF MINGW64 /d/DevOpt/Project/static-website/public (master)
$

```
```
stages:
  - build
  - test
  - deploy
  - deployment tests
build website:
  stage: build
  image: node
  script:
    - echo $CI_COMMIT_SHORT_SHA
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
    - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html

  artifacts:
    paths:
      - ./public
  
test artifact:
    image: alpine
    stage: test
    script:
      - grep "Gatsby" ./public/index.html
 

test website:
  image: node
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"


deploy to surge:
  image: node
  stage: deploy
  script:
    - npm install --global surge
    - surge --project ./public domain instazone.surge.sh


test deployment:
  image: alpine
  stage: deployment tests
  script:
    - apk add --no-cache curl
    - curl -s "https://instazone.surge.sh" | grep -q "Hi people"
    - curl -s "https://instazone.surge.sh" | grep -q "$CI_COMMIT_SHORT_SHA"
```
#### Using caches to optimize the build speed
##### Common steps needed to run a job
- Delegate job to Gitlab Runnuer
- Download & start Docker image
- Clone the repository
- Install any required dependencies
- Run the actual step
- Save the result (if needed)
##### Differences between caches and artifacts
-   Caches should only be used as a temporary storage for project dependencies

##### Defining variables
```
image: node:10

stages:
  - build
  - test
  - deploy staging
  - deploy production
  - production tests

cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/

variables:
  STAGING_DOMAIN: instazone-staging.surge.sh
  PRODUCTION_DOMAIN: instazone.surge.sh

build website:
  stage: build
  script:
    - echo $CI_COMMIT_SHORT_SHA
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
    - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
  artifacts:
    paths:
      - ./public

test artifact:
  image: alpine
  stage: test
  script:
    - grep -q "Gatsby" ./public/index.html

test website:
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

deploy staging: 
  stage: deploy staging
  environment:
    name: staging
    url: http://$STAGING_DOMAIN
  script:
    - npm install --global surge
    - surge --project ./public --domain $STAGING_DOMAIN

deploy production: 
  stage: deploy production
  environment:
    name: production
    url: $PRODUCTION_DOMAIN
  script:
    - npm install --global surge
    - surge --project ./public --domain $PRODUCTION_DOMAIN

production tests:
  image: alpine
  stage: production tests
  script:
    - apk add --no-cache curl
    - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "Hi people"
    - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "$CI_COMMIT_SHORT_SHA"
```
##### Manual deployments / Manually triggering
![image](https://github.com/hieunguyen0202/Training_course/assets/98166568/b3ddf14f-0503-4bd2-ada9-6e6ad2d7243d)
```
image: node:10

stages:
  - build
  - test
  - deploy staging
  - deploy production
  - production tests

cache:
  key: ${CI_COMMIT_REF_SLUG}
  paths:
    - node_modules/

variables:
  STAGING_DOMAIN: instazone-staging.surge.sh
  PRODUCTION_DOMAIN: instazone.surge.sh

build website:
  stage: build
  script:
    - echo $CI_COMMIT_SHORT_SHA
    - npm install
    - npm install -g gatsby-cli
    - gatsby build
    - sed -i "s/%%VERSION%%/$CI_COMMIT_SHORT_SHA/" ./public/index.html
  artifacts:
    paths:
      - ./public

test artifact:
  image: alpine
  stage: test
  script:
    - grep -q "Gatsby" ./public/index.html

test website:
  stage: test
  script:
    - npm install
    - npm install -g gatsby-cli
    - gatsby serve &
    - sleep 3
    - curl "http://localhost:9000" | tac | tac | grep -q "Gatsby"

deploy staging: 
  stage: deploy staging
  environment:
    name: staging
    url: http://$STAGING_DOMAIN
  script:
    - npm install --global surge
    - surge --project ./public --domain $STAGING_DOMAIN

deploy production: 
  stage: deploy production
  environment:
    name: production
    url: $PRODUCTION_DOMAIN
  when: manual
  allow_failure: false
  script:
    - npm install --global surge
    - surge --project ./public --domain $PRODUCTION_DOMAIN

production tests:
  image: alpine
  stage: production tests
  script:
    - apk add --no-cache curl
    - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "Hi people"
    - curl -s "https://$PRODUCTION_DOMAIN" | grep -q "$CI_COMMIT_SHORT_SHA"
```
### Devops Fundamentals - CI/CD with AWS +Docker+Ansible+Jenkins [click link](https://bosch-bgsv.udemy.com/course/devops-fundamentals-aws/)
https://www.youtube.com/watch?v=f4idgaq2VqA
### The Complete Apache Groovy Developer Course [click link](https://bosch-bgsv.udemy.com/course/apache-groovy/)
https://www.youtube.com/watch?v=hQcFE0RD0cQ



 

