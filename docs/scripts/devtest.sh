#!/bin/bash
echo carolina-university.test
terminus env:deploy carolina-university.test --cc
echo cu-catalog.test
terminus env:deploy cu-catalog.test --cc
echo e4.test
terminus env:deploy e4.test --cc
echo john-wesley-school-of-leadership.test
terminus env:deploy john-wesley-school-of-leadership.test --cc
echo moore-school-of-education.test
terminus env:deploy moore-school-of-education.test --cc
echo patterson-school-of-business.test
terminus env:deploy patterson-school-of-business.test --cc
echo school-of-arts-and-sciences.test
terminus env:deploy school-of-arts-and-sciences.test --cc
echo piedmont-divinity-school.test
terminus env:deploy piedmont-divinity-school.test --cc
