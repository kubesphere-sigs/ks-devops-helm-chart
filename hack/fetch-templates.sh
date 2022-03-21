set -o errexit
set -o nounset
set -o pipefail

temp_dir=$(mktemp -d -t pipeline-templates-XXXXX)
target_dir="charts/ks-devops/templates"
git clone --depth 1 https://ghproxy.com/https://github.com/kubesphere-sigs/pipeline-templates $temp_dir
for template in $(find $temp_dir/featured -type f \( -name "*.yml" -o -name "*.yaml" \) -print)
do
  echo "Copying $template into $target_dir"
  cp $template "$target_dir/cluster-template-$(basename $template)"
done
rm $temp_dir -rf
