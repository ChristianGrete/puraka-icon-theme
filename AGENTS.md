# Agent Instructions

This is **Puraka**, a GNOME icon theme that extends Adwaita with redesigned icons for third-party applications. The goal is visual harmony—icons should blend seamlessly into the GNOME/Adwaita aesthetic while remaining instantly recognizable.

## Project Philosophy

- **Adwaita first:** Third-party app icons are redesigned to match GNOME HIG and the Adwaita color palette. Corporate branding is intentionally ignored.
- **Essence over detail:** Icons preserve the "soul" of the original but abstract away unnecessary visual clutter.
- **This is a design project:** The primary work happens in Inkscape, not in code. Automation is secondary.

## Directory Structure

```
puraka-icon-theme/
├── src/                    # Source files (Inkscape working files)
│   └── apps/               # App icon sources (.svg)
├── Puraka/                 # Exported theme (ready for installation)
│   ├── scalable/
│   │   └── apps/           # Full-color scalable icons
│   └── symbolic/
│       └── apps/           # Monochrome symbolic icons
├── scripts/
│   └── install.bash        # Local installation script for testing
├── index.theme             # Theme metadata (inherits from Adwaita)
└── LICENSE                 # MIT
```

## Workflow

1. **Design:** Icons are created in Inkscape using the GNOME "App Icon Preview" template. Source files live in `src/apps/`.
2. **Export:** The designer manually exports scalable and symbolic variants via the "App Icon Preview" GNOME app into `Puraka/scalable/apps/` and `Puraka/symbolic/apps/`.
3. **Test:** Run `bash scripts/install.bash` to deploy the theme locally to `$XDG_DATA_HOME/icons/Puraka`.
4. **Iterate:** Refresh GNOME Shell or re-login to see changes.

## For Agents

- **Do not modify files in `Puraka/`** unless explicitly asked. These are exported artifacts.
- **Do not modify SVG files** unless the user specifically requests it. SVG editing happens in Inkscape.
- **Scripts use Bash**, not POSIX sh. The target platform is Fedora/GNOME.
- **Keep automation minimal.** This is a small, personal project—don't over-engineer.

## Icon Naming

Icons are named after their application's desktop entry ID (e.g., `com.brave.Browser.svg`, `org.inkscape.Inkscape.svg`). This follows the freedesktop.org icon naming specification.
