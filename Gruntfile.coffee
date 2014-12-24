require('coffee-script/register')

module.exports = (grunt) ->
  grunt.initConfig(require('./grunt'))

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-express-server')

  grunt.registerTask('build', ['clean', 'coffee', 'browserify', 'uglify'])
  grunt.registerTask('listen', ['build', 'express'])
  grunt.registerTask('serve', ['listen', 'watch'])

  grunt.registerTask('default', ['build'])
