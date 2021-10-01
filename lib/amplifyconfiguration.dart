const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "[COGNITO_IDENTITY_POOL_ID]",
                          "Region": "[COGNITO_IDENTITY_POOL_REGION]"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "[COGNITO_USER_POOL_ID]",
                      "AppClientId": "[COGNITO_USER_POOL_APP_CLIENT_ID]",
                      "Region": "[COGNITO_USER_POOL_REGION]"
                  }
              },
              "Auth": {
                  "Default": {
                      "OAuth": {
                            "WebDomain": "[COGNITO_DOMAIN_PREFIX].auth.[COGNITO_USER_POOL_REGION].amazoncognito.com",
                            "AppClientId": "[COGNITO_USER_POOL_APP_CLIENT_ID]",
                            "SignInRedirectURI": "[SIGN_IN_REDIRECT_URI]",
                            "SignOutRedirectURI": "[SIGN_OUT_REDIRECT_URI]",
                            "Scopes": ["[OAUTH_SCOPES]"]
                       },
                      "authenticationFlowType": "[AUTHENTICATION_FLOW_TYPE]"
                  }
              }
          }
      }
  }
}''';
