FROM khintz/harp:latest

ARG PID
ARG GID

ENV PID=$PID
ENV GID=$GID

RUN groupadd -g $GID harpuser
RUN useradd -u $PID -g $GID -d /home/harpuser/ -m -s /bin/bash harpuser && echo "harpuser:harpuser" | chpasswd && adduser harpuser sudo

WORKDIR /home/harpuser/
COPY src/* /home/harpuser/

RUN chown -R harpuser:harpuser /home/harpuser/
USER harpuser
#RUN mkdir -p /harpapp
#COPY src/* /harpapp/

#WORKDIR /harpapp/

# This is the 'interesting stuff' runned when runnning the container
CMD ["Rscript", "main.R"]
# Add more/other things to include your own
# CMD ["Rscript", "myApp.R"]
# CMD ["Rscript", "mySecondApp.R"]
#RUN chown -R $PID:$GID /data
