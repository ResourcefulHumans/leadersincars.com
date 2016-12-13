'use strict'

import config from './config'

module.exports = {
  environment: config.get('environment'),
  basePath: config.get('base_path')
}
