Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471883BB12C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704454; cv=none; b=caQ2djzToJBU4N7mZMgfIb37iBNDCxrzf9PvbbQ9emgxAcfXdF9DNICi6rwkeATSxfwSP0pXd/gwGpuohlJ+uThbgLAAhSB927HH6ZeGiUVQkF6zUNS2LbSCnjAsUJgisGyGl4QiRjsu8Fq8j3eEcAbluCl5qTEwMEYaszupzks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704454; c=relaxed/simple;
	bh=QOHHKqluyNzXaY0MgQDsZynbut0broBYRsoS7lqv22I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9b/gyw+ab74aFw0ErmfnQgCE7EakdfP5WuQyRtZo/aro38PgTB+at3tVLtjsnPZUA9aegiSeK5lW7fxoW2m+5meAOreML/B5k/jtpxb3z5ocNn/aEyKJwHZtxDBlctYii0a0O373TqucLFYNSwTFiX9/40sxv1nXwZQIiS5Dlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ZBRb4UpI; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ZBRb4UpI"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1387786b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704452; x=1785309252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RrJTPdpDV+xxTsg977zOfxZbcmNaMztUMTalxEC9Mc=;
        b=ZBRb4UpIQILHWKLNwjryaivhrNXg3kq8UOXXO/YTIRrdoUrsUSSYD6AtSCbD8+A9/H
         D0PryIZCH0Uhr8dP0mERO3a343PwAfz1eN1GYLJXF/du3OIzXdetK2u/8tPJ5VnXNwpj
         cqG2YsXPv0uuHEu5eiWdggd9mTh6QINcauu+zZS4D6PixY+zGKrFHPC47FAIy23wJ8fg
         /y+QBdxH7GE19japMP9uDq48sxZ1KghJRIQS6PY/0tFbi85hX3ANbMWYB/j1NQ6Buf6l
         ac8UgcVTstlOVzWWn5yqrAxcjZu/UfzX+M5PZE5bQzH+r2x3SyWYiNuCthhhU7EcEZ19
         kxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704452; x=1785309252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RrJTPdpDV+xxTsg977zOfxZbcmNaMztUMTalxEC9Mc=;
        b=lIt0YuaHvIIo3uYXa0mjsYYbXsCvhUhi7zwk+1+bH8dtjU8/X7Pvi0XmqRGCxv5ou5
         JQyXhVnXOtOlGbeBsN1nyQopA0MHloWKv28UmcLzm+KtgoDnHM8TUpUM4ZXQIoLaq2mL
         t43N4OYJU9Go3RPGVImKcu+8OZ9n4/VkWdJtAWiBJNVkvHUVsN7vo9HEQD3VaY+G6DCP
         7pOlvAfEX1sgC4MU9rJYGhiF0lJeDctSI0MhO/lpfkwGfbG9OrY9Y0XbJwJeDIWWhdGv
         XHC8SUCJ+oT//r1L5HacEsjmHO4dRedNX/fPoeku6ValEAU3ir3BZnsTuVRopUWW0Pzs
         qBeg==
X-Gm-Message-State: AOJu0YwZqN9+rJRp8KlZUrY8pkB94buew1t6/baUrKGtdFKFFL0O5ieM
	XqdTcsmPzp7uUsTVgM3v5ZdhwdKN1VDiUGbqStjgb9WuXv624HGCcsLo4CpfWtNe6IF37hbMmMM
	Btn1k1VU=
X-Gm-Gg: AR+sD10q1FVOhVLdCsQU/fUcihjOc6Vwe9CzszoYfOupie62fjtqzauwosN3wQ65xrI
	KqonIUmaoCcw4jPnqWAZyDRYyNr5HjxotjEnBelN1IgEMdUz63Gp+H5Bl8oyOYrQUOHutwSBGkD
	wH1Hi6ei5MEp2pVwrzfL9BzflnGsPpKWm1jv5Xay7FVHrSmx2kBPyWy/i0OfFlHo+kgVJoCe88p
	6AcdU+ZpWCLPYHkwTMOAsZYh4RECoA3cIoeCqy0qKgJSSmzTaVIeY2zvHE6U9Xu6WM+WbVkX1Ir
	Qhyp29cY1qDoKRzNsXm7xrB+UHdtE/1/piLW6c+NINnz93Nopcx5F+zMO6CBxAEiSMadGY+vyeP
	X2NQMChnpGg78gxSyHtR4unqjXCmFxXVR9hgHsJqtp5AMskvQoye8Tm5+LFPFFXGcwJZuRyNvBO
	auHLfJ+Qxh4gP6Ed0=
X-Received: by 2002:a05:6a00:1d8a:b0:848:727f:2c8b with SMTP id d2e1a72fcca58-84c294eb4demr21763992b3a.68.1784704451504;
        Wed, 22 Jul 2026 00:14:11 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:11 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:07 -0700
Subject: [PATCH v4 2/7] of: incrementally update /aliases lookup on
 reconfig notifications
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-2-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=16428;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=QOHHKqluyNzXaY0MgQDsZynbut0broBYRsoS7lqv22I=;
 b=8XaxTQvAIGf5bkaMyt6EOedt4LkW/9pOZ8Gw819RelDDO91wZP1sSY1CXaYsjbQI4wlwykEDf
 MiBYTwKExp1B2DMtSrm3T9NLhAk3Z4c17LzjfNokBPzZBgzDcwdsx0r
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

