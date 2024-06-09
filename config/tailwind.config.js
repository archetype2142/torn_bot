const defaultTheme = require('tailwindcss/defaultTheme')
/** @type {import('tailwindcss').Config} */

module.exports = {
  important: true,
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js,jsx}',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/*.rb',
    './app/components/**/*.{html,erb,slim}',
  ],
  theme: {
    colors: ({ colors }) => ({
      // Now those classes below will be available to us through Tailwind utilities - for example as .bg-th-primary
      // when other theme classes are set in application.css we can use them to override main theme class as follows:
      inherit: colors.inherit,
      current: colors.current,
      transparent: colors.transparent,
      black: colors.black,
      white: colors.white,
      slate: colors.slate,
      gray: colors.gray,
      zinc: colors.zinc,
      neutral: colors.neutral,
      stone: colors.stone,
      red: colors.red,
      orange: colors.orange,
      amber: colors.amber,
      yellow: colors.yellow,
      lime: colors.lime,
      green: colors.green,
      emerald: colors.emerald,
      teal: colors.teal,
      cyan: colors.cyan,
      sky: colors.sky,
      blue: colors.blue,
      indigo: colors.indigo,
      violet: colors.violet,
      purple: colors.purple,
      fuchsia: colors.fuchsia,
      pink: colors.pink,
      rose: colors.rose,
    }),
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/aspect-ratio'),
    // require('@tailwindcss/container-queries'),
  ]
}
