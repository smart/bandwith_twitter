  namespace :dojo do
    task :compile do
      classpath = '../shrinksafe/js.jar:../shrinksafe/shrinksafe.jar'
      main = 'org.mozilla.javascript.tools.shell.Main'
      args = "profileFile=../../compiled.profile.js"

      Dir.chdir('lib/dojo/util/buildscripts') do
        sh 'java', '-classpath', classpath, main, 'build.js', args
      end

    end
  end
