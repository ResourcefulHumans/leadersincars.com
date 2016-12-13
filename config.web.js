'use strict'

import config from './config'
import pjson from './package.json'

module.exports = {
  environment: config.get('environment'),
  basePath: config.get('base_path'),
  version: pjson.version
}
