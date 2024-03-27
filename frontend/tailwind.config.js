/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      backgroundImage: {
        'hero-pattern':
          "linear-gradient(to right, rgba(44, 156, 254, .8), rgba(73, 80, 255, .8)), url('https://plus.unsplash.com/premium_photo-1661963542752-9a8a1d72fb28?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1c2VzfGVufDB8fDB8fHww')",
      },
    },
  },
  plugins: [],
};
