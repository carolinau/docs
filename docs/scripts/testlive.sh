#!/bin/bash
echo carolina-university.live
terminus env:deploy carolina-university.live --cc
echo cu-catalog.live
terminus env:deploy cu-catalog.live --cc
echo e4.live
terminus env:deploy e4.live --cc
echo john-wesley-school-of-leadership.live
terminus env:deploy john-wesley-school-of-leadership.live --cc
echo moore-school-of-education.live
terminus env:deploy moore-school-of-education.live --cc
echo patterson-school-of-business.live
terminus env:deploy patterson-school-of-business.live --cc
echo school-of-arts-and-sciences.live
terminus env:deploy school-of-arts-and-sciences.live --cc
echo piedmont-divinity-school.live
terminus env:deploy piedmont-divinity-school.live --cc
