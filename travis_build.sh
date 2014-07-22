#!/bin/sh

echo "-------------------"
echo "-------------------"


PROJECT=sampleCaptureForIos.xcworkspace
SCHEME=sampleCaptureForIos
TEST_SDK=iphonesimulator

CONFIGURATION_DEBUG=Debug
DESTINATION="platform=iOS Simulator,name=iPhone Retina (4-inch),OS=7.1"

OUTPUT_PATH="`pwd`/build/"

# test コマンド - clean, build, XCTest を実行する
xcodebuild \
  -workspace "${PROJECT}" \
  -scheme "${SCHEME}" \
  -sdk "${TEST_SDK}" \
  -configuration "${CONFIGURATION_DEBUG}" \
  -destination "${DESTINATION}" \
  SYMROOT="$OUTPUT_PATH" \
  DSTROOT="$OUTPUT_PATH" \
  clean build test
