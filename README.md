# On Save PDF Generation from .tex files

## Requirements
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## Optional
* [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave)


## What it is
If you do not want to install a tex distribution locally (which takes ages), with this project you can build your PDF from any `.tex` file. The onSave feature is also available :blush:


## Why it is useful
* No need of installing latex on your machine 
* Just need ~700 MB of space (size of the docker image)


## How to use it 
* Copy and paste the `Dockerfile` and `docker-compose.yml` and put them at the root of your project
* Create a folder `main/` in the root of your latex project
* Go inside `main/` and create `main.tex` file
* Write something in it for example 
``` latex
\documentclass{article}
\usepackage{tikzsymbols}
\begin{document}
  Here it is an example of \normalsize \LaTeX \ document. Enjoy \Laughey[1.3]
\end{document}
```
* Since the auto save is not activated yet, test the PDF generation simply by typing
```
docker-compose up
```
![](pdflatex.png?raw=true)

## Customization

Of course you can change either the `main/` folder or the `main.tex` simply by going to the `docker-compose.yml` editing the following lines:
  * `- ./main:/data` to `- <your folder>:/data`
  * `command: main.tex` to `command: <name of your .tex file in your folder>`

It can also happen that you import some packages in the project that are not included in the docker image yet. For this:
  * import them in `Dockerfile` like
  ```
  RUN tlmgr install sectsty helvetic .....
  ```
  * rebuild the image using
  ```
  docker-compose up --build
  ```


## OnSave Generation
To achieve this in Visual Studio Code, install [Run on Save](https://marketplace.visualstudio.com/items?itemName=emeraldwalk.RunOnSave) and follow the extension instructions. I have put this in my `settings.json`. In order to check if it works, you have to go under the output tab of Visual Studio Code terminal and select 'Run On Save' option
``` javascript    
"emeraldwalk.runonsave": {
    "commands": [
        {
            "match": ".tex$",
            "cmd": "docker-compose up"
        }
    ]
}
```