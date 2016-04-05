// Example from https://jenkinsci.github.io/job-dsl-plugin/
// def giturl = 'https://github.com/quidryan/aws-sdk-test.git'
def giturl = 'git://github.com/smaryn/dockervol.git'

for(i in 0..10) {
  job("DSL-Tutorial-1-Test-${i}") {
    scm {
      git {
        remote {
          git(giturl)
        }
        createTag(false)
        // clean()
      }
    }
    triggers {
        scm('*/15 * * * *')

    }
    steps {
          shell('echo "Step N ${i}""')
      }
    }
  }
}§

listView('Seed Jobs') {
    description('')
    filterBuildQueue()
    filterExecutors()
    jobs {
        regex(/.*seed-job.*/)
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}

listView('Job DSL Tutorial') {
    description('')
    filterBuildQueue()
    filterExecutors()
    jobs {
        regex(/.*Tutorial.*/)
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}
