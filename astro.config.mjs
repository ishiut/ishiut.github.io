// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import starlightBlog from 'starlight-blog';

// KaTeX
import { defineConfig } from 'astro/config';
import { unified } from '@astrojs/markdown-remark';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';

// https://astro.build/config
export default defineConfig({
	site: 'https://ishiut.github.io/', 
	integrations: [
		starlight({
			title: "Tetsuya Ishiu's page",
			plugins: [
				starlightBlog(), 
			], 
			sidebar: [
				{
					label: 'Documents', 
					items: [
						{ autogenerate: {directory: 'lean-sg'} }, 
					], 
				}, 
			], 
			customCss: ['./src/styles/custom.css'],
			head: [
			{
				tag: 'link',
				attrs: {
					rel: 'stylesheet',
					href: 'https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css',
					}
			}
		]}),
	],
	markdown: {
		processor: unified({
		remarkPlugins: [remarkMath],
		rehypePlugins: [rehypeKatex],
		}),
	},
});
