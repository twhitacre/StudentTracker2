class GithubController < ApplicationController

  def user_info
    @user = Github.users.get user: params[:username]
    render json: Hash[@user]
  end

  def user_repos
    @repos = Github.repos.list user: params[:username]
    render json: @repos
  end

  def open_issues
    @open_issues = Github.issues.list user: GITHUB_ORG,
      repo: ASSIGN_REPO,
      state: 'all',
      # labels: 'Complete',
      assignee: params[:username]
    render json: @open_issues
  end

  def org_members
    @members = Github.orgs.members.list GITHUB_ORG
    render json: @members
  end

end
