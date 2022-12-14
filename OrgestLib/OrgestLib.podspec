Pod::Spec.new do |spec|
    spec.name                     = 'OrgestLib'
    spec.version                  = '1.2'
    spec.homepage                 = 'Link to the Shared Module homepage'
    spec.source                   = { :git => 'https://github.com/LeartBytyqi1/OrgestLib.git'}
    spec.authors                  = 'Leart Bytyqi'
    spec.license                  = '../LICENSE'
    spec.summary                  = 'Some description for the Shared Module'
    spec.vendored_frameworks      = 'build/bin/iosX64/podReleaseFramework/OrgestLib.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '14.0'
                
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':OrgestLib',
        'PRODUCT_MODULE_NAME' => 'OrgestLib',
    }
                
    spec.script_phases = [
        {
            :name => 'Build OrgestLib',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$COCOAPODS_SKIP_KOTLIN_BUILD" ]; then
                  echo "Skipping Gradle build task invocation due to COCOAPODS_SKIP_KOTLIN_BUILD environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end