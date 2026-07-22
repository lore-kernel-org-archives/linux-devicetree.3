Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3F224F3
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682113; cv=none; b=WunjOV3DnQiglpn98zpa1pHB/+1SbtDzCUq197RhD65Bf3dpfJ5z/rYB/5xv5dOJO56e5FX3esebz2cEkH921UI+sWiBeD6ENhdZ2LWXgg+IZk845lJ6KCmhFR8LMKZDkjxRO0/3ltrX4uFIWZ0+uK/sVdQFkN8rleQaJxclx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682113; c=relaxed/simple;
	bh=WrAnrZpqyHizyftVuKI2XT/ptOzUaysWn1TOss3eIJs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eCtfqVQilLKYgV+VpkxVE0f0DZ873rCjcydwmDTNAQ15pOLMDXXoWRZ5WWgxJsU8IOFdVLjIlU5d1p6SRf0EYojBksRnZce+IH2VLAdLVOyUwPaFfSq84JlCRsATPlycWKnOV7gwoUHwdM3MavmQYvzIpySvNXFJ3CnrCXPMQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=LNIGs967; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="LNIGs967"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3589591a12.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682110; x=1785286910; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hgdKC97BZWz1MmXAT9iemzQHE6qgv96LAfSHEFvXZBs=;
        b=LNIGs9671PywiA1EVtaJvpp2rVq1+iw7Cv1H5k3BB1MJU3HB3ibRiqpiqhe4Q3zSg6
         +j1SGKWbj4I58Y4Tqvlh1eGZLtHcfdgyyCn/vLuH59ljqsw1CVTAU8Vq/tOwWwJ3NVdK
         R/RcRHQUxzVU+tDiiCz7F7aMNn7ISXKpbTJVC8674kG4h2tMfw56qaQtfxzAcdFqwwiH
         lbtzrVDuJE8oDLueAsnF4pypuzJTF0hFSJ7VHFj1KKJiFPhs29249kNs6kNfGO4h5NMy
         7Z6yjp55G7HYlbTRbTtjsVzRy9QKv+WhaPtMVCTsShd/A5EsnDDFH0ihAgLaj+OPVj6I
         OALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682110; x=1785286910;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hgdKC97BZWz1MmXAT9iemzQHE6qgv96LAfSHEFvXZBs=;
        b=nD//XbfsJqATX0p3xfnoHCdYt4HRYR5ABGLgVfW8vHC7d2uFa/ETPbiZY4MZp0vxZu
         4CKSn4MOBR+rlvHQK21tOyLuu47bPOP57xvzQxLFBLZUXIoEciLg/QarIgkArCXjWQCb
         h8XEhrPB1wlLInXrxfH8t6Jg7KW0Ii5IUPsF367PneEYHjezTvtWeDipVniv9rM0W6tP
         jaDPrTKWaVX/1hbjgRKzbkXnfpJK9RKfqvpwK4J1NIik+epCBKtDcazEm299lB1FMIv7
         cYOR95g5YGtq0n+9ld9Z1E/0maa/u21BOPG7mp8PPnxQyQNGQo55bsXE9IKLeH7GRS4j
         VrNg==
X-Gm-Message-State: AOJu0Yx8cS12CX7UDRWJlGl9GQUYbtCupNrqiqmGqfuj7nFhjauVusn5
	uLCmi/w9ZRq2fWvtrXwww1olNYk+/YhFuUuWvfbN/RBUWPPI778iy+jMJ2hBXzQIuEoRpH7YIVi
	Jt3Ig7J0=
