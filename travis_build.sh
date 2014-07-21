#!/bin/sh

echo "-------------------"
echo "${xcode_workspace}"
echo "-------------------"


PROJECT=sampleCaptureForIos.xcworkspace
SCHEME=sampleCaptureForIos
TEST_SDK=iphonesimulator

CONFIGURATION_DEBUG=Debug
DESTINATION="platform=iOS Simulator,name=iPhone Retina (4-inch),OS=7.1"

# test コマンド - clean, build, XCTest を実行する
xcodebuild \
  -workspace "${PROJECT}" \
  -scheme "${SCHEME}" \
  -sdk "${TEST_SDK}" \
  -configuration "${CONFIGURATION_DEBUG}" \
  -destination "${DESTINATION}" \
  clean build test
