'use strict'

import nconf from 'nconf'

nconf.use('memory')

nconf
  .env({
    whitelist: [
      'environment',
      'base_path'
    ],
    lowerCase: true,
    separator: '__'
  })

nconf.defaults({
  'environment': 'development',
  'base_path': '/'
})

export default nconf
