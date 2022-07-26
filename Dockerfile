FROM alpine:latest as helper
# Similar to the original file, except, /database.db is inside a directory now so that we can assign a volume to it.'
RUN echo "{'port':80,'baseURL':'','address':'','log':'stdout','database':'/database/database.db','root':'/srv'}" | sed "s/\'/\"/g" >/.edited.json
FROM filebrowser/filebrowser:latest
COPY --from=helper /.edited.json /.filebrowser.json
