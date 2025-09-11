@Library('my-shared-library') _

def configMap = [
    PROJECT : 'roboshop',
    COMPONENT : 'shipping'
]

if ( env.BRANCH_NAME.equalsIgnoreCase('main') ){
    javaEKSpipeline(configMap)
}
else {
    echo 'Please Proceed with PROD Access'
}