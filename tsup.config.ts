import { defineConfig } from 'tsup';

export default defineConfig({
  entry: ['src/main.ts'],
  format: ['esm'],
  platform: 'node',
  target: 'node20',
  sourcemap: true,
  minify: true,
  clean: true,
  outDir: 'dist',
  // bundle: true là default của tsup, nhưng để rõ:
  bundle: true,
});
