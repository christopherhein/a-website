{{ define "packages" }}
{{ range $index, $pkg := .packages }}{{ range $idx, $type := (visibleTypes (sortedTypes $pkg.Types))}}{{ if eq $idx 0 }}---
title: {{ $type.Name.Name }}
description: Reference documentation for {{ packageDisplayName $pkg }}.{{ $type.Name.Name }}
---
{{ end }}

{{ template "type" $type  }}{{ end }}{{ end }}

{{ if .sensitiveData}}## Sensitive Values
| Name | Type | Description |
|------|------|-------------|
{{ range .sensitiveData }}| `{{- .Name -}}` | ***{{- .Type -}}*** | {{- .Description -}} |
{{- end -}}
{{ end }}
{{ end }}