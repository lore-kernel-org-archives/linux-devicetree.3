Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607B3B994F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669800; cv=none; b=YGTCc9Mk0Jy3+PcmTH5bOiKSYY9+mCFDUnwFwIsRr9Y2x3kCSvGHXSvIaY+ZZ50pjyf9JWwwmbZ4tzitbjMMorc4ioHcmNmdFdYh8d09wrxoTGkUaC6PmRcm9ckeaLf5pAc65SEnBUBT6ran67QnOo3b+epY0ts+vAXEfPuT8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669800; c=relaxed/simple;
	bh=3sNJ4HH84fPJLClgJcDYZNeSmxrda8qXOEdeYojmvUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YXh/5gJAtrt8M5xGBy6gfU4kLldkmIKxzmlLtob0L2JHN0pJxeJqfsmeSz6r2EcaHDx4MS/gAaUdayq5loyezfwHiz8fNBStl9jKVFSaVp2JzVGMLHRzDdKICSZ3y14duM+uxO9rhK0g0A/dnC3dtzk817+jKhntvEfRD1SLrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=aY043nQG; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="aY043nQG"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c999f162c9aso7483381a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784669797; x=1785274597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPFc2y+0YsV0+80+A6BH84D56jNoU7lpdpaQdrDVQjA=;
        b=aY043nQGVJcDljzVcGqjpgC53qd4reO3zp7Kr99G6riqk5BsDl7atGjiVNtSCnv2qR
         WdAYnGfY/LHwVEsgFskEz6usXPgrzeF4MtRXXB+tbCNELZBiqp2Oqs9FHK1+ymZsHjoo
         M3mg4Fw8/Lgpo0nPTYs/sTkYi5w0KV1jdyhuZ0NKMP5RNJPdhfUUWF6HrJcZmsvGRFQ2
         KIi8JqUYMd/TxeiZCGgL3Edob3cnYjjtiPHYXPFnPM8ZdX+xvwbqy4iJneEnMsg4j/Uv
         bHsYLqeoeTVb/FLQspFisa+oHPkNvtXCfFMXhpjSLuEQB7itbdwHmyi5X4VLgLq0V3++
         4+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669797; x=1785274597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SPFc2y+0YsV0+80+A6BH84D56jNoU7lpdpaQdrDVQjA=;
        b=XJZMXO6/mWI+5XjFiwTWkPfA/lNkcauh0YlyoX34NrI5qIkO+EbuV7yLAP8qnPX78/
         K3OqVuT6d/Ts6AC9dAosBLkA6SD8trUdqnZaDQaGM6mdDSDDF6mVVb0C41lWq+jVPA4B
         mE8A6axOEBZb9+iYpy41oTpshvOtHiwu986czU43757GKH7grDnqvabNgx9YkpOFdy6S
         AwGwVil9Ch5JukBXyHfJtlfUlCudapEiDr+VU3VFy5LdkV6GNafXckB67CZ1GLAHO2RS
         ABuGMq26DDSANfpdASkggec/EDYGPvNAEgkRd7JtCvSJ1OTyeDuH3yDZiJ38StNLlM62
         KScg==
X-Gm-Message-State: AOJu0YzLacCf4/x8CP4zWE+3GOR/Scqv2oCcPEzFuXi+APMkF3KxkgEE
	XjwRL+J4YG4Rm2cObKEv+slrciGqMvVceCein5fSny4mqMtCX546NZsaiBpKxQmTJSXASKd7/CV
	PdrYUWqw=
X-Gm-Gg: AR+sD12FAffhjzU0zF2gqeLnkq5P7bFnEHbQFCbbA0rI+p//8xN7R37p9kYcXLs2nU3
	YgnRDnwNcUrjIvv1dBu+KRrmgF+LDGcn1+NbYtSbLqrrqlSGypQrIEU8em3hMKUeM8hMyve7VIR
	cpdPYDLRresjKFXHpbX56EMRw2Pw/TzoTdUuqtQCQNpxQ7YYGc4vAigbACbI+9R+MjVchsLKsDk
	qLQpWKfpQcBda5fKefUhQ50NGSWtO2Wd/enDcE8I04OYmNiXIsmOXMWOI5Urt+nK3KhKAMP21iY
	exi+73trz0Qz+kqzoZGLfPcUAPTC6OfYloLQNzaKL0okiKH1o5TQx35xcxBWMxtWyZs3/qlbz3H
	gNbTH6swpXX7Wpn/YJm9Xq+/ulIOiSfQJGhesmyL6Q2ZX2m3ZpEENby3GFd8b5GlywydAW69Cnq
	ZkmLSOgHQiz+FOED0=
