local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-esmf') {
  settings+: {
    blog: "https://eclipse-esmf.github.io/esmf-documentation/index.html",
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "Model aspects of digital twins to create APIs & UIs based on semantic information. ",
    members_can_change_project_visibility: false,
    name: "Eclipse Semantic Modeling Framework (ESMF)",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('NPMJS_TOKEN') {
      value: "pass:bots/dt.esmf/npmjs.com/token",
    },
    orgs.newOrgSecret('OSSRH_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('OSSRH_USERNAME') {
      value: "pass:bots/dt.esmf/oss.sonatype.org/username",
    },
    orgs.newOrgSecret('PGP_KEY') {
      value: "pass:bots/dt.esmf/gpg/key_id",
    },
    orgs.newOrgSecret('PGP_KEY_PASSWORD') {
      value: "pass:bots/dt.esmf/gpg/passphrase",
    },
    orgs.newOrgSecret('PYPI_TOKEN') {
      value: "pass:bots/dt.esmf/pypi.org/api-token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('eclipse-esmf.github.io') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "The ESMF project website",
      homepage: "https://eclipse-esmf.github.io/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "ame",
        "digital-twin",
        "digital-twins",
        "documentation",
        "modeling",
        "samm",
        "sdk",
        "sdk-java",
        "sdk-js",
        "semantic"
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages",
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('esmf-antora-ui') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Offer Antora UI components to publish documentation",
      homepage: "https://eclipse-esmf.github.io/esmf-documentation/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-aspect-model-editor') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Manage Aspect Models visually and persistence in local files",
      homepage: "https://eclipse-esmf.github.io/ame-guide/introduction.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-aspect-model-editor-backend') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Provide a backend for the Aspect Model Editor (for the downloadable installer, please find the repository \"esmf-aspect-model-editor\").",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-manufacturing-information-model') {
      allow_update_branch: false,
      description: "Provide manufacturing information models",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-parent') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Parent for shared dependencies",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-sdk') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Load Aspect Models and their artifacts as Java code; share components to realize SAMM as code",
      homepage: "https://eclipse-esmf.github.io/esmf-developer-guide/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('build'),
      ],
    },
    orgs.newRepo('esmf-sdk-js-aspect-model-loader') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Load Aspect Models as AngularJS for UIs based on aspect models",
      homepage: "https://eclipse-esmf.github.io/js-sdk-guide/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-sdk-js-schematics') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Create dynamic schematic UI components for angular javascript applications",
      homepage: "https://eclipse-esmf.github.io/js-sdk-guide/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "angular",
        "aspect-models",
        "digital-twins",
        "javascript",
        "js"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-sdk-js-schematics-demo') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Demo of the esmf-sdk-js-schematics repository",
      homepage: "https://eclipse-esmf.github.io/js-sdk-guide/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('esmf-sdk-py-aspect-model-loader') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Load Aspect Models in Python",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-sdk-py-pandas-dataframe') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Support Pandas DataFrame with your Aspect Models in Python",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('esmf-semantic-aspect-meta-model') {
      allow_update_branch: false,
      dependabot_alerts_enabled: false,
      description: "Formal and textual specification of the Semantic Aspect Meta Model (SAMM)",
      homepage: "https://eclipse-esmf.github.io/samm-specification/snapshot/index.html",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('REPOSITORY_URL') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:build-test"
          ],
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
  ],
}
