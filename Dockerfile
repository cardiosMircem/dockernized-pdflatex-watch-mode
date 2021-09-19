FROM pandoc/latex:latest

RUN tlmgr update --self && tlmgr install tikzsymbols

ENTRYPOINT ["pdflatex"]