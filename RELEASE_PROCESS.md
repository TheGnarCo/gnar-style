* Checkout master: `git checkout master`.
* Get latest: `git pull --rebase origin master`
* Bump version number in `lib/gnar-style/version.rb`.
* Run `bundle install` to ensure the version bump takes in the `Gemfile.lock` file.
* Update the [CHANGELOG](CHANGELOG.md), moving the current release work to under the version number.
* Create a commit, including the version number in the commit message: `git add
  --all && git commit -m "Version x.y.z"`.
* Push the release to RubyGems: `rake release`.
