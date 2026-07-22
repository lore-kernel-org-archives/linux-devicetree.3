Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E83612E0
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682117; cv=none; b=XgW8W1HZqGs0RO5xDpsxw5qoBamdsEt5KTOW+7iHvHjkul/JKTi8y/HJ/9XG065Mv4VKK9p+o2Dw1ll+RUI4rk4qSlFrbRMaU7ctGIrq4fHKB/KlfVSv8czoirlfyxs6/ZeF5f+IE9vilbenjnMnpLcbFE5ACLbmyK7Rna4VFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682117; c=relaxed/simple;
	bh=NsciQdatXqeOPpuwIMMAyLF5F/k5idos/u5g0AxozaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezwQNgqnGWiMVS13v4oGEb3y0P5UtiDtbSf72cfRzVLDjoG3FJukr5mjr0aU4w6bT0myMhIOhM6Tr47UV+9eQoc19t5ym1EnWKRTNwwUWxmgdCs4iN18dYQFKJA7d++o3ak/v+c/5PNbFOBwhWQCrZi4V7XwnMSjilEZCwORYHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Y3cmhnX+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Y3cmhnX+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca957432c7fso8123844a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682112; x=1785286912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqKZ9pnnu0wAEnhjYKp829PY9NFFmDyTcpIAgN2Ex7I=;
        b=Y3cmhnX+vsdkESegwcDK7m0bjIBJhXG4BpWAckk6xgoHF8/DTPMCikxKCshkZLD2aU
         dss3wjVB6JRwE3LpQ5aPl+IXnFcWAfzfJVnb6v4F1++3qKlRpKTjpbsO6vG+pNVkw47P
         +E32iN4hQKsjS2CJSoRDuTe+dbwtX/t3R/4p2HQr81UXYc+jxM5havcIfFLItudmdtts
         yWSNXdXPReXt76MJAypoKJOMIlAx2X2TjI0tG4bMHke0MdSXQODmvveFddh4+2aQcs4U
         4EyaUDm3eEBOJdQGyeov8ITs39KO/amRXLtfJYFcx1u03OYvB9Y2LTmKt6fazzbJeqkw
         B1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682112; x=1785286912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqKZ9pnnu0wAEnhjYKp829PY9NFFmDyTcpIAgN2Ex7I=;
        b=FUxmDI1XiLsoB7etAkkoCIoRcJ9bpnnPo45MOgU+jUd3GK0GtyNKaxCkEm1lyd0dzk
         ACgPZAQ9SbtldBKtzU4BDTdxfzTVo5bH4knNL8GX/IKCo/iG5rYJVT00ADVlP4NyHwct
         HEerrJoKc5wNM9ooM6tDp3cory6ELKIivZy3NTfZzrOr7fO8wbg7GWwfAtB/QrsRgzDi
         p4IqfWh0eZCPHo1xsAJgRhklCBp83xjy3iHBZwbmOUIriApI4HXPsm7abKhiiLNgvqFQ
         2Ew1V3B42Or+jMXTKXivRdRqB8V/C1jdGI6BLPRR+J1fINbJxBpJxcXABliTW3tN2Ohd
         uOxQ==
X-Gm-Message-State: AOJu0YwvUzulHKkl20DNfkV9TjbWhtQy4zeqxTnM0CN+ve7oPHscaY7D
	4T7FMrEHaY8c0FZ8Jpz5lPxfyTR/JLwANE2tKZTbxKyATj9rs9MSh1rW8bUQX167tynZO6nMr0q
	b5BuFbQE=
