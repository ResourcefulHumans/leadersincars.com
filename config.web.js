import pjson from './package.json'

process.stdout.write(JSON.stringify({
  environment: process.env.ENVIRONMENT || 'production',
  basePath: process.env.BASE_PATH,
  version: pjson.version
}))
