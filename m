Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD662221F2F
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602342; cv=none; b=iMRhlBWvGPyx5+0JX4SySoJIginMx8ygasbVeXJK2McXqnRjTdPNynjvOw0kbldjgAbCZYWwWaRNc0mjXMS6NUG3oyMBXn/Z3R31pyVONtZQiqGGzLc8HDtLbu1Q08C7oUSeD8zCorHB+Z6NqkGTWrfjq97JLhNyYv/2qCseY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602342; c=relaxed/simple;
	bh=H5Tslx1ixpgR+u23w5e1ms7jHFreC9Irq1KAmnD8eAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JQ782BJB/V/FoXMaRmvObQmxP2tbnXMn6jJW65huiZYEoampXwCWBns8dNBzav8SlkR7QYb0YJs39/HuSOFzo6rkQ7FqCKLjgM6kUhO7jz1sZY/C40g/z8ZFb1DHR0hv034wioQy235s7h+TxgWmI8ZMml07TyZH4q+pCKhgxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=JE2Zzgz4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="JE2Zzgz4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so8193896a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602340; x=1785207140; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xCBq8TyTzgVl3yBDmFYFG3mT7C4DrypobW5M/tpSsXM=;
        b=JE2Zzgz4NE754x3aU8epsjGqAa4yCYGXR8lz5Rb0Me7TPmSeI3TWTLQJEIuzXGs5Pe
         VAj67g1koIyJXHwEdsYThOGebMBHgvA85/9GK4kML2E5l9Vii/oz4muAJAoTY6+gse/A
         A2HfnrJp7nrUCrXJq0tvV0eSQqYbKnnY11yCEfrmCOs921zihbRzluULKeJjtvEeXa7z
         9S5C9LQNXPf17xWGDYcfbEkDVHSNigGim8401bN6CNrzDduLw7dcn4bmLbLsIACo0V18
         yv2nEtGyYUaM/NqJo46rIEVITJHo3GVAnokkHZ2e+QYM+GXdPHPwzKqKczDsAWzS+5l7
         AuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602340; x=1785207140;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xCBq8TyTzgVl3yBDmFYFG3mT7C4DrypobW5M/tpSsXM=;
        b=XDrOeTYkhfznxzPdKaXF76cAJKTpng6wsNtEN2s4/y3kjKgu7KwcqR8kCNO4cuP2/F
         ZoEJ9QBzJ+WKbPEn4b0onyZ93Li4G3dudltE640SnIAzApJB3YsiQ27g3aG1dpvi8s4T
         q/NYiIcYxstt06zSik5PIQ/uDzJFWXLgjP4cBNfQSsB60so0xSefgnTeVvnFBRpQIYx0
         iVnHZwWl5ZguX+vGmBybmJrTAjFB89N8any52wngm8Ciun8pQfkuUxH2RXUXYe17tBxi
         pKr7KRppvXtJt7zRAipq2ENBCMD155SGGzvsx0zexjpq0wANf6ILFALR+YKqMxZRkdaC
         OMqg==
X-Gm-Message-State: AOJu0YztAjKN5b/OsL2onxeV24rdbvQuNvVZBekPPVE7qjHS0r8SAo9H
	re8NZa8hlxGPELbLY157xd0JdjAoUKMV7bhZmhSHa9wGtKVE3mx253Zku4HSjrTSu++iGHeDHBO
	H0pQH4Vw=
X-Gm-Gg: AfdE7ckzGfQmzssLWP8ItBw/mulkpFgMJWaquYnhtjRUqJ/BYZ2DC6LeP4zkPz0Qjpr
	7JnHkOm2MHyW2AR3O9GGW94Qcjwuqf25wD92yhOHYS3n1xXRAUjcRNT+MQfxO+4LZf08vLsucU5
	jQ/9+1mRbZPj+NfURHU+n8KYZ6a9SoYHD3uZNYLIdkqYa93+PkCHWfgMDWjcBDD2ZD7M0J3vWoK
	luqHzYZqSxzo6+5N+1fdk1O+zEk0wbppRnv+Ib2868/VztcUFIGDVR+Lh158WqgRtu7N7HBtZJJ
	Ka/8u1srROoGiQ5/AnYPGdv6Cq/t8y1tprd1+vCKLS2grBkF0PTDTlh5GW+dp0td49d4EdrdgQP
	dpUa/uSeUtb0aihWv0XY/yw/mALGG7umqsCUkwyy8RtlcGzje0lNLEFk+DuuRGAfX1OSSHkt2pq
	OoetMX
