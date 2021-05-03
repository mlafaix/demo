node {
  stage('Checkout') {
    git credentialsId: 'martin.lafaix', url: 'https://github.com/mlafaix/demo'
  }
  stage('Build') {
    echo 'building'
  }
  stage('Deploy in UAT') {
    echo 'deployed in UAT'
  }
  stage('QA') {
    withCredentials([usernamePassword(credentialsId: 'squash-tm', passwordVariable: 'SQUASHTF_PASSWORD', usernameVariable: 'SQUASHTF_USER')]) {
      def workflow_id = runSquashWorkflow(
        workflowPathName:'Squashfile',
        workflowTimeout: '120S',
        serverName:'squash-orchestrator'
      )
      echo "We just ran The Squash Orchestrator workflow $workflow_id"
    }
  }
  stage('Deploy in PREPROD') {
    echo 'deployed in PREPROD'
  }
  stage('QA') {
    withCredentials([usernamePassword(credentialsId: 'squash-tm', passwordVariable: 'SQUASHTF_PASSWORD', usernameVariable: 'SQUASHTF_USER')]) {
      def workflow_id = runSquashWorkflow(
        workflowPathName:'Squashfile_preprod',
        workflowTimeout: '120S',
        serverName:'squash-orchestrator'
      )
      echo "We just ran The Squash Orchestrator workflow $workflow_id"
    }
  }  
  stage('Notification') {
     echo 'done'   
  }
}
