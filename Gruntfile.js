// START: init_config
module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      code: {
        files: ['web/**/*.html', 'lib/**/*.dart', 'lib/**/*.html'],
        options: {
          livereload: true
        }
      }
// END: init_config
      ,
      tests: {
        files: [
          'test/**/*.dart',
          'test/**/*.html',
          'lib/**/*.dart',
          'lib/**/*.html'
        ],
        tasks: ['shell:test']
      }
    },
    shell: {
      test: {
        command: 'test/run.sh',
        options: {
          stdout: true,
          failOnError: true
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-shell');
// START: close_module
  grunt.loadNpmTasks('grunt-contrib-watch');
};
// END: close_module
