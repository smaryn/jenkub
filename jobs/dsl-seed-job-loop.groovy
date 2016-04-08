def giturl = 'https://github.com/smaryn/jenkub.git'
for(i in 0..2) {
    job("DSL-Loop-Job-N-${i}") {
      scm {
        git {
          remote {
            url(giturl)
          }
        createTag(false)
        }
      }

        steps {
          shell('echo "Echo from Loop"')
        }
    }
}