X-Received: by 2002:a05:6a21:1f8d:b0:3c3:68a5:50b3 with SMTP id adf61e73a8af0-3c3ad9d9809mr22925593637.57.1784669797264;
        Tue, 21 Jul 2026 14:36:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm40706521c88.9.2026.07.21.14.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/4] of: teach overlay code to keep /aliases in sync
Date: Tue, 21 Jul 2026 14:36:31 -0700
Message-Id: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBAFf4X07Jq2QkFP/ofhUOhi15CWtNhAC
 P8uoEePk7w3s7CIgTCyW7awgIkiebfB5ZSx1mr3RCCzMZNcKl6KKzgLvgPdk47gE4Zez6CwQG4
 KJYVs2PYcAnY0HdZH/eX4bl7YjrtqX1iKow/zkU1i3/0Kkv8tJAEcZGm0qvLKmCq/O5xG64ezJ
 lav6/oBrB2raskAAAA=
X-Change-ID: 20260719-nh-of-alias-overlay-6e5e0d56212b
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784669796; l=12855;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3sNJ4HH84fPJLClgJcDYZNeSmxrda8qXOEdeYojmvUg=;
 b=V3CeHmhwKNXo/HBOBIM+aSYL+qHwyUl+9hWV1BGeLYOzbT3ss8Nbmhm81F4pPyvDSSno1S74G
 ICicf/cl/xID/srVj6S8JA8OePRmbr46kwjhbSFKIbRAwpwCtlaEL/S
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

/aliases entries added by a device-tree overlay are stored in the live
tree but never enter the global aliases_lookup list that of_alias_scan()
builds at boot. As a result, of_alias_get_id() returns -ENODEV for
aliases declared inside overlays, and any driver that relies on
alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
pinned id and falls back to auto-assignment.

The gap has been public since 2015 [1] and reproduces trivially: apply
an overlay that declares e.g. `i2c99 = &foo;`, ask
of_alias_get_id(foo, "i2c") -> -ENODEV. Bootlin's ELCE 2025 talk on
PCI DT overlays [2] enumerates "i2c muxes" as one of the subsystems
broken by dynamic overlays; alias pinning is the underlying cause.

The core fix (patch 1) is a reconfig notifier that mirrors /aliases
property changes into aliases_lookup. Two smaller overlay-code fixes
(patches 2 and 3) fall out of the same use case: without them, the
notifier alone can't actually resolve overlay-declared aliases.

Prior art
---------

Geert Uytterhoeven posted a 3-patch RFC in June 2015 [1] with the same
alias-tracking design shape. Grant Likely reviewed positively; merge
was gated on missing unittests and an object-lifetime concern the
author self-flagged, and the series was never reposted as non-RFC. Ten
years later, drivers/of/overlay.c still contains zero references to
aliases, of_alias_scan, or aliases_lookup.

Series contents
---------------

Patch 1 adds a reconfig notifier that mirrors /aliases property
changes into aliases_lookup. It also refactors of_alias_scan()'s
per-property body into a helper of_alias_create() shared by the
boot-time scan and the runtime notifier. A one-bit `owned` flag on
struct alias_prop distinguishes kmalloc'd (overlay-time) entries
(kstrdup'd alias name, of_node_get'd target) from memblock-backed
(boot-time) ones so the remove path can't kfree the wrong storage.
The notifier keys off structural properties of the target node
(name + root-parent) rather than the of_aliases global, so overlays
that create /aliases from scratch on a system without a boot-time
aliases node are covered too. All aliases_lookup readers and writers
serialize on a dedicated aliases_mutex.

Patch 2 fixes find_target() so an overlay applied with a non-NULL
target base can still reach the DT root via target-path="/foo". The
current code unconditionally concatenates base + target-path via
"%pOF%s", so target-path="/aliases" resolves to "<base>/aliases" and
target-path="/" produces "<base>/" (never a valid node). After this
patch, an empty target-path continues to mean "the target base
itself" — preserving the shape used by drivers/misc/lan966x_pci.c,
the only in-tree caller of of_overlay_fdt_apply() that passes a
non-NULL base — while any non-empty target-path is looked up
absolutely.

Patch 3 rewrites /aliases property values from the overlay's internal
fragment path ("/fragment@N/__overlay__/...") to the live-tree path
that the node will occupy after apply. The overlay code already does
this for /__symbols__ via dup_and_fixup_symbol_prop(); /aliases uses
the same textual convention and can reuse the same helper. Without
this, patch 1's notifier receives paths that never resolve in the
live tree, so of_alias_get_id() still returns -ENODEV.