X-Received: by 2002:a05:6a21:6b83:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3c3ad78707dmr18275253637.5.1784602340159;
        Mon, 20 Jul 2026 19:52:20 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41167294eec.24.2026.07.20.19.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:52:19 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH RFC 0/4] of: teach overlay code to keep /aliases in sync
Date: Mon, 20 Jul 2026 19:52:14 -0700
Message-Id: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCMBAFf6Xs2YUk0IheBT/Aq3hI21e7UhLJa
 mkp/XejHmdgZiVFFigdq5UyJlFJsYDdVdQOId7B0hUmZ5w3e3vgOHDqOYwSlNOEPIaFPWqYrvb
 OuoZK+czoZf5dr3Q5n+j2l/puHmhf3x9t2wf32PvJfAAAAA==
X-Change-ID: 20260719-nh-of-alias-overlay-6e5e0d56212b
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784602339; l=8364;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=H5Tslx1ixpgR+u23w5e1ms7jHFreC9Irq1KAmnD8eAE=;
 b=4s6aMinkP7UkpLdtlKsmpdH2aRZE7X1FNzgjLOV7Ua+OVX24BoBE3PK9IdV5nz25WcBGQs1L/
 ofqxAYyQztLDDdkNKnFg1xxHkKg1yXgiau8qKbsuxc6guFel1SgKldw
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
serialize on a dedicated mutex.

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

Changes in v2
-------------

Addresses the automated review of the RFC posting.

Patch 1:
  - Guard rd->old_prop before dereferencing in the UPDATE_PROPERTY
    handler; some notifier producers pass NULL.
  - Handle OF_RECONFIG_ATTACH_NODE and OF_RECONFIG_DETACH_NODE for
    /aliases nodes attached or detached with pre-populated properties;
    scan (or purge) each property so per-property ADD/REMOVE events
    aren't required.
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
    when the value looks like a fragment-internal path (non-empty,
    null-terminated, "/fragment@" prefix). Other alias values pass
    through the raw duplicator unchanged. This removes the previous
    unconditional fallback that would silently propagate a raw dup on
    ENOMEM, and also stops the notifier from ever seeing malformed
    values through this path.

Patch 4:
  - Rewrite the .dtso to actually exercise all three functional
    patches: a labeled node under a fragment with target-path="" plus
    an /aliases fragment with target-path="/aliases" (absolute) and
    a value referencing the label via `&`. The RFC test bypassed
    patches 2 and 3.
  - Rewrite the runner to call of_overlay_fdt_apply() directly with a
    non-NULL target_base, look up the grafted node by its post-apply
    live-tree path, and assert against it.

Open items
----------

None outstanding. Pre-existing issues surfaced by the automated review
(overlay-changeset leak paths, of_node_put()-under-devtree_lock, the
lan966x_pci_probe cleanup gap) are unrelated to this series and are
being tracked separately.

Verification
------------

Series was applied to v7.2-rc3 and boot-tested on an x86 platform
with two PCI-attached Xilinx FPGAs whose i2c-xiic controllers come
from driver-embedded DT overlays. Before this series, i2c bus
numbers auto-assigned regardless of what /aliases said and shifted
across boots depending on which FPGA won the probe race. After: 89
adapters, `/dev/i2c-N` numbering matches the overlay aliases exactly
and is stable across reboots, `sensors` reads live telemetry through
mux channels, and dmesg is free of WARN/BUG/Oops. Patch 4's unittest
passes.

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

 drivers/of/base.c                           | 271 ++++++++++++++++++++++++----
 drivers/of/of_private.h                     |   7 +
 drivers/of/overlay.c                        |  61 +++++--
 drivers/of/unittest-data/Makefile           |   2 +
 drivers/of/unittest-data/overlay_alias.dtso |  36 ++++
 drivers/of/unittest.c                       |  74 ++++++++
 6 files changed, 393 insertions(+), 58 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260719-nh-of-alias-overlay-6e5e0d56212b

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

