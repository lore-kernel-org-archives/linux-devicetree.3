Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CA3B440E
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531001; cv=none; b=Nb77LHIPkvVnUIIcTq9lpImSSOSKVjWmt8mx76Dm4I6055siO1+P4NZbufot0lQCcD79Wh8uomRPhM5xcLyuvlfX70Mp0SEzcgqiYnE0Ql1Qv10ztJO+Bp0t/33FyE+H0gBVYK2TUTFusGCpGiHF8LgWbNPpBR785nqimuOlEwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531001; c=relaxed/simple;
	bh=dB+Br3KZMLKw1gh1AZW7OoM38ATCJuhb7hLCWJ1x4pQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qi0lBWSeOGysyIsSiTWVWzFVcVKMWmudYzAAE7O6l34KVRxGwFu0qilVvHbHZKNtdE/jALmmiNJKIXw6TeQ4TK9jLVW1MEj8WjUsmNjOHCUHP7XfWy0NwUTYPnvCiGM9ppCH+1Rx7XfxAsVzz05dJShNqvUXDn2Hertv+1QbKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=YQnB+k0m; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="YQnB+k0m"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso5936095a91.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784530998; x=1785135798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QqDmnVyu5NzHROdGFRMLIVlOTZRX3xeZ1j4XDccFCoQ=;
        b=YQnB+k0msXLuT5jfH7MUroP435jAJPrrDq4R4XkXX7kmhKCJmT1N6Aa9NIyJmEv4tv
         Sd0r15sgRa9xEC1VuHe/eyp3C1cW0dXkDPHNusjfe+JyMDie+/YnuFrCXQMEjHVNk786
         b0m7y+ytEBTdCbFZhQXtYeRKJGrDaWuDU09yPyIVpCu5tPJwE2QZGZ2U+7oIhvU+MZAm
         q9j0rGOkbX0lLoUuBoAhdsZ4IRR9jHlxy8mhl/jy4HfppDotLIK4vUXOexzL4+Kaszau
         Iq2p0FjPI7eTzK7xY9nHv08Pk1POtFuvyNsdNabQXtd+mSJoI5pFXiwjEKCQ6vrZGcpy
         Jpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784530998; x=1785135798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QqDmnVyu5NzHROdGFRMLIVlOTZRX3xeZ1j4XDccFCoQ=;
        b=LXBwhTLFxgxWPjZ54GiF4+ev7J7MR7dcjqrZU5P/FnAJI3EwsF4Jhb13rnEnvw462Z
         owMW8vjLaMDHdeI4WzE62xPx61w9fBfO9Iy8oymW7yvsZ58tVBkhjvYxxSYUbGMijuVC
         dWS/Vt9PrLrcJ7OavfQQZaYd+vzG+6CmPdfwti3oV5PCcZFem+KPOIaIz8q+k3ISbplt
         /XfTsXORx8+M1dHnvCkYfRU6B+e+XD3mjLHTn3arsfYSB+MRLao3kr6ZwFYMpFvmw7iC
         M66/hIpYAnxk/zqH3ksx5v1r5rgKnsiAIbKb3ByX75iqLc/1wW0wDOs7u9HBDiZ/bHt7
         fpfQ==
X-Gm-Message-State: AOJu0Yy9mDgFmhrUfMyPNDvmHuFutDB1fuJqjdoKwnSx3jkCKciEIiRm
	OqaU3ljnhLiZdboLRE88YYKK779bzUjjcUocdYut5j7j0xW1uQ3zQNwFYPauHcp2RFVr456iqKd
	GuxG0GnM=
X-Gm-Gg: AfdE7clNPorXoWvZjZuoujOtykbaTLSsbVtct/N0+wp+pLQSOglYL0ygnL4hsuCTcf0
	zCK1pePjQoH/TeCAqbJ4VvZRUFP5HauWU/Vn2jRo+7ZsKvQYENiOD84HKlNiHai9D1ndDTvKhFf
	kQGCncbnd5EFTVemDeufzZ2avbU1EOVy17Fvdhv6riG6WZW7yOBKVpmvsgpeUJ88nKVJ42jU+uw
	drNb99h5jKuM1zsWlVMSbTHRZieVNvFqfa3cuYxVHtSA/Yg/EYU6zf/Q1ggqgIEKYN/5XQCpH5M
	XTBbUZeZ3UpGe/vIURKj3NqJ5/5ZZGsRFZlgi6t4DF0gq8e+bosHy6HI1NQxu1MYeBfgmG19D+E
	fUz0BlWPJQsbwNXjyifZccYCMrZmy+517GTy9dJR6gkRsJbqaaOKjgijCDKdpqdzNLXxX6ixaI4
	eTCz22
X-Received: by 2002:a17:90b:2f0c:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38e4b447dfcmr14118332a91.10.1784530998162;
        Mon, 20 Jul 2026 00:03:18 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm463052a91.4.2026.07.20.00.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:03:17 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH RFC 0/4] of: teach overlay code to keep /aliases in sync
Date: Mon, 20 Jul 2026 00:02:49 -0700
Message-Id: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784530997; l=6201;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=dB+Br3KZMLKw1gh1AZW7OoM38ATCJuhb7hLCWJ1x4pQ=;
 b=Z7iZYlq5MaeEgFzCDP1jt0lsNuvHEZU3ghaQvsqOCpI/8wEbzIL9oYFs2mOjhoJJc3LiMWJvm
 aJ0Nb3u17hRCor4fkuR0WTR+GubUkJaj6DRkw7D0IgNqvDKlPzfvkaV
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
struct alias_prop distinguishes kmalloc'd (overlay-time) entries from
memblock-backed (boot-time) ones so the remove path can't kfree the
wrong storage — addressing the lifetime concern that stopped Geert in
2015. The notifier keys off structural properties of the target node
(name + root-parent) rather than the of_aliases global, so overlays
that create /aliases from scratch on a system without a boot-time
aliases node are covered too.

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
of_unittest_overlay_alias() — that applies an overlay declaring
`testcase-alias99` under /aliases and asserts of_alias_get_id() flips
from -ENODEV to 99 across the apply, and back to -ENODEV across the
revert.

Open items — feedback wanted before v1
--------------------------------------

Locking. of_alias_get_id() traverses aliases_lookup without a lock,
which was safe when the list was populated once at boot. Runtime
add/remove requires synchronization; this series does NOT yet add
any. Options:

  (a) protect aliases_lookup with a spinlock (simple, sheds the
      lockless-lookup contract);
  (b) convert to list_head_rcu + synchronize_rcu on remove (keeps
      lookup lockless, more churn);
  (c) piggyback on of_mutex — but of_alias_get_id() is called from
      driver probe context, so grabbing of_mutex there risks lock
      inversion.

Currently leaning (b); happy to be talked out of it.

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

 drivers/of/base.c                           | 184 ++++++++++++++++++++++------
 drivers/of/of_private.h                     |   7 ++
 drivers/of/overlay.c                        |  47 ++++---
 drivers/of/unittest-data/Makefile           |   2 +
 drivers/of/unittest-data/overlay_alias.dtso |   9 ++
 drivers/of/unittest.c                       |  51 ++++++++
 6 files changed, 246 insertions(+), 54 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260719-nh-of-alias-overlay-6e5e0d56212b

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

