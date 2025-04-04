import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [vue()],
    server: {
        host: '0.0.0.0',
        port: 3001,
        watch: {
            usePolling: true,
        },
    },
    build: {
        outDir: 'public',
        emptyOutDir: true,
    },
});