FROM khintz/harp:testing

RUN mkdir -p /harpapp
COPY src/* /harpapp

WORKDIR /harpapp

CMD ["Rscript", "main.R"]