X-Gm-Gg: AR+sD105pocGrLDjdLhvrPOpy/1W8zBKpuoJDeIy5OI6poTkNzMGiECZfvxCO8+EFxF
	smH3KhyxUU3/Jdfjw9Qhigy4BC1uYaeIelLZNhkMc2UB4SBcrPnZj2uchdvNOqDgmKJIkJyTpp/
	W0yVSKk5R4uHoht5IV/kmp1BgVRsCLKqvH925tjw+2Ijwpjrt8A3xYFgxOdyY8sF9yRDy7MwsEh
	2ZIzg+8lpIYPtfz83G8RlsQF7dP8ckpLbtksCNbE8qIp4MPuHA9xCb7byMvPt2o0eqVoxUOBRNB
	wRPR2Uz6P9m6YhY4lBRftU/ZUDgPDWPgcHZ4yv2TgtgYgUZMX/5ZCtEj/zEW5Eplh/jQzxOtpBG
	IN/tgbYuyZSwMk6kgfkEO7mJSWdVCIMcnxFQ9LbcoYGNf5LATU32NMrsBUTouuqgYvVXNelF9Px
	vPSCrX
X-Received: by 2002:a05:6a21:a8d:b0:3c3:7179:a640 with SMTP id adf61e73a8af0-3c3ad5d5738mr22238114637.3.1784682110257;
        Tue, 21 Jul 2026 18:01:50 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:49 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v4 0/6] of: teach overlay code to keep /aliases in sync
Date: Tue, 21 Jul 2026 18:01:45 -0700
Message-Id: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22N0Q6CIBhGX8VxHQ1QkbrqPVoXKL9Ba+DAmM757
 oF1UZuXZ/u+cxYUwBsI6FwsyEM0wTiboDoUqNPS3gEblRgxwjhp6AlbjV2P5dPIgF0E/5Qz5lA
 DUTVnlLUoPQcPvZk26/X24fBqH9CNWZUX2oTR+XnLRpp33wIju4VIMcGsUZKLSiglqouFadRuO
 EqDciKWvxK6LymTpCGEEiZ6YH39J1nX9Q24vk0UDgEAAA==
X-Change-ID: 20260719-nh-of-alias-overlay-6e5e0d56212b
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=18975;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=WrAnrZpqyHizyftVuKI2XT/ptOzUaysWn1TOss3eIJs=;
 b=S/y0IXj6YxXOhl8VXvT8seejxiADwmWYGq49/3QcC5ydeEAyR9n/CmB+TLVJxGEgey1MHtslv
 mISF2XtM/NiBR250ztYzMsOHe9MThiiny05rGtmkoCpeB87oWtSKfrF
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

The core fix (patch 2) is a reconfig notifier that mirrors /aliases
property changes into aliases_lookup. Patch 1 closes a pre-existing
race in the alias path lookup that becomes load-bearing once /aliases
is dynamic. Three smaller overlay-code changes (patches 3-5) fall out
of the same use case: without them, the notifier alone can't actually
resolve overlay-declared aliases.

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

Patch 1 closes a pre-existing race in of_find_node_opts_by_path():
the alias-resolution walk reads of_aliases and iterates its property
list with no lock held and no reference taken — racing property
surgery done under devtree_lock, and the node's own teardown once
/aliases can be created and destroyed at runtime. The walk now runs
under devtree_lock with a reference held across the live-tree lookup.

Patch 2 adds a reconfig notifier that mirrors /aliases property
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

Patch 3 fixes find_target() so an overlay applied with a non-NULL
target base can still reach the DT root via target-path="/foo". The
current code unconditionally concatenates base + target-path via
"%pOF%s", so target-path="/aliases" resolves to "<base>/aliases" and
target-path="/" produces "<base>/" (never a valid node). After this
patch, an empty target-path continues to mean "the target base
itself" — preserving the shape used by drivers/misc/lan966x_pci.c,
the only in-tree caller of of_overlay_fdt_apply() that passes a
non-NULL base — while any non-empty target-path is looked up
absolutely.

Patch 4 converts dup_and_fixup_symbol_prop() to return ERR_PTR so
callers can tell malformed values, not-overlay-internal paths, and
allocation failures apart — /__symbols__ errors stop being reported
as -ENOMEM regardless of cause.

