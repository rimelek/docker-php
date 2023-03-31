FROM python:3.8 AS build

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      make \
      graphviz \
 && pip3 install --upgrade pip==21.3.1

COPY "requirements.txt" "/code/"
RUN pip3 --disable-pip-version-check install -r /code/requirements.txt

COPY "." "/code/"

RUN cd /code \
 && sphinx-build -M html "." "_build" -W

FROM pierrezemb/gostatic
COPY --from=build /code/_build/html /srv/http
