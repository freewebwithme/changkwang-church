const defaultTheme = require("tailwindcss/defaultTheme");
//require("fontsource-nanum-myeongjo");

module.exports = {
  purge: [
    "../**/*.html.eex",
    "../**/*.html.leex",
    "../**/views/**/*.ex",
    "../**/live/**/*.ex",
    "./js/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Nanum Myeongjo", "Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {},
  plugins: [], //require("@tailwindcss/ui")],
};