Patch 5 rewrites /aliases property values from the overlay's internal
fragment path ("/<fragment>/__overlay__/...") to the live-tree path
that the node will occupy after apply. The overlay code already does
this for /__symbols__ via dup_and_fixup_symbol_prop(); /aliases uses
the same textual convention and can reuse the same helper. Without
this, patch 2's notifier receives paths that never resolve in the
live tree, so of_alias_get_id() still returns -ENODEV. Values that
don't resolve inside the overlay (legacy string aliases, malformed
junk) are copied verbatim and stay inert — consumers validate before
dereferencing — so no overlay that applied before this series stops
applying.

Patch 6 adds a unittest — overlay_alias.dtso plus
of_unittest_overlay_alias() — that applies an overlay with a
non-NULL target_base, declaring a labeled node under the base and an
`testcase-alias99 = &that-label` entry in DT-root /aliases, then
asserts of_alias_get_id() on the grafted node returns 99 after the
apply and of_alias_get_highest_id() reports the stem gone after the
revert. Missing any one of the three functional patches (notifier /
absolute-target-paths / alias path rewrite) causes the assertion to
fail.

Changes in v4
-------------

Addresses the automated review of v3, plus findings from a local
adversarial review pass over the v4 candidate.

New patch 1:
  - of_find_node_opts_by_path() walked of_aliases' property list with
    no lock and no node reference. Racy against devtree_lock-protected
    property surgery since the walk was introduced, but only reachable
    in practice once overlays can create and destroy /aliases.
    Prerequisite for the DETACH change below.
  - The reader also validates the value's shape (of_alias_value_ok())
    before dereferencing it as a C string — raw of_add_property()
    producers are not validated anywhere — and no longer passes the
    NULL value of an empty alias property to of_find_node_by_path().

Patch 2 (was patch 1):
  - DETACH_NODE now drops the reference taken at ATTACH_NODE after
    clearing the of_aliases pointer under devtree_lock. v3 kept the
    reference to protect lockless readers, but a kept reference
    violates the changeset-destroy contract —
    __of_changeset_entry_destroy() expects refcount 1 — so every
    apply/revert cycle of an /aliases-creating overlay logged
    "ERROR: memory leak" and permanently leaked the node. With the
    reader from patch 1 taking its own reference under devtree_lock,
    the put is safe.
  - The aliases_lookup sweep now runs only when the detached node is
    the tracked of_aliases, so a stray duplicate root node named
    "aliases" can no longer wipe entries backed by the real node; the
    node match is an exact-name compare (of_node_is_aliases()) since
    of_node_name_eq() would also match "aliases@1".
  - The notifier machinery is compiled only for CONFIG_OF_DYNAMIC;
    the of_reconfig_notifier_register() stub returns -EINVAL, so the
    unconditional core_initcall_sync failed on every non-dynamic DT
    kernel.
  - Per-entry teardown factored into __of_alias_del(); shared
    of_node_is_aliases()/of_alias_value_ok() helpers in of_private.h
    replace open-coded copies in base.c and overlay.c.

New patch 4:
  - dup_and_fixup_symbol_prop() returns ERR_PTR, distinguishing
    malformed values (-EINVAL), not-overlay-internal paths (-ENODEV),
    and allocation failure (-ENOMEM) — the discrimination v3's
    "/fragment@" prefix heuristic approximated, and the reason a
    structural failure was previously misreported as -ENOMEM.

Patch 5 (was patch 3):
  - Drop the "/fragment@" prefix heuristic: init_overlay_changeset()
    accepts fragments with any node name, so a hand-named fragment's
    alias would silently stay unrewritten (the bug this series fixes),
    and a live-tree path starting with "/fragment@" would fail apply.
    Discrimination now comes from where the value actually resolves
    (patch 4).
  - Malformed alias values no longer fail the overlay apply with
    -EINVAL; they are admitted verbatim with a warning and stay inert
    (consumers validate before dereferencing). An overlay that applied
    cleanly before this series keeps applying.
  - Exempt pseudo-properties from the /aliases handling: the
    is_pseudo_property() skip at the top of add_changeset_property()
    is gated on target->in_livetree, so a phandle (a raw cell, not a
    C string) of a newly created /aliases node could fail the string
    checks and abort a valid overlay.

