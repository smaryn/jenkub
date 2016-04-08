// Simple DSL seed job example
def giturl = 'https://github.com/smaryn/dockervol.git'

job('DSL-Tutorial-1-Test') {
    scm {
      git {
        remote {
          url(giturl)
        }
        createTag(false)
      }

    }

    triggers {
        scm('*/3 * * * *')
    }
    steps {
          shell('echo "Step N1"')
    }
}
