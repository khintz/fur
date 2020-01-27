FROM khintz/harp:latest

RUN mkdir -p /harpapp
COPY src/* /harpapp/

WORKDIR /harpapp/

# This is the 'interesting stuff' runned when runnning the container
CMD ["Rscript", "main.R"]
# Add more/other things to include your own
# CMD ["Rscript", "myApp.R"]
# CMD ["Rscript", "mySecondApp.R"]
