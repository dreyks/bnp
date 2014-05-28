/**
 * Example Grunt Hub
 *
 * Edit the hub.all.src to point to your Gruntfile locations.
 * Then run `grunt`.
 */
module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    'install-dependencies': {
      options: {
        cwd: 'ng-app',
        isDevelopment: true,
      }
    },
    hub: {
      all: {
        src: ['ng-app/Gruntfile.js'],
        tasks: ['build'],
      },
    },
  });

  grunt.loadNpmTasks('grunt-install-dependencies');
  grunt.loadNpmTasks('grunt-hub');

  grunt.registerTask('default', ['install-dependencies', 'hub']);
  grunt.registerTask('heroku', ['install-dependencies', 'hub']);
};