Patch 6 (was patch 4):
  - Drop the grafted-node reference before of_overlay_remove();
    holding it across the revert trips the same changeset-destroy
    refcount check (kernel ERROR + leaked node).
  - Assert alias removal via of_alias_get_highest_id() — keyed by
    stem, needs no node reference — with a matching precondition
    check before the apply.
  - Wrap the apply in EXPECT_BEGIN/END for the standard "memory leak
    will occur" warning printed for properties added to a node the
    overlay didn't create.

Patch 3:
  - Document the empty-vs-absolute target-path contract in the
    kernel-doc for @base/@target_base and find_target(); the old text
    predated the semantic change.

Link to v3: https://patch.msgid.link/20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai

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
  - node duplicated by __of_node_dup() leaked in add_changeset_node()
    when of_changeset_attach_node() fails,
  - of_node_put() under devtree_lock (raw spinlock) reaching
    fwnode_links_purge(),
  - lan966x_pci_probe() not reclaiming a populated ovcs_id when
    of_overlay_fdt_apply() fails.

Verification
------------

The OF unittest was run under QEMU (x86_64, OF_UNITTEST=y, v7.2-rc3
plus this series): of_unittest_overlay_alias() passes and the full
run reports 415 passed, 0 failed, with no unexpected "OF: ERROR:"
lines or changeset-destroy refcount complaints in the log. base.c
also builds with CONFIG_OF=y and CONFIG_OF_DYNAMIC=n (the notifier
machinery compiles out).

The series was also backported onto a 7.1-based image and boot-tested
on an x86 Nexthop switch with two PCI-attached Xilinx FPGAs whose
i2c-xiic controllers come from driver-embedded DT overlays applied
with a non-NULL target base. Before this series, i2c bus numbers
auto-assigned regardless of what /aliases said and shifted across
boots depending on which FPGA won the probe race. After: 95 i2c
adapters with /dev/i2c-N numbering matching the overlay aliases
exactly and stable across reboots, sensors reading live telemetry
through mux channels, and dmesg free of WARN/BUG/Oops and unexpected
OF errors. Runtime overlay revert via driver unbind was exercised on
the same hardware: the changeset revert removed all 153 of the
overlay's /aliases entries through the reconfig notifier with no
refcount or of_node_put errors, leaving the other overlay's 12
entries intact. (The revert then hangs in device teardown, in a
pre-existing i2c-xiic i2c_del_adapter() issue unrelated to this
series; the complete apply/revert cycle is covered by the unittest
under QEMU.)

[1] https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/
    Geert Uytterhoeven, "[PATCH/RFC 0/3] of/overlay: Update aliases
    when added or removed", 2015-06-30.
[2] Hervé Codina, "Using Device Tree Overlays to Support Complex PCI
    Devices in Linux", ELCE 2025.
    https://bootlin.com/pub/conferences/2025/elce/codina-pcie-dt-overlay.pdf

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Abdurrahman Hussain (6):
      of: resolve alias-prefixed paths under devtree_lock
      of: incrementally update /aliases lookup on reconfig notifications
      of/overlay: look up absolute target-paths absolutely
      of/overlay: return ERR_PTR from dup_and_fixup_symbol_prop()
      of/overlay: rewrite /aliases path values to live-tree paths
      of: unittest: cover /aliases updates from overlay apply/revert

 drivers/of/base.c                           | 236 ++++++++++++++++++++++------
 drivers/of/device.c                         |   4 +-
 drivers/of/of_private.h                     |  21 +++
 drivers/of/overlay.c                        |  71 +++++----
 drivers/of/unittest-data/Makefile           |   5 +
 drivers/of/unittest-data/overlay_alias.dtso |  25 +++
 drivers/of/unittest.c                       |  73 +++++++++
 7 files changed, 358 insertions(+), 77 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260719-nh-of-alias-overlay-6e5e0d56212b

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