Patch 4 adds a unittest — overlay_alias.dtso plus
of_unittest_overlay_alias() — that applies an overlay with a
non-NULL target_base, declaring a labeled node under the base and an
`testcase-alias99 = &that-label` entry in DT-root /aliases, then
asserts of_alias_get_id() flips from -ENODEV to 99 across the apply,
and back to -ENODEV across the revert. Missing any one of the three
functional patches (notifier / absolute-target-paths / alias path
rewrite) causes the assertion to fail.

Changes in v3
-------------

Addresses the automated review of v2.

Patch 1:
  - of_device_uevent() in drivers/of/device.c now walks aliases_lookup
    under aliases_mutex; the previous of_mutex path could race with
    the reconfig notifier that mutates under aliases_mutex.
  - Drop the defensive ATTACH_NODE property scan. Overlay attach
    queues each property as a separate ADD_PROPERTY changeset entry,
    so per-property notifications cover the case that matters;
    walking rd->dn->properties without devtree_lock could race with
    concurrent DT mutations. A direct of_attach_node() caller that
    pre-populates /aliases loses tracking for those entries, matching
    pre-series behavior.
  - Replace DETACH_NODE's per-property forget with a single scan of
    aliases_lookup itself (same rationale). Boot-time entries are
    unlinked; memblock-backed struct + alias name are not freed.
  - of_alias_destroy() now of_node_puts() the target for every
    matching entry, closing a leak of the reference
    of_find_node_by_path() took at of_alias_scan() time for boot-time
    entries.

Patch 3:
  - Enforce non-empty + null-terminated-within-pp->length up-front
    for every /aliases property value. Values that don't match
    "/fragment@" now flow through __of_prop_dup() only after that
    validation, closing a pre-existing hole where a malformed alias
    value could reach the live tree.

Patch 4:
  - Hold a reference on the grafted target node across the revert
    so the post-remove assertion queries the right np, not the
    base. of_alias_get_id(base, ...) would trivially return -ENODEV
    regardless of whether removal actually cleaned up the alias.
  - On of_overlay_fdt_apply() failure, reclaim the (possibly
    partially-populated) ovcs_id via of_overlay_remove() to avoid
    leaking the unflattened FDT and partially-applied nodes.

Additional fixes from local review of the v3 candidate:

All patches:
  - Trim inline comments to the constraint being enforced; rationale
    and use-case narrative moved to the commit messages.

Patch 1:
  - of_alias_create() releases the target-node reference on every
    error path, not only for owned entries — restoring the original
    of_alias_scan() error behavior for boot-time entries.
  - Correct the struct alias_prop @owned kernel-doc: every entry holds
    a reference on @np (removal drops it regardless of @owned); the
    flag only selects whether the struct and alias name are kfree()d.
  - Correct the notifier-registration comment and commit message:
    of_alias_scan() runs pre-initcall from unflatten_device_tree() /
    of_pdt_build_devicetree(), not from of_core_init().
  - DETACH_NODE clears the of_aliases pointer but keeps the reference
    taken at ATTACH_NODE: of_find_node_opts_by_path() reads of_aliases
    and walks its properties locklessly, so the node must outlive any
    concurrent reader.
  - Call out (in the commit message) the pre-existing one-byte OOB
    read in the stem parser that the refactor fixes: isdigit() was
    tested before the end > start bound.

Patch 3:
  - Correct the commit-message claim that a NULL return from
    dup_and_fixup_symbol_prop() can only mean -ENOMEM; unresolvable
    fragment paths also return NULL and are reported as -ENOMEM,
    matching the existing /__symbols__ handling.

Patch 4:
  - Fix the .dtso label: dtc labels cannot contain hyphens, so
    testcase-target failed to compile. Now testcase_target.
  - Do not add overlay_alias.dtbo to the fdtoverlay static build
    test: fdtoverlay cannot resolve the empty (base-relative)
    target-path, so static_test_1.dtb would fail to build.
  - Drop the unnecessary #address-cells/#size-cells from the grafted
    node (dtc W=1 avoid_unnecessary_addr_size).

Changes in v2
-------------

Addressed the automated review of the RFC posting.

