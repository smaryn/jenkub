// Simple DSL seed job example
def giturl = 'https://github.com/smaryn/dockervol.git'

job('DSL-Tutorial-1-Test') {
    scm {
        git(giturl)
    }
    triggers {
        scm('*/15 * * * *')
    }
    steps {
          shell('echo "Step N1"')
    }
}