X-Gm-Gg: AR+sD12QHVu9xbPSP1/Lc13e66YKKhMCc6XTXVhB7ZgJs86vTk1Qlq9fscx6skSpHPe
	3emGfvkwaSR77BfJAKT24ts7O2UVJGS97I60TCLasBAcdOdlWbue6IMnZ12m6lUTVV3KduqK9m5
	Ivrqjpn4qhzMe62W7TD+1M4+xjGn0tmH2vKB/jOFsdyYaftYs98EW61meKoAY/bwW6sKy5qK1/H
	dH4s6L+iI6VjsU6qxQVRgJwu5gqaRqgtfRCoR1HUCxC6wyaGP3Wmz8jNB0oq5/h5PkDdpZkbKI3
	bkAT2a0SdrW5n3VmaGqgqBxNwIVO1944+uBbmPb9I0inJDeOkAb0G5XD30y9dVf0gJK2N6xLWAJ
	CYi/8jnRu+GSBBCyU7fmLyotZbTSDCKDWWzTRwm06WVbeAdn6s5UKWQAjUwFlLrCCs/HKtUV2j6
	Zk5MKWKBL55AfbMRU=
X-Received: by 2002:a05:6a21:103:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3c3ad677d8amr21968632637.28.1784682112093;
        Tue, 21 Jul 2026 18:01:52 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:51 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:47 -0700
Subject: [PATCH v4 2/6] of: incrementally update /aliases lookup on
 reconfig notifications
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v4-2-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=16428;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=NsciQdatXqeOPpuwIMMAyLF5F/k5idos/u5g0AxozaI=;
 b=fwbycA8K5x4SsHjbWNQV+b8/Wc2FFMlUo/OYNpG6n0QycG9yzGqXQISaXRyeKBfjmCY8PorMW
 nDm4VxzHZ+cBsmm69SNvjptwW5RYWoO3zqSWjdXywV+pdLDcmTHRn0j
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

/aliases entries added by a device-tree overlay are stored in the live
tree but never enter the global aliases_lookup list that of_alias_scan()
builds at boot. As a result, of_alias_get_id() returns -ENODEV for
aliases declared inside overlays, and any driver that relies on
alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
pinned id and falls back to auto-assignment.

Fix by registering an internal OF reconfig notifier that mirrors
/aliases changes into aliases_lookup. Registration happens at
core_initcall_sync time, safely after the boot-time of_alias_scan(),
which runs pre-initcall from unflatten_device_tree() (or
of_pdt_build_devicetree() on OF-real platforms):

  OF_RECONFIG_ADD_PROPERTY    -> of_alias_create()
  OF_RECONFIG_REMOVE_PROPERTY -> of_alias_destroy()
  OF_RECONFIG_UPDATE_PROPERTY -> destroy + create
  OF_RECONFIG_ATTACH_NODE     -> adopt the node as of_aliases
  OF_RECONFIG_DETACH_NODE     -> drop every aliases_lookup entry

The reconfig notifier chain fires from both direct changesets and
overlay apply/revert, so the same code path covers runtime dt
modifications and overlay-declared aliases without any overlay-
specific hook in drivers/of/overlay.c. Grant Likely suggested this
shape on Geert Uytterhoeven's 2015 RFC [1]; Geert's original hook was
in dynamic.c directly.

Match the /aliases target node structurally (exact name "aliases",
parent == root, via the shared of_node_is_aliases()) rather than by
pointer against the of_aliases global. A system with no boot-time
/aliases has of_aliases == NULL, so an overlay that creates /aliases
from scratch would otherwise be missed from the first ATTACH_NODE
onward. The name compare is exact rather than of_node_name_eq():
the latter ignores unit addresses and would also match a root node
named "aliases@1", which neither path lookup nor the DT spec treats
as the aliases node. ATTACH publishes the adopted node
in of_aliases with a reference held; DETACH clears the pointer and
drops that reference again. Both pointer updates happen under
devtree_lock, pairing with the locked reader in
of_find_node_opts_by_path() from the previous patch — a reader either
observes NULL or takes its own reference before the notifier's put
can be the last one. Dropping the reference at DETACH also keeps the
node at refcount 1 by the time an overlay changeset that created
/aliases is destroyed, which __of_changeset_entry_destroy() insists
on before it lets the node be freed.

Only per-property notifications populate aliases_lookup —
the notifier does not walk the attached node's property list, which
would race with devtree_lock-protected property mutations. A direct
of_attach_node() caller that pre-populates /aliases is not tracked,
matching pre-series behavior.

