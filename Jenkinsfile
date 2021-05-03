node {
  stage('Checkout') {
    git credentialsId: 'martin.lafaix', url: 'https://github.com/mlafaix/demo'
  }
  stage('Build') {
    echo 'building'
  }
  stage('QA') {
    def workflow_id = runSquashWorkflow(
      workflowPathName:'Squashfile',
      workflowTimeout: '120S',
      serverName:'defaultServer'
    )
    echo "We just ran The Squash Orchestrator workflow $workflow_id"
  }
  stage('Notification') {
     echo 'done'   
  }
}
