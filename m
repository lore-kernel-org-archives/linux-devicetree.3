Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6035C6BC
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669801; cv=none; b=TsUeDBcQR+DanSFc8JmkyDqkjCfu4QtAnD4AJ21jBSE4Hsh9wCU53qRaAkrphC/BH7CCVa6q5LVte/Hkmp2vVqEue77uePvCH45JYE4glAkKPVjtH+PDdm5v4BNaeQriQ7ylhQ3A7287+C+MpKvph2D3kA4Z2+UPKG40bLi0xzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669801; c=relaxed/simple;
	bh=5o7m4TaStMbJi2U08yjskXG0HR3s5aGGGp0eAox2r4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1MRHlERonbButGWEZYyWCdslJhfGOgMaiCfSpumfWCJH2ESyG3pi/xSHglreT9ic/O9UMs5Dua52fDYtARqbgFx6pDd3Vz1YWYDkLKKDnDMW9yE8MZwPKMkX9BAd35SuXfuwEcKej2tauWQvUJ3VtrbVfuxx+UxjxOPf8fYuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Upc9ZFrf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Upc9ZFrf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3811f512167so11448081a91.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784669799; x=1785274599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Wv6ot9GbFzw2gYUrpt0f/TE0Wgvmc4WGK8iqhr7K3k=;
        b=Upc9ZFrf7AunYFTYqyQbIXM17cQbVQ4wrfYYT58HQuy7jsYMgmxN7fJWmkMKCiuYRE
         R4SnIGDlaRNXpF1l09SaDlMtxLTK3rfvanIElJBIuqyEwyurcYZ+vTZKdvV5Qrf6Hvl+
         LZ7fgxY/oh3z0SPVDlZG24AellmQ66Y4rBIbJb2Z10CQGIBOpNu0NYNay5BFdQ/oknRG
         vhQi8b4rVRfR7hljLt+LF8j/dGDebM3EUAkGwhkcrINFqNpgiUwSo2h78VV2fSUt9hlk
         oeFSnOdLULzHt8uaA32/hVTsctiU38fPoWfDeTbwSI34zSOBq+dEjkxDsXMCW2NMZRTR
         D75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669799; x=1785274599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Wv6ot9GbFzw2gYUrpt0f/TE0Wgvmc4WGK8iqhr7K3k=;
        b=HBhPKNsKzWZVRn7X0ZpDs7oVq8qeYFBnZSR0k26KCXQR9pg/B8yRjyvGvH2vozBD44
         edPy5Bl6kWvIpjHccffHmDoiRyD5jCp12xPd2VTmDJEMempa3b2/vVpVfBrkFcOd9/fC
         Ko0jVXMa4XW7h9CTPFAokr5z8Fy5IHSs8dsp/wQvqoOtZsPv8MXLNAD2zmlI2BUsvyfv
         qxXV+d1XcrYcq0an83tRUGcieXxoJacC+0R4+JUDyTP7F87ZlXFGi5iIZ1BUTs7DsHeK
         snq1gN/99jPdKxO9uudmtz6vzFHM2HMVtxZPIkSeu3AH5NUufrekRTWJ+1fE+p9k6Ae4
         NNEw==
X-Gm-Message-State: AOJu0Yxy42MgdNBvMoEomFKER+ds2qlAwZpNWgwC1K86TUiviBV5+k4s
	jHA9udGBTcV0G2gyjdyZTSsIAx7xewLB4qRUAUhTLZQLmmm6tnWFbfdgFtBsbkeI16iwiO25IX/
	arXnKetA=
X-Gm-Gg: AR+sD11OHhbq9tqyQ0TeR9XXeUNaIWa5Hc9GI6DRhtwHVNadzrGUZmHZbnJToESUmLX
	U6PPHfAc1Kz4UJq7Rz8BcMflEDZgP7OdJItFrW7atlN6mpbWep6ME/hyhqX6qTJvJvS86hnYoJq
	NwmcG8CXAUBoCfE7yJrQAi6mT+Z3EkzNQuZKuTODnM42iEucZp+oL20g8SrQkPemDdorcknS/xy
	lKf4IAO7Y811P4jff0gyk/iu/r+7jLZCjXv8JHBvuOBTdp5VmbkuAKMjY6sYI6Yu3PKJs0BBX6X
	0t8DHfcwKz+GBqC0VYvZRJpaVl94x6r8YvTspOR5bMzwPBjvKmHtBOhsXB2jXI7tQ62Ze+h+u3w
	s0iBkDKFOfAuZdM+VdLhHUeD2gxBWnmI/Ljlf4px3IYFx48TvG6o3oDxXtR84MPEOR5p1T4Smt2
	NP9+AS