DETACH_NODE conversely drops every aliases_lookup entry — but only
when the detached node is the tracked of_aliases. __of_attach_node()
has no duplicate-name check, so a stray second root node named
"aliases" can exist; detaching it must not wipe entries backed by the
real node. Walking aliases_lookup itself (under aliases_mutex) avoids
the same property-list race. Overlay revert additionally emits per-
property REMOVE events beforehand; the sweep catches direct
of_detach_node() callers that don't. The per-entry teardown is
factored into __of_alias_del(), shared by the single-name destroy and
the detach-time sweep.

One ordering caveat is inherent to the notification architecture:
within a single changeset, a device created by an earlier ATTACH
entry can be probed by of_platform_notify() before a later /aliases
ADD_PROPERTY entry reaches this notifier. Overlays that declare an
alias for a node they also create should order the /aliases fragment
first if the target bus is populated with a bound driver at apply
time.

The notifier machinery is built only for CONFIG_OF_DYNAMIC kernels:
without it no reconfig notifications exist and
of_reconfig_notifier_register() is a stub returning -EINVAL, so an
unconditional registration would fail the initcall on every
non-dynamic DT kernel.

Factor the per-property loop body of of_alias_scan() into
of_alias_create() so the boot-time scan and the runtime notifier
share one code path. Owned (runtime) entries kstrdup the alias name
so the alias_prop survives the property that spawned it — required
for the overlay revert path where the source property is freed. A
one-bit @owned flag on struct alias_prop distinguishes kmalloc'd
entries from memblock-backed ones so the destroy path kfree()s the
right ones. Every entry, boot-time or runtime, holds the target-node
reference that of_find_node_by_path() returned at create time;
destroy drops it symmetrically.

The destroy path unlinks matching entries regardless of ownership
(freeing storage only for owned ones) so an overlay UPDATE against a
boot-time alias leaves at most one entry per stem+id. This addresses
the allocator-mismatch worry Grant flagged on the 2015 series [2] and
the duplicate-mapping side effect that would otherwise leak through.

Serialize aliases_lookup on a dedicated aliases_mutex: readers
(of_alias_get_id, of_alias_get_highest_id, of_device_uevent) and the
reconfig notifier hold it around every access. Boot-time
of_alias_scan() runs single-threaded during init and stays lockless.
This is preferable to piggy-backing on of_mutex because the reconfig
notifier is called both under of_mutex (overlay apply path) and
outside of it (direct of_add_property() path from dynamic.c), so a
nested acquisition would deadlock on some callers.

Validate the property value before feeding it to of_find_node_by_path():
pp->value must be non-empty and null-terminated within pp->length. An
overlay that hasn't been through /aliases fixup can otherwise present
a fragment-internal string that isn't a valid live-tree path or a
malformed non-terminated value, and of_find_node_by_path() derefs it
as a C string — an OOB read on the malformed case.

The refactor also fixes a pre-existing one-byte out-of-bounds read in
the stem parser: the old loop tested isdigit(*(end - 1)) before
checking end > start, reading one byte before the property name when
the name is empty or all digits. of_alias_create() checks the bound
first and rejects a zero-length stem.

Naming builds on Geert's original series:
  - "of: Extract of_alias_create()"                     [3]
  - "of: Add of_alias_destroy()"                        [4]
  - "of/dynamic: Update list of aliases on aliases changes" [5]

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secretlab.ca/ [2]
Link: https://lore.kernel.org/lkml/1435675876-2159-2-git-send-email-geert+renesas@glider.be/ [3]
Link: https://lore.kernel.org/lkml/1435675876-2159-3-git-send-email-geert+renesas@glider.be/ [4]
Link: https://lore.kernel.org/lkml/1435675876-2159-4-git-send-email-geert+renesas@glider.be/ [5]
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 210 +++++++++++++++++++++++++++++++++++++++---------
 drivers/of/device.c     |   4 +-
 drivers/of/of_private.h |  14 ++++
 3 files changed, 186 insertions(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9c2770823889..669eed7d03cf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1925,6 +1925,170 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, np);
 }
 
