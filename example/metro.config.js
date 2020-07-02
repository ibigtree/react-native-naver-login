/**
 * Metro configuration for React Native
 * https://github.com/facebook/react-native
 *
 * @format
 */
const path = require('path');
const blacklist = require('metro-config/src/defaults/blacklist');

module.exports = {
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: false,
      },
    }),
  },
  resolver: {
    extraNodeModules: new Proxy(
      {},
      {get: (_, name) => path.resolve('.', 'node_modules', name)},
    ),
    blacklistRE: blacklist([/..\/node_modules\/.*/]),
  },

  // quick workaround for another issue with symlinks
  watchFolders: ['.', '..'],
};
