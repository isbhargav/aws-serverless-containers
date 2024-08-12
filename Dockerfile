FROM public.ecr.aws/docker/library/node:20-slim
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.8.4 /lambda-adapter /opt/extensions/lambda-adapter
ENV PORT=8080
WORKDIR "/var/task"
ENV AWS_LWA_READINESS_CHECK_PATH=/healthcheck
ADD ./package.json /var/task/package.json
ADD ./package-lock.json /var/task/package-lock.json
ADD ./app.js /var/task/app.js
RUN npm install --omit=dev
CMD ["node", "app.js"]
