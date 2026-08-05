Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BC3D47DD
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961875; cv=none; b=W+7mkcJXyI2fWuj5KX7tYjT7tKfrUnkr+jmefHRZY8QrmnxW1PygmbU3NSkUiWF1hI/tu948iawSchjy0nb02IJTAqKdzAsChRb+WyUzluD3WdJ7UQTUbA1JJgpl1HnzHMJ9q7IEqhdwihbAW2f9As/p0PM0nf9N65ly2ESSq2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961875; c=relaxed/simple;
	bh=H/sIgBnzZelYpO3LHst4jrIIP3vYd1GLpgIYy6ZPAq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jF0fhb//tW/wUOWKKPCdQ54oJsPcqfvzLyEZo3U7l/m8hUB/FHPnZBmEAof71rHBSjaP4EFJPzAYrkaudyILkMRSQfXA3cRRw1w4YBGMV8btATI784ldReQ7zcKk/qA93B3RFeLLTufHKMH3v4qnx+Gj0xIiDHq8zTG6z0baOq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VHL7L8um; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VHL7L8um"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2134102b3a.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961871; x=1786566671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTbGsyt7lxQwFqLnDMjhk922CpLKDo3zczkWY+WjjDI=;
        b=VHL7L8umLPpNalmYWe5NVGQPy//b2exOWTW5Ye+aM9HZOLN86zO7p7NbcQypeT+IR0
         BHenfWPou5mFFARwiZ9nIEWniYT9sXGN3OhfZkQi/53nIkh1PGTfK3F1GVSCsUiccBnh
         5dOtRh4bJmmQoYtsRUHUY6I0pfLZqOY75Q4Eot+/rQrGqy3T6/iqQTxJ4XV/nKTdRX/K
         ehrCzTpKCyTdVeK9uOed5gexoVMHufPVZwN4z/oC8pfn7My1z8F1wBM28A4G+w2PcjLd
         BS+6nQsi19aLsTPcnYndZLKjuU+4EEVP3a/Veee8pgjaioDnfjttUp55FL1D8jRz2S7o
         frug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961871; x=1786566671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTbGsyt7lxQwFqLnDMjhk922CpLKDo3zczkWY+WjjDI=;
        b=lBpXnJ0saROCthclEbwtZGt1wvnR9787BhjGvlpb8+q2BVIBIVBEnKKODNxtM+Ux6r
         yF/wWt7MXdZNOTje4iogdGvJCo4rORxOtSGkm/NeulD8Hqg4DD7aifW+paCI5u5Uy8z0
         mELO52IT+qZ5m/Lkn54wyWmgDgadSTu6RfAjz6IaAI1/X3yj7h0xqwaEHzfx409wg1gF
         VsuN6PKYNezi+yGF/mP0iTlBkfw6N2iQTHHLZTOgpZBE4EizQeeTJkCUQeKyMXwM2ryR
         96chrmHdSDxeN8OT5xY0JIXGfpjbZ7qDRoO0Y3HRZpSL3LNnD36ry85hrn5AFyQaHLh7
         /l3Q==
X-Gm-Message-State: AOJu0YyZv6MCsIrUZUAKk5EBaKdxK82W9eqrOFu/3/uwi0yo+qsBGoFw
	5g2MJZgI4A9d7jpUV427NmFfJSzurKoT+4JHrM5TWOIptWdW3kO7Xg8gqNGs2L8iEYNLmVNx0R2
	0dyHn+l0=
