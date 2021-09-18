FROM pandoc/latex:latest

RUN tlmgr update --self && tlmgr install sectsty lastpage helvetic

ENTRYPOINT ["pdflatex"]