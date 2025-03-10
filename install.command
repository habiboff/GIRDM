#!/bin/bash

# Renk kodları
GREEN='\033[0;32m'
NC='\033[0m'

# CLI aracını oluştur
cat > /usr/local/bin/csc-cli << 'EOF'
#!/bin/bash

if [ "$1" != "create" ] || [ "$2" != "ios-project" ]; then
    echo "Kullanım: csc-cli create ios-project --name ProjeAdı --bundle-id com.sirket.app"
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        --name) PROJECT_NAME="$2"; shift 2 ;;
        --bundle-id) BUNDLE_ID="$2"; shift 2 ;;
        *) shift ;;
    esac
done

if [ -z "$PROJECT_NAME" ] || [ -z "$BUNDLE_ID" ]; then
    echo "Hata: Proje adı ve bundle ID gerekli!"
    exit 1
fi

git clone https://github.com/habiboff/GIRDM.git "$PROJECT_NAME"
cd "$PROJECT_NAME"
rm -rf .git
find . -name "*.pbxproj" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +
find . -name "*.pbxproj" -exec sed -i '' "s/com.habiboff.GIRDM/$BUNDLE_ID/g" {} +

echo -e "${GREEN}✅ Proje başarıyla oluşturuldu: $PROJECT_NAME${NC}"
EOF

# CLI aracını çalıştırılabilir yap
chmod +x /usr/local/bin/csc-cli

echo -e "${GREEN}✅ CSC CLI başarıyla kuruldu!${NC}"
echo "Kullanım: csc-cli create ios-project --name ProjeAdı --bundle-id com.sirket.app"
