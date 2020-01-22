FROM khintz/harp:latest

RUN mkdir -p /harpapp
COPY src/* /harpapp/

WORKDIR /harpapp

CMD ["Rscript", "main.R"]
#Test case for verification
CMD ["Rscript", "example_verif.R"]