+/*
+ * Protects aliases_lookup and of_aliases. of_alias_scan() runs single-
+ * threaded at init and skips it; every other reader/writer must hold it.
+ */
+DEFINE_MUTEX(aliases_mutex);
+
+/* Callers other than of_alias_scan() must hold @aliases_mutex. */
+static void of_alias_create(const struct property *pp,
+			    void *(*dt_alloc)(u64 size, u64 align),
+			    bool owned)
+{
+	const char *start = pp->name;
+	const char *end;
+	struct device_node *np;
+	struct alias_prop *ap;
+	const char *dup;
+	int id, len;
+
+	if (is_pseudo_property(pp->name))
+		return;
+
+	if (!of_alias_value_ok(pp))
+		return;
+
+	np = of_find_node_by_path(pp->value);
+	if (!np)
+		return;
+
+	end = start + strlen(start);
+	while (end > start && isdigit(*(end - 1)))
+		end--;
+	len = end - start;
+	if (len == 0)
+		goto out_put;
+
+	if (kstrtoint(end, 10, &id) < 0)
+		goto out_put;
+
+	ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
+	if (!ap)
+		goto out_put;
+	memset(ap, 0, sizeof(*ap) + len + 1);
+
+	if (owned) {
+		dup = kstrdup(pp->name, GFP_KERNEL);
+		if (!dup) {
+			kfree(ap);
+			goto out_put;
+		}
+	} else {
+		dup = start;
+	}
+	ap->alias = dup;
+	ap->owned = owned;
+	of_alias_add(ap, np, id, start, len);
+	return;
+
+out_put:
+	of_node_put(np);
+}
+
+#ifdef CONFIG_OF_DYNAMIC
+/* Unlink @ap; free its storage if it was runtime-allocated. */
+static void __of_alias_del(struct alias_prop *ap)
+{
+	list_del(&ap->link);
+	of_node_put(ap->np);
+	if (ap->owned) {
+		kfree(ap->alias);
+		kfree(ap);
+	}
+}
+
+/* Callers must hold @aliases_mutex. */
+static void of_alias_destroy(const char *name)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		if (strcmp(ap->alias, name) != 0)
+			continue;
+		__of_alias_del(ap);
+		return;
+	}
+}
+
+static void *alias_alloc(u64 size, u64 align)
+{
+	return kzalloc(size, GFP_KERNEL);
+}
+
+/* Callers must hold @aliases_mutex. */
+static void of_aliases_forget_all(void)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link)
+		__of_alias_del(ap);
+}
+
+static int of_aliases_reconfig_notifier(struct notifier_block *nb,
+					unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct device_node *put = NULL;
+	unsigned long flags;
+
+	/* of_aliases may still be NULL when an overlay creates the node */
+	if (!rd->dn || !of_node_is_aliases(rd->dn))
+		return NOTIFY_DONE;
+
+	mutex_lock(&aliases_mutex);
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		/* of_aliases is read under devtree_lock by alias path lookup */
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		if (!of_aliases)
+			of_aliases = of_node_get(rd->dn);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		break;
+	case OF_RECONFIG_DETACH_NODE:
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		if (of_aliases == rd->dn) {
+			of_aliases = NULL;
+			put = rd->dn;
+		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		if (put) {
+			of_aliases_forget_all();
+			/* may free the node, so must sit outside devtree_lock */
+			of_node_put(put);
+		}
+		break;
+	case OF_RECONFIG_ADD_PROPERTY:
+		of_alias_create(rd->prop, alias_alloc, true);
+		break;
+	case OF_RECONFIG_REMOVE_PROPERTY:
+		of_alias_destroy(rd->prop->name);
+		break;
+	case OF_RECONFIG_UPDATE_PROPERTY:
+		if (rd->old_prop)
+			of_alias_destroy(rd->old_prop->name);
+		of_alias_create(rd->prop, alias_alloc, true);
+		break;
+	default:
+		break;
+	}
+	mutex_unlock(&aliases_mutex);
+	return NOTIFY_OK;
+}
+
+static struct notifier_block of_aliases_nb = {
+	.notifier_call = of_aliases_reconfig_notifier,
+};
+
+static int __init of_aliases_reconfig_init(void)
+{
+	return of_reconfig_notifier_register(&of_aliases_nb);
+}
+
+/* of_alias_scan() runs pre-initcall, so the boot-time scan is complete */
+core_initcall_sync(of_aliases_reconfig_init);
+#endif /* CONFIG_OF_DYNAMIC */
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  * @dt_alloc:	An allocator that provides a virtual address to memory
@@ -1960,42 +2124,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 	if (!of_aliases)
 		return;
 
