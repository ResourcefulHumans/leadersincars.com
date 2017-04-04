# Source code for leadersincars.com

[![Build Status](https://travis-ci.org/ResourcefulHumans/leadersincars.com.svg)](https://travis-ci.org/ResourcefulHumans/leadersincars.com) [![monitored by greenkeeper.io](https://img.shields.io/badge/greenkeeper.io-monitored-brightgreen.svg)](http://greenkeeper.io/)

## Live

:earth_africa: <https://leadersincars.com/>

The DNS settings for the domain are managed via [Route 53](https://console.aws.amazon.com/route53/home?region=us-east-1#resource-record-sets:Z3S3LHFR1G777O).

Because GitHub pages do not support SSL certificates for custom domains, the CloudFront distribution [`E360KSPT0XYMLC`](https://console.aws.amazon.com/cloudfront/home?region=eu-central-1#distribution-settings:E360KSPT0XYMLC) is used to serve it SSL encrypted with the certificate [`b69ce9e3-2b6f-4a3c-8da4-06ea2c013ec4`](https://console.aws.amazon.com/acm/home?region=us-east-1#/?id=b69ce9e3-2b6f-4a3c-8da4-06ea2c013ec4).

The www redirect is configured via the S3 bucket [`www.leadersincars.com`](https://console.aws.amazon.com/s3/buckets/www.leadersincars.com/?region=eu-central-1&tab=overview) without an SSL certificate.

### Connected Services

Newsletter subscriptions are collected [in MailChimp](https://us12.admin.mailchimp.com/lists/members/?id=80225#p:1-s:25-so:null).

### Deployment

:rocket: Deployment for this package is automated via [Travis CI](https://github.com/ResourcefulHumans/leadersincars.com/blob/master/.travis.yml).  
**Every commit will trigger a deploy.**

If `make build` successfully builds the web page, it will be force pushed to the `gh-pages` branch of this repository, which makes it available via [GitHub's free website hosting service](https://pages.github.com/) at <http://resourcefulhumans.github.io/leadersincars.com/>.

The credentials for force pushing are provided via the environment variable `GH_TOKEN` [in Travis](https://travis-ci.org/ResourcefulHumans/leadersincars.com/settings). New tokens can be created [via the GitHub website](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/), having at least `repo` scope.
