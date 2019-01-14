#!/usr/bin/perl -wT
########
# check_mounts.pl - Checks for the unmounted NFS mountpoints.
# David Zhang
########
# Usage: ./check_nfs_mounts.pl
#
#
# Copy check_nfs_mounts.pl to /usr/local/nagios/libexec
#
# Add to Template.cfg:
# ---
#define service{
#       name                            EMS-nfs_mounts-service
#       use                             EMS-active-service
#       service_description             NFS Mount Check
#       register                        0
#       check_command                   check_nfs_mounts
#       }
#
#define service{
#       name                            EMS-nfs_mounts-passive-service
#       use                             EMS-passive-service
#       service_description             NFS Mount Check
#       register                        0
#       check_command                   check_nfs_mounts
#       }
#
# Add to EMS.cfg:
#define service{
#       use                             EMS-nfs_mounts-service
#       host_name                       local-host-name
#       contact_groups                  EMS-admins
#       }
#
# Add to checkcommands.cfg:
#define command{
#       command_name    check_nfs_mounts
#       command_line    $USER1$/check_nfs_mounts.pl
#       }


use strict;

$ENV{PATH}="/bin";
my $systype=`/bin/uname -s`;
chomp $systype;
my @mounts;
my $mounts;
my $m_location;

## for generic checks, provide mount points from arguments
#foreach (@ARGV) {
#       push (@mounts, $_);
#}
#chomp @mounts;
#my $mounts = scalar(@mounts);

if ( -e "/sbin/mount") {
        $m_location="/sbin/mount";
} else {
        $m_location="/bin/mount";
}

if ($systype eq "SunOS") {
        $m_location=$m_location . " -p";
        @mounts=`grep -i nfs /etc/vfstab|grep -v "^#" | awk '{print \$3}'`;
} else {
        @mounts=`grep -i nfs /etc/fstab|grep -v ^# | awk '{print \$2}'`;
}

chomp @mounts;

$mounts = scalar(@mounts);
if ($mounts < 1) { print "No mountpoints listed.\n"; exit 0; }

my @m_output=`$m_location | /usr/bin/awk '{print \$3}'`;
my $output;
my @m_points;
chomp @m_output;
my $errors="";
foreach (@mounts) {
        my $result=0;
        foreach my $mnt (@m_output) {
                if ($_ eq $mnt) {
                        $result++;
                }
        }
        if ($result != 1) {
                $errors=$errors . "$_ mount point not found. ";
        }
}

if ($errors ne "") {
        print "CRITICAL: $errors\n";
        exit 2;
} else {
        print "OK: All Mounts exist\n";
        exit 0;
}