-	for_each_property_of_node(of_aliases, pp) {
-		const char *start = pp->name;
-		const char *end = start + strlen(start);
-		struct device_node *np;
-		struct alias_prop *ap;
-		int id, len;
-
-		/* Skip those we do not want to proceed */
-		if (is_pseudo_property(pp->name))
-			continue;
-
-		np = of_find_node_by_path(pp->value);
-		if (!np)
-			continue;
-
-		/* walk the alias backwards to extract the id and work out
-		 * the 'stem' string */
-		while (isdigit(*(end-1)) && end > start)
-			end--;
-		len = end - start;
-
-		if (kstrtoint(end, 10, &id) < 0) {
-			of_node_put(np);
-			continue;
-		}
-
-		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
-		if (!ap) {
-			of_node_put(np);
-			continue;
-		}
-		memset(ap, 0, sizeof(*ap) + len + 1);
-		ap->alias = start;
-		of_alias_add(ap, np, id, start, len);
-	}
+	for_each_property_of_node(of_aliases, pp)
+		of_alias_create(pp, dt_alloc, false);
 }
 
 /**
@@ -2013,7 +2143,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2023,7 +2153,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
@@ -2041,7 +2171,7 @@ int of_alias_get_highest_id(const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2049,7 +2179,7 @@ int of_alias_get_highest_id(const char *stem)
 		if (app->id > id)
 			id = app->id;
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
diff --git a/drivers/of/device.c b/drivers/of/device.c
index b3dc78f2fa3a..fa0cc8129ab0 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -237,7 +237,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
 
 	seen = 0;
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (dev->of_node == app->np) {
 			add_uevent_var(env, "OF_ALIAS_%d=%s", seen,
@@ -245,7 +245,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			seen++;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 }
 EXPORT_SYMBOL_GPL(of_device_uevent);
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 792756389691..604a0b0dfda8 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -17,6 +17,11 @@
  * @alias:	Alias property name
  * @np:		Pointer to device_node that the alias stands for
  * @id:		Index value from end of alias name
+ * @owned:	True for runtime entries, where the struct and @alias are
+ *		kmalloc'd/kstrdup'd and freed on removal. False for boot-time
+ *		entries, which live in memblock (@alias points into the FDT)
+ *		and are only unlinked. Every entry holds a reference on @np;
+ *		removal drops it regardless of @owned.
  * @stem:	Alias string without the index
  *
  * The structure represents one alias property of 'aliases' node as
@@ -27,6 +32,7 @@ struct alias_prop {
 	const char *alias;
 	struct device_node *np;
 	int id;
+	bool owned;
 	char stem[];
 };
 
@@ -40,6 +46,7 @@ struct alias_prop {
 
 extern struct mutex of_mutex;
 extern raw_spinlock_t devtree_lock;
+extern struct mutex aliases_mutex;
 extern struct list_head aliases_lookup;
 extern struct kset *of_kset;
 
@@ -222,6 +229,13 @@ static inline bool of_alias_value_ok(const struct property *pp)
 	       strnlen(pp->value, pp->length) < pp->length;
 }
 
+/* the /aliases node: root child with the exact name "aliases" */
+static inline bool of_node_is_aliases(const struct device_node *np)
+{
+	return of_node_is_root(np->parent) &&
+	       !strcmp(kbasename(np->full_name), "aliases");
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

