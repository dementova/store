CONFIG = YAML.load_file(File.join(Rails.root, "config", "store.yml")) || {}
IMPORT = YAML.load_file(File.join(Rails.root, "config", "import.yml")) || {}