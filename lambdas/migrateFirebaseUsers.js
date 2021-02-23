'use strict';
const AWS = require('aws-sdk');
const s3 = new AWS.S3();

exports.handler = async (event, context, callback) => {
  console.log('Event:', event);
};
