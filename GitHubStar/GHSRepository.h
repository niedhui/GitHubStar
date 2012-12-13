//
//  GHSRepository.h
//  GitHubStar
//
//  Created by nie dianhui on 12/11/12.
//  Copyright (c) 2012 nie dianhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface GHSRepository : MTLModel

@property(nonatomic, copy, readonly) NSString *name;

// maybe null , eg: https://github.com/github/gitignore
@property(nonatomic, copy, readonly) NSString *language;

@property(nonatomic, copy, readonly) NSString *HTMLURLString;

@property(nonatomic, copy, readonly) NSString *description;

@end

//{
//    "archive_url" = "https://api.github.com/repos/mojombo/grit/{archive_format}{/ref}";
//    "assignees_url" = "https://api.github.com/repos/mojombo/grit/assignees{/user}";
//    "blobs_url" = "https://api.github.com/repos/mojombo/grit/git/blobs{/sha}";
//    "branches_url" = "https://api.github.com/repos/mojombo/grit/branches{/branch}";
//    "clone_url" = "https://github.com/mojombo/grit.git";
//    "collaborators_url" = "https://api.github.com/repos/mojombo/grit/collaborators{/collaborator}";
//    "comments_url" = "https://api.github.com/repos/mojombo/grit/comments{/number}";
//    "commits_url" = "https://api.github.com/repos/mojombo/grit/commits{/sha}";
//    "compare_url" = "https://api.github.com/repos/mojombo/grit/compare/{base}...{head}";
//    "contents_url" = "https://api.github.com/repos/mojombo/grit/contents/{+path}";
//    "contributors_url" = "https://api.github.com/repos/mojombo/grit/contributors";
//    "created_at" = "2007-10-29T14:37:16Z";
//    description = "Grit gives you object oriented read/write access to Git repositories via Ruby.";
//    "downloads_url" = "https://api.github.com/repos/mojombo/grit/downloads";
//    "events_url" = "https://api.github.com/repos/mojombo/grit/events";
//    fork = 0;
//    forks = 276;
//    "forks_count" = 276;
//    "forks_url" = "https://api.github.com/repos/mojombo/grit/forks";
//    "full_name" = "mojombo/grit";
//    "git_commits_url" = "https://api.github.com/repos/mojombo/grit/git/commits{/sha}";
//    "git_refs_url" = "https://api.github.com/repos/mojombo/grit/git/refs{/sha}";
//    "git_tags_url" = "https://api.github.com/repos/mojombo/grit/git/tags{/sha}";
//    "git_url" = "git://github.com/mojombo/grit.git";
//    "has_downloads" = 1;
//    "has_issues" = 1;
//    "has_wiki" = 1;
//    homepage = "http://grit.rubyforge.org/";
//    "hooks_url" = "https://api.github.com/repos/mojombo/grit/hooks";
//    "html_url" = "https://github.com/mojombo/grit";
//    id = 1;
//    "issue_comment_url" = "https://api.github.com/repos/mojombo/grit/issues/comments/{number}";
//    "issue_events_url" = "https://api.github.com/repos/mojombo/grit/issues/events{/number}";
//    "issues_url" = "https://api.github.com/repos/mojombo/grit/issues{/number}";
//    "keys_url" = "https://api.github.com/repos/mojombo/grit/keys{/key_id}";
//    "labels_url" = "https://api.github.com/repos/mojombo/grit/labels{/name}";
//    language = Ruby;
//    "languages_url" = "https://api.github.com/repos/mojombo/grit/languages";
//    "merges_url" = "https://api.github.com/repos/mojombo/grit/merges";
//    "milestones_url" = "https://api.github.com/repos/mojombo/grit/milestones{/number}";
//    "mirror_url" = "<null>";
//    name = grit;
//    "notifications_url" = "https://api.github.com/repos/mojombo/grit/notifications{?since,all,participating}";
//    "open_issues" = 96;
//    "open_issues_count" = 96;
//    owner =         {
//        "avatar_url" = "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png";
//        "events_url" = "https://api.github.com/users/mojombo/events{/privacy}";
//        "followers_url" = "https://api.github.com/users/mojombo/followers";
//        "following_url" = "https://api.github.com/users/mojombo/following";
//        "gists_url" = "https://api.github.com/users/mojombo/gists{/gist_id}";
//        "gravatar_id" = 25c7c18223fb42a4c6ae1c8db6f50f9b;
//        id = 1;
//        login = mojombo;
//        "organizations_url" = "https://api.github.com/users/mojombo/orgs";
//        "received_events_url" = "https://api.github.com/users/mojombo/received_events";
//        "repos_url" = "https://api.github.com/users/mojombo/repos";
//        "starred_url" = "https://api.github.com/users/mojombo/starred{/owner}{/repo}";
//        "subscriptions_url" = "https://api.github.com/users/mojombo/subscriptions";
//        type = User;
//        url = "https://api.github.com/users/mojombo";
//    };
//    permissions =         {
//        admin = 0;
//        pull = 1;
//        push = 0;
//    };
//    private = 0;
//    "pulls_url" = "https://api.github.com/repos/mojombo/grit/pulls{/number}";
//    "pushed_at" = "2012-09-04T21:54:09Z";
//    size = 2234;
//    "ssh_url" = "git@github.com:mojombo/grit.git";
//    "stargazers_url" = "https://api.github.com/repos/mojombo/grit/stargazers";
//    "statuses_url" = "https://api.github.com/repos/mojombo/grit/statuses/{sha}";
//    "subscribers_url" = "https://api.github.com/repos/mojombo/grit/subscribers";
//    "subscription_url" = "https://api.github.com/repos/mojombo/grit/subscription";
//    "svn_url" = "https://github.com/mojombo/grit";
//    "tags_url" = "https://api.github.com/repos/mojombo/grit/tags{/tag}";
//    "teams_url" = "https://api.github.com/repos/mojombo/grit/teams";
//    "trees_url" = "https://api.github.com/repos/mojombo/grit/git/trees{/sha}";
//    "updated_at" = "2012-12-10T21:08:39Z";
//    url = "https://api.github.com/repos/mojombo/grit";
//    watchers = 1554;
//    "watchers_count" = 1554;
//}
