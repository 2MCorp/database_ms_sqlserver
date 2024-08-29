FROM  mcr.microsoft.com/mssql/server:2019-latest
ARG ACCEPT_EULA=Y
ENV ACCEPT_EULA=N
ARG SA_PASSWORD=IMISuserP@s
ENV SA_PASSWORD=IMISuserP@s
ENV DB_USER_PASSWORD=IMISuserP@s
ENV DB_NAME=IMIS
ENV DB_USER=IMISUser
ENV INIT_MODE=empty

RUN mkdir -p /home/mssql/app
COPY script/* /home/mssql/app/
COPY sql /home/mssql/app/sql
WORKDIR /home/mssql/app
RUN chmod a+x /app/*.sh
CMD /bin/bash ./entrypoint.sh