X-Received: by 2002:a17:90a:d405:b0:38e:712a:bb38 with SMTP id 98e67ed59e1d1-38e712ac393mr13423305a91.24.1784669798516;
        Tue, 21 Jul 2026 14:36:38 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm40706521c88.9.2026.07.21.14.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 14:36:32 -0700
Subject: [PATCH v3 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v3-1-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784669796; l=14000;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=5o7m4TaStMbJi2U08yjskXG0HR3s5aGGGp0eAox2r4c=;
 b=kRwK93K1S4KYzWgr/StkgNRBizxJPTFuBzUZrCGcXvF1yTwWurrVdV38MG2ioSv22FEcoY+wj
 THY3eKq1MrkCiJ0T9SF7Rdvcns5FqugBjHd66xqdt2+bKFt2ZvHY39z
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

Match the /aliases target node structurally (name == "aliases" and
parent == root) rather than by pointer against the of_aliases global.
A system with no boot-time /aliases has of_aliases == NULL, so an
overlay that creates /aliases from scratch would otherwise be missed
from the first ATTACH_NODE onward. The ATTACH handler takes a
reference on the adopted node that is deliberately never dropped:
of_find_node_opts_by_path() reads of_aliases and walks its property
list locklessly, so the node must stay valid even after DETACH clears
the pointer. Only per-property notifications populate aliases_lookup —
the notifier does not walk the attached node's property list, which
would race with devtree_lock-protected property mutations. A direct
of_attach_node() caller that pre-populates /aliases is not tracked,
matching pre-series behavior.

DETACH_NODE conversely drops every aliases_lookup entry: the only
/aliases node in the tree is going away, so every entry is backed by
it. Walking aliases_lookup itself (under aliases_mutex) avoids the
same property-list race. Overlay revert additionally emits per-
property REMOVE events beforehand; the sweep catches direct
of_detach_node() callers that don't.

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
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 200 ++++++++++++++++++++++++++++++++++++++----------
 drivers/of/device.c     |   4 +-
 drivers/of/of_private.h |   7 ++
 3 files changed, 169 insertions(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..4e34c65a8f9f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1915,6 +1915,160 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
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
+	/* of_find_node_by_path() derefs the value as a C string */
+	if (!pp->value || pp->length < 2 ||
+	    strnlen(pp->value, pp->length) >= pp->length)
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
+/* Callers must hold @aliases_mutex. */
+static void of_alias_destroy(const char *name)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		if (strcmp(ap->alias, name) != 0)
+			continue;
+		list_del(&ap->link);
+		of_node_put(ap->np);
+		if (ap->owned) {
+			kfree(ap->alias);
+			kfree(ap);
+		}
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
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		list_del(&ap->link);
+		of_node_put(ap->np);
+		if (ap->owned) {
+			kfree(ap->alias);
+			kfree(ap);
+		}
+	}
+}
+
+static int of_aliases_reconfig_notifier(struct notifier_block *nb,
+					unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+
+	/* of_aliases may still be NULL when an overlay creates the node */
+	if (!rd->dn || !rd->dn->parent ||
+	    !of_node_is_root(rd->dn->parent) ||
+	    !of_node_name_eq(rd->dn, "aliases"))
+		return NOTIFY_DONE;
+
+	mutex_lock(&aliases_mutex);
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		if (!of_aliases)
+			of_aliases = of_node_get(rd->dn);
+		break;
+	case OF_RECONFIG_DETACH_NODE:
+		of_aliases_forget_all();
+		/* keep the ATTACH reference: lockless readers may hold the node */
+		if (of_aliases == rd->dn)
+			of_aliases = NULL;
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
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  * @dt_alloc:	An allocator that provides a virtual address to memory
@@ -1950,42 +2104,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
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
@@ -2003,7 +2123,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2013,7 +2133,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
@@ -2031,7 +2151,7 @@ int of_alias_get_highest_id(const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2039,7 +2159,7 @@ int of_alias_get_highest_id(const char *stem)
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
index 0ae16da066e2..3ed4ad64ff43 100644
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
 

-- 
2.54.0

