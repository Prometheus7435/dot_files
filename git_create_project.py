"""
le docstring
"""

import os
import sys

from github import Github

# from GitHub doc page

# # using an access token
# g = Github("access_token")

# # Github Enterprise with custom hostname
# g = Github(base_url="https://{hostname}/api/v3", login_or_token="access_token")

# for repo in g.get_user().get_repos():
#     print(repo.name)
#     repo.edit(has_wiki=False)
#     # to see all the available attributes and methods
#     print(dir(repo))


def main(repo_name, file_extension):
    """

    """
    # the path is, path you're in right now + whatever you specify from this point
    user_data_file = open(
        os.path.abspath(r'.github_user_data.txt'), 'r').readlines()

    user_data = [u.replace('\n', '') for u in user_data_file]
    user = user_data[0]
    token = user_data[1]

    g = Github(f'{token}')

    g.get_user().create_repo(repo_name, description='I am a description', private=True)

    new_repo = g.get_repo(f'{user}/{repo_name}')

    new_repo.create_file('readme.md', message='initial commit',
                         content='')

    new_repo.create_file(f'{repo_name}.{file_extension}',
                         message='initial commit', content='')

    sys.stdout.write(f"{user}/{repo_name}")


if __name__ == '__main__':
    NAME = sys.argv[1]
    FILE_EXTENSION = sys.argv[2]

    main(NAME, FILE_EXTENSION)
