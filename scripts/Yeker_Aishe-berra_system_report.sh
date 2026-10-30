#!/bin/bash
# System report for Yeker Aishe-berra
STUDENT_NAME="Yeker Aishe-berra"
LOG_FILE="$(dirname "$0")/../logs/Yeker_Aishe-berra_system_report.log"

{
  echo "===== SYSTEM REPORT ====="
  echo "Student: $STUDENT_NAME (ID: 37162, group: IT2-2309)"
  echo "Date and time: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Current user: $(whoami)"
  echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
  echo "Kernel: $(uname -r)"
  echo "--- CPU ---"
  lscpu | grep -E 'Model name|^CPU\(s\)'
  echo "--- Memory ---"
  free -h
  echo "--- Disk usage ---"
  df -h
  echo "--- Available disk space (/) ---"
  df -h / | awk 'NR==2 {print "Available: " $4 " (used " $5 ")"}'
  echo
} | tee -a "$LOG_FILE"
