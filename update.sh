#!/bin/bash

#set -x

OPT_BRANCH=""
OPT_VERSION=""

usage ()
{
    echo "usage: $0 -b <branch name> -v <version>"
    echo "  Where <branch name> is the branch of the SalesforceMobileSDK-iOS to checkout."
    echo "  Where <version> is version the specs should be stored under."

}

parse_opts ()
{
    while getopts b:v: command_line_opt
    do
        case ${command_line_opt} in
            b)
                OPT_BRANCH=${OPTARG};;
            v)
                OPT_VERSION=${OPTARG};;
            ?)
                echo "Unknown option '-${OPTARG}'."
                usage
                exit 1;;
        esac
    done

    if [ "${OPT_BRANCH}" == "" ]
    then
        echo "You must specify a value for the branch."
        usage
        exit 1
    fi

    valid_branch_regex='^[a-zA-Z0-9_][a-zA-Z0-9_]*(/[a-zA-Z0-9_][a-zA-Z0-9_]*)?$'
    if [[ "${OPT_BRANCH}" =~ $valid_branch_regex ]]
   	 then
   	     # No action
    	    :
   	 else
    	    echo "${OPT_BRANCH} is not a valid branch name.  Should be in the format <[remote/]branch name>"
      	  exit 2
    fi

    if [ "${OPT_VERSION}" == "" ]
    then
        echo "You must specify a value for the version."
        usage
        exit 1
    fi

    valid_version_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
    if [[ "${OPT_VERSION}" =~ $valid_version_regex ]]
   	 then
   	     # No action
    	    :
   	 else
    #	    echo "${OPT_VERSION} is not a valid version name.  Should be in the format <integer.integer.interger>"
     # 	  exit 2
            :
    fi

}

# Helper functions
get_root_folder ()
{
    local current_folder=`dirname "${BASH_SOURCE[0]}"`
    echo `cd $current_folder && pwd`
}

update_branch ()
{
    trimmed_branch_name=`echo "${OPT_BRANCH}" | sed 's/\///g'`
    if [ "${trimmed_branch_name}" == "${OPT_BRANCH}" ]
    then
        # Not a remote branch, so update the local one.
        echo "Updating ${OPT_BRANCH} from origin."
        git merge origin/${OPT_BRANCH}
    fi
}

update_repo ()
{
    local repo_dir=$1
    local git_repo_url=$2

    if [ ! -d "$repo_dir" ]
    then
        echo "Cloning $git_repo_url into $repo_dir"
        git clone ${git_repo_url} ${repo_dir}
        cd ${repo_dir}
    else
        echo "Found repo at $repo_dir.  Fetching the latest"
        cd ${repo_dir}
        git fetch origin
    fi

    echo "Checking out the ${OPT_BRANCH} branch."
    git checkout ${OPT_BRANCH}
    update_branch
    cd ${ROOT_FOLDER}
}

copy_specs ()
{
    local repo_dir=$1
    local version=$2
    find $repo_dir -name "*.podspec" -maxdepth 1 | while read SPEC_PATH; do
        SPEC=`basename "${SPEC_PATH}"`
        LIBNAME="${SPEC%.podspec}"
        mkdir -p ${LIBNAME}/${version}
        echo "Copying ${SPEC_PATH} to ${LIBNAME}/${version}/${SPEC}"
        cp ${SPEC_PATH} ${LIBNAME}/${version}/${SPEC}
    done
}

ROOT_FOLDER=$(get_root_folder)
IOS_SDK_REPO_PATH="https://github.com/forcedotcom/SalesforceMobileSDK-iOS.git"
IOS_SDK_FOLDER="SalesforceMobileSDK-iOS"

echo "ROOT->$ROOT_FOLDER"

parse_opts "$@"

# Work from the root of the repo.
cd ${ROOT_FOLDER}

echo "*** Getting main repo ***"
update_repo "${IOS_SDK_FOLDER}" "${IOS_SDK_REPO_PATH}"

echo "*** Copying specs ***"
copy_specs "${IOS_SDK_FOLDER}" "${OPT_VERSION}"

echo "*** Cleanup ***"
rm -rf $IOS_SDK_FOLDER
