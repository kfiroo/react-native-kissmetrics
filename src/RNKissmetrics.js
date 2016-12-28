'use strict';

const {
    NativeModules
} = require('react-native');

const {
    RNKissmetrics
} = NativeModules;

function log(message) {
    RNKissmetrics.log(message);
}

module.exports = {
    log
};