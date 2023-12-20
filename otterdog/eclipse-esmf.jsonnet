local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-esmf') {
  settings+: {
    blog: "https://eclipse-esmf.github.io/esmf-documentation/index.html",
    dependabot_alerts_enabled_for_new_repositories: false,
    dependabot_security_updates_enabled_for_new_repositories: false,
    dependency_graph_enabled_for_new_repositories: false,
    description: "Model aspects of digital twins to create APIs & UIs based on semantic information. ",
    name: "Eclipse Semantic Modeling Framework (ESMF)",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    security_managers+: [
      "dt-esmf-committers"
    ],
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
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
      value: "pass:bots/dt.esmf/gpg/secret-subkeys.asc",
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "The ESMF project website",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://eclipse-esmf.github.io/",
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
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Offer Antora UI components to publish documentation",
      homepage: "https://eclipse-esmf.github.io/esmf-documentation/index.html",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-aspect-model-editor') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Manage Aspect Models visually — create, validate, create artefacts, persist file based",
      homepage: "https://eclipse-esmf.github.io/ame-guide/introduction.html",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-aspect-model-editor-backend') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Provide a backend for the Aspect Model Editor (for the downloadable installer, please find the repository \"esmf-aspect-model-editor\").",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-manufacturing-information-model') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Provide manufacturing information models",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-parent') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Parent for shared dependencies",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-sdk') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Load Aspect Models and their artifacts as Java code; share components to realize SAMM as code",
      homepage: "https://eclipse-esmf.github.io/esmf-developer-guide/index.html",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Load Aspect Models into TypeScript. This facilitates JavaScript projects e.g. based on Angular and React.",
      homepage: "https://eclipse-esmf.github.io/js-sdk-guide/index.html",
      topics+: [
        "javascript",
        "js"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-sdk-js-schematics') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Create UI components for Angular applications with Schematics based on Aspect Models.",
      homepage: "https://eclipse-esmf.github.io/js-sdk-guide/index.html",
      topics+: [
        "angular",
        "aspect-models",
        "digital-twins",
        "javascript",
        "js"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-sdk-js-schematics-demo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Experience the JS Schematics by trying this demo",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://eclipse-esmf.github.io/esmf-sdk-js-schematics-demo/",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
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
    orgs.newRepo('esmf-sdk-py-aspect-model-loader') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Load Aspect Models in Python",
      homepage: "https://pypi.org/project/esmf-aspect-model-loader/",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-sdk-py-pandas-dataframe') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Support Pandas DataFrame with your Aspect Models in Python",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('esmf-semantic-aspect-meta-model') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Formal and textual specification of the Semantic Aspect Meta Model (SAMM)",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://eclipse-esmf.github.io/samm-specification/snapshot/index.html",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
        default_workflow_permissions: "write",
      },
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
