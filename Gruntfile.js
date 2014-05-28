/**
 * Example Grunt Hub
 *
 * Edit the hub.all.src to point to your Gruntfile locations.
 * Then run `grunt`.
 */
module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    auto_install: {
      ng_app: {
        options: {
          cwd: 'ng-app',
        }
      }
    },
    hub: {
      all: {
        src: ['ng-app/Gruntfile.js'],
        tasks: ['build'],
      },
    },
  });

  grunt.loadNpmTasks('grunt-auto-install');
  grunt.loadNpmTasks('grunt-hub');

  grunt.registerTask('install', ['auto_install']);
  grunt.registerTask('default', ['auto_install', 'hub']);
  grunt.registerTask('heroku', ['auto_install', 'hub']);
};