X-Gm-Gg: AR+sD10eF3PBmlXfNisIRR5RdPZoCY35wt2n5A2HKTFm5NlvJpXoMc7FMpBDWFndSrP
	kl3ql7nDaMmcZpDQvaXq0vFBN5/Sw2EqOwzqEdxcupDvnnZ6VtHkjcEp32kdcwy1ah0+AX5Ogea
	ly3WH2QPOFmlvkzyRUA8ZvtxvlntQqpDfHs7StI29T85pHyoeL89SJzpwZbK+MMrpOm7JCcC+M5
	OjnCKQeTIMLbFQA85Od7ul36R7ZLDBKHy3JiaoWWWoy4vvoBKE2xmmOmUqd0sLH91u7ed3gFjyi
	wOAXorF0TS588vq/NXMyPRom41rkdbLgDWP3z+IXAe3RpOBWwCoQCPN2UVH7V/zoBGEccxM8OW0
	04eLqgSwkLCXXzsBZvXCBZNvJ8eFCpuGGa07GLjTd3GJkYDiFkn0ualoLJctyKdkBHsUWKiJzOD
	N1nKCa/Hn+cvmSwN4oadNQS/Yf6pxF+3175URRBD5pFevGQRbA5eYJqIMjyY2RzYg=
X-Received: by 2002:a05:6a21:3a82:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3cb85df0a26mr11550975637.5.1785961871028;
        Wed, 05 Aug 2026 13:31:11 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:02 -0700
Subject: [PATCH v6 03/10] of: update /aliases lookup on reconfig
 notifications
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-3-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=11493;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=H/sIgBnzZelYpO3LHst4jrIIP3vYd1GLpgIYy6ZPAq4=;
 b=DGUq27YeqG2iQqSEbr22owagDxA7sTT0DtzbFii7ilWGT8SgLe5LNbYEb9NWNpYYBKnXCfm8e
 BNZaiz4dRjjDxuUAdvlZ5B5f7IBPJVlbxvtHaf4Cwwx59zc0gD8e233
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Aliases added by overlays never make it into aliases_lookup, which is
only filled by of_alias_scan() at boot. of_alias_get_id() returns
-ENODEV for them and drivers using alias based numbering (i2c, spi,
tty, mmc) fall back to dynamic ids.

Register a reconfig notifier and mirror /aliases property changes
into aliases_lookup. The notifier chain covers changesets and
overlays, so no overlay specific hook is needed. Same approach as
Geert's 2015 series [1], which was never reposted;
of_alias_create()/of_alias_destroy() keep its names.

The /aliases node is matched by name and root parent instead of the
of_aliases pointer, which is still NULL when an overlay creates the
node on a system without a boot-time /aliases. The name match is
exact, of_node_name_eq() would also match "aliases@1". ATTACH stores
the node in of_aliases with a reference held, DETACH drops it again
and flushes aliases_lookup; the pointer updates happen under
devtree_lock to pair with the reader in of_find_node_opts_by_path().
Nodes attached with properties already set are not scanned, as
before.

Lookup entries are created by of_alias_scan()'s old loop body, moved
into of_alias_create(). Entries created at runtime have kstrdup'ed
names and an of_node_get'ed target and are flagged "owned" so
of_alias_destroy() knows what to kfree(); boot entries live in
memblock and are only unlinked. Removal matches entries regardless of
ownership so updating a boot-time alias does not leave duplicates
behind, which was Grant's main concern on the old series [2].

A new aliases_mutex protects the list. of_mutex does not work here:
the notifier runs under it on the overlay path but outside of it on
the of_add_property() path.

of_alias_create() skips names that are empty or all digits instead of
creating an entry with an empty stem.

Only built for CONFIG_OF_DYNAMIC: there are no notifications without
it and the register stub returns -EINVAL.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secretlab.ca/ [2]
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 210 +++++++++++++++++++++++++++++++++++++++---------
 drivers/of/device.c     |   4 +-
 drivers/of/of_private.h |  14 ++++
 3 files changed, 186 insertions(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index eca1f55eee87..612e2cd31688 100644
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
-		while (end > start && isdigit(*(end - 1)))
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
index 9bba999f0bf8..731b606ae3e3 100644
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
 
@@ -223,6 +230,13 @@ static inline bool of_alias_value_ok(const struct property *pp)
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

