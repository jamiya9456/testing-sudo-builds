#!/bin/bash
curl -i -H "Authorization: $GITHUB_TOKEN" 'https://api.github.com/repos/EasyEngine/easyengine/releases?per_page=1'
