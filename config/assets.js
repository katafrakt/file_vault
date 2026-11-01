import * as assets from "hanami-assets";
import {sassPlugin} from 'esbuild-sass-plugin'
import {dirname, join} from 'path'
import {fileURLToPath} from 'url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const projectRoot = join(__dirname, '..')

// Assets are managed by esbuild (https://esbuild.github.io), and can be
// customized below.
//
// Learn more at https://hanakai.org/learn/hanami/assets/customization/.

await assets.run({
  projectRoot: projectRoot,
  esbuildOptionsFn: (args, esbuildOptions) => {
    // Customize your `esbuildOptions` here.
    //
    // Use the `args.watch` boolean as a condition to apply diffierent options
    // when running `hanami assets watch` vs `hanami assets compile`.

    esbuildOptions.plugins.push(sassPlugin({
      filter: /\.scss$/,
      // vanilla-framework still uses legacy @import internally
      silenceDeprecations: ['import', 'if-function', 'global-builtin']
    }));

    return esbuildOptions;
  },
});