Patch 1:
  - Guard rd->old_prop before dereferencing in the UPDATE_PROPERTY
    handler; some notifier producers pass NULL.
  - Handle OF_RECONFIG_ATTACH_NODE and OF_RECONFIG_DETACH_NODE for
    /aliases nodes attached or detached with pre-populated properties.
    (v3 pared this back — see above.)
  - Serialize aliases_lookup with a dedicated aliases_mutex; readers
    (of_alias_get_id, of_alias_get_highest_id) and the reconfig
    notifier both hold it. Boot-time of_alias_scan() stays lockless
    (single-threaded during init).
  - Destroy path unlinks matching entries irrespective of ownership
    (freeing storage only for owned ones), so an overlay UPDATE
    against a boot-time alias no longer leaves duplicate stem+id
    entries in aliases_lookup.
  - Owned entries kstrdup the alias name and hold an of_node_get()
    reference on the target — released in the destroy path — so a
    property freed by overlay revert can't dangle into aliases_lookup.
  - of_aliases is refcounted lazily on ATTACH/DETACH.
  - Validate pp->value is non-empty and null-terminated within
    pp->length before feeding it to of_find_node_by_path() — prevents
    a stray malformed alias entry from causing an OOB read.

Patch 3:
  - Only route /aliases properties through dup_and_fixup_symbol_prop()
    when the value looks like a fragment-internal path. Other alias
    values pass through the raw duplicator unchanged. This removes
    the previous unconditional fallback that would silently propagate
    a raw dup on ENOMEM.

Patch 4:
  - Rewrite the .dtso to actually exercise all three functional
    patches: a labeled node under a fragment with target-path="" plus
    an /aliases fragment with target-path="/aliases" (absolute) and
    a value referencing the label via `&`. The RFC test bypassed
    patches 2 and 3.
  - Rewrite the runner to call of_overlay_fdt_apply() directly with a
    non-NULL target_base and assert against the grafted node's np.

Link to v1: https://patch.msgid.link/20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai

Open items
----------

None outstanding. Pre-existing issues surfaced by the automated review
are unrelated to this series and are being tracked separately:
  - fragment target/overlay refcount leak on init_overlay_changeset()
    error paths (ovcs->count still 0 when free_overlay_changeset()
    runs),
  - deadprops double-free in add_changeset_property() when
    of_changeset_add_property() fails after the property was linked
    into target->np->deadprops,
  - of_node_put() under devtree_lock (raw spinlock) reaching
    fwnode_links_purge(),
  - lan966x_pci_probe() not reclaiming a populated ovcs_id when
    of_overlay_fdt_apply() fails.

Verification
------------

Series was applied to v7.2-rc3 and boot-tested on an x86 platform
with two PCI-attached Xilinx FPGAs whose i2c-xiic controllers come
from driver-embedded DT overlays. Before this series, i2c bus
numbers auto-assigned regardless of what /aliases said and shifted
across boots depending on which FPGA won the probe race. After: 89
adapters, `/dev/i2c-N` numbering matches the overlay aliases exactly
and is stable across reboots, `sensors` reads live telemetry through
mux channels, and dmesg is free of WARN/BUG/Oops.

The unittest was verified on the same platform with OF_UNITTEST=y:
of_unittest_overlay_alias() passes; the full run reports 426 passed,
2 failed, both environmental (of_unittest_pci_node() requires QEMU's
pci-testdev, and of_unittest_overlay_gpio()'s probe-count assertion
trips over unrelated deferred probes on this PCI-heavy x86 box).

[1] https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/
    Geert Uytterhoeven, "[PATCH/RFC 0/3] of/overlay: Update aliases
    when added or removed", 2015-06-30.
[2] Hervé Codina, "Using Device Tree Overlays to Support Complex PCI
    Devices in Linux", ELCE 2025.
    https://bootlin.com/pub/conferences/2025/elce/codina-pcie-dt-overlay.pdf

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (4):
      of: incrementally update /aliases lookup on reconfig notifications
      of/overlay: look up absolute target-paths absolutely
      of/overlay: rewrite /aliases path values to live-tree paths
      of: unittest: cover /aliases updates from overlay apply/revert

 drivers/of/base.c                           | 200 ++++++++++++++++++++++------
 drivers/of/device.c                         |   4 +-
 drivers/of/of_private.h                     |   7 +
 drivers/of/overlay.c                        |  41 +++---
 drivers/of/unittest-data/Makefile           |   5 +
 drivers/of/unittest-data/overlay_alias.dtso |  25 ++++
 drivers/of/unittest.c                       |  64 +++++++++
 7 files changed, 286 insertions(+), 60 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260719-nh-of-alias-overlay-6e5e0d56212b

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

