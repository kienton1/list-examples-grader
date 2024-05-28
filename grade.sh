CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -f "student-submission/ListExamples.java" ]; then
    echo "File Exists"
else
    echo "File dosn't Exist"
    exit 1
fi

cp -r student-submission/*.java grading-area/
cp -r TestListExamples.java grading-area/
cp -r lib grading-area

cd grading-area

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCOre TestListExamples

if [ $? -eq 0 ]; then
    echo "All tests passed"
else
    echo "Some Tests Failed!"
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
