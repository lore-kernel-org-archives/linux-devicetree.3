Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA309401486
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602343; cv=none; b=u+oXILfPOBIIhJZYCuQkahJvN3je348fhZuQyh4fiU/qvO4Rab/hFlBpDaTzxwFPzVdeO/ausn9EWq8qbM+BErPt9VQQfRRYZ+MoLZwXvZOF+9KzrKrz/WHj3ml93Y4+phQb5hcUD/FKdPTOOs+zuAHNsHsTh8nlHeDba/VzKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602343; c=relaxed/simple;
	bh=Mn8FcKbZ81xDVirfu+CjoQoPekNQzeKe0z8EvxMTayI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV6mYnWRa/UDzjTe05/ywg2zuUsC2cgFilLbage3CG/rS+7/Rmy/uSpWsI2BRtHD9+X/RPekCLTZdJCO8Upmhq0LtVzCI5qGkL8VGrV/ndbk1z7uqF79MfLq9xAIUjmGddFSuw3g3PH7hEFW9ZOk40BHZFvzi32sCpewQdpXDjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=lTPdFuig; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="lTPdFuig"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so6794971a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602341; x=1785207141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmYi4WVIxDVF63GoKUTqcWPie021wtL6weOItamcAaw=;
        b=lTPdFuigBLgTiLHdgzfLCfF/+n3R+6nhjqAIZCRNikJpF3Xz4nN0lia/AZFdZwcdnK
         Qo0an6GVaif82bfsTU7iW/+BMznG9kmm+gs91UsM7cOQ7IZPHP8wQt3i5j5Rzx+CbTUn
         qGcX2vkPxAvOeI+GHS6jKR+rRwQuw+mW+h8hVq9sn0e/GaF+YUedmSbcfsjVYw25MPQA
         XxSjJ71NmZ1uUbf5oDqkG3TLWXMwZM2f6Da4P/t3QaNgnXvw0t3N/UMisfERqjyGY/Jg
         GPq4M/8os4EFTiilRjf3K2kz1kDhz0soV8cUfKcO1vMNBgCBHrpcfsTVL4haRndUHETY
         ADYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602341; x=1785207141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmYi4WVIxDVF63GoKUTqcWPie021wtL6weOItamcAaw=;
        b=ETOETMHF8+5m4SE3DLabHObvcx2nlLxOfsFVTF+XRiH8Hzcu/sou3G6wV7R58DHPvs
         a6di6uIv4d2VSLnQCElNzqrid8MLx/OGSXKll+IhwrAFORBdwSb+OkxHDu/bJZrZKPjv
         LCgpSvf+iwYNmZD1CuCDilK05m1g5txUp455nuhFXLw/waBKydxSTmGjvsLzGUvE/xCG
         b5RRYvxi1oozXcjYHQfYkBBrTZZqUfqC3dHlXfiz5vN0cLC5yxkysZW2JEnEbniFlWPE
         x/3NB+jPbY5sg10bfM8W+nZHK8rX/GLz9agZgpk7qk+UOfM/58N3L2jqpjx2OAXNbRB8
         UV2A==
X-Gm-Message-State: AOJu0YylcTjZewwRHnLqv/HW48L082SRnHaueP+8+eAvwCVY4FY4euOD
	DrWHmVAJSqmRuIgZlKvToGvyzWwgwqshr0KHR+a+FnevukLWoO0HOeESIl0P0CdzVPPMYp6KnWL
	5HTGEjqs=
X-Gm-Gg: AfdE7cnBYYXyNY3EwRWug+gni4yG4F9mqlhd72dpzy0dDcvune+LXv1kAFGruJ2IZXP
	P6X0YhUjGoAMcf4YoJHgME4s9SvGV1KcjA3Go7MQHvEgrYzTBAwjnJba1Fpt9wSqbS5xItgUfmU
	fYDIBZRSD+E0e0iGXPj5JcSaEYCWYdvvG0GMOKgeuUd6vHt3+IhGzp/LlWR/VjUc4rtVHDfViI9
	PWlnBR64jWyZ0Sjze83nuf4wzDuXjhcn/g3Lxme1EWnfwl3rtJLv8qmy4R0M7DepEGhX15XfXUd
	HszTL833hXnmWH8NhCqKo84SRroKoNSyaB/LQt0GjWiVMx/esBFVnf8++Q1FGSGz8pF5IpaAU2m
	VLyXoSD77Ed+PlvRHb/IY+BW4MhSJ8ugwURcgDeZRhMUV1lnRng37uZrcRKoLGmcJ7d+P2A9TpL
	R+dgdj
X-Received: by 2002:a05:6a20:12c8:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3c3ad93dd28mr17276728637.54.1784602340973;
        Mon, 20 Jul 2026 19:52:20 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41167294eec.24.2026.07.20.19.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:52:20 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 19:52:15 -0700
Subject: [PATCH RFC 1/4] of: incrementally update /aliases lookup on
 reconfig notifications
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-nh-of-alias-overlay-v1-1-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784602339; l=15117;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=Mn8FcKbZ81xDVirfu+CjoQoPekNQzeKe0z8EvxMTayI=;
 b=lybnOtG/2/+TKIgC1KQMqXcO1LBS7/g6XnpasXPjIRk1CXVlsDMDz6uNOQ2yAD0SsZmuYRPE8
 /g1YYiXO9tsB6dvdNnNqIok3NN3/7mxd4mDz74/CJiVSQVaSMR37GwD
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

/aliases entries added by a device-tree overlay are stored in the live
tree but never enter the global aliases_lookup list that of_alias_scan()
builds at boot. As a result, of_alias_get_id() returns -ENODEV for
aliases declared inside overlays, and any driver that relies on
alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
pinned id and falls back to auto-assignment.

Fix by registering an internal OF reconfig notifier from
of_core_init() that mirrors /aliases changes into aliases_lookup:

  OF_RECONFIG_ADD_PROPERTY    -> of_alias_create()
  OF_RECONFIG_REMOVE_PROPERTY -> of_alias_destroy()
  OF_RECONFIG_UPDATE_PROPERTY -> destroy + create
  OF_RECONFIG_ATTACH_NODE     -> scan all properties (defensive)
  OF_RECONFIG_DETACH_NODE     -> forget all properties (defensive)

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
from the first ATTACH_NODE onward. ATTACH/DETACH also update
of_aliases lazily (with of_node_get/put) so subsequent consumers see
it.

Overlays build the node up empty and add properties via separate
ADD_PROPERTY events; other callers of of_attach_node() are allowed to
attach a fully-populated node in one shot. Handle both shapes by
scanning the node's properties on ATTACH_NODE and forgetting them on
DETACH_NODE. Overlay-driven flows still receive per-property events
and remain correct.

Factor the per-property loop body of of_alias_scan() into
of_alias_create() so the boot-time scan and the runtime notifier
share one code path. Owned (runtime) entries kstrdup the alias name
and hold an of_node_get() reference on the target so the alias_prop
survives the property that spawned it — required for the overlay
revert path where the source property is freed before we get a chance
to see it drop. A one-bit @owned flag on struct alias_prop distinguishes
kmalloc'd entries from memblock-backed ones so the destroy path
kfree()s the right ones.

The destroy path unlinks matching entries regardless of ownership
(freeing storage only for owned ones) so an overlay UPDATE against a
boot-time alias leaves at most one entry per stem+id. This addresses
the allocator-mismatch worry Grant flagged on the 2015 series [2] and
also the duplicate-mapping side effect that would otherwise leak
through.

Serialize aliases_lookup on a dedicated aliases_mutex: readers
(of_alias_get_id, of_alias_get_highest_id) and the reconfig notifier
both hold it around every access. Boot-time of_alias_scan() runs
single-threaded during init and stays lockless. This is preferable to
piggy-backing on of_mutex because the reconfig notifier is called
both under of_mutex (overlay apply path) and outside of it (direct
of_add_property() path from dynamic.c), so a nested acquisition would
deadlock on some callers.

Validate the property value before feeding it to of_find_node_by_path():
pp->value must be non-empty and null-terminated within pp->length. An
overlay that hasn't been through /aliases fixup can otherwise present
a fragment-internal string that isn't a valid live-tree path or a
malformed non-terminated value, and of_find_node_by_path() derefs it
as a C string — an OOB read on the malformed case.

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
 drivers/of/base.c       | 271 +++++++++++++++++++++++++++++++++++++++++-------
 drivers/of/of_private.h |   7 ++
 2 files changed, 238 insertions(+), 40 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..2695c5f8bb93 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1915,6 +1915,231 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, np);
 }
 
+/*
+ * Serializes aliases_lookup and of_aliases across boot-time scan,
+ * runtime notifier updates, and readers. of_alias_get_id() and
+ * of_alias_get_highest_id() acquire this before walking the list; the
+ * OF reconfig notifier below acquires it around each mutation.
+ * of_alias_scan() runs single-threaded from of_core_init() and skips
+ * the lock, but any code path that reads or writes aliases_lookup
+ * outside init must hold it.
+ */
+static DEFINE_MUTEX(aliases_mutex);
+
+/*
+ * Build an alias_prop for @pp using @dt_alloc as the storage allocator
+ * and add it to aliases_lookup. @owned is stored on the entry so the
+ * matching destroy path knows whether the alias_prop is a kmalloc'd
+ * struct that must be kfree()d (with a paired of_node_put on the
+ * target and kfree on the kstrdup'd alias name) or a memblock/
+ * dt_alloc'd struct that must be left alone.
+ *
+ * Callers other than of_alias_scan() must hold @aliases_mutex.
+ *
+ * Skips pseudo-properties (name, phandle, ...), malformed property
+ * values (empty or not null-terminated within pp->length), and alias
+ * names not ending in a numeric id.
+ */
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
+	/*
+	 * pp->value must be a non-empty, null-terminated string within
+	 * pp->length. of_find_node_by_path() derefs it as a C string, so
+	 * a missing terminator would cause an OOB read.
+	 */
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
+	/*
+	 * For runtime entries, kstrdup the alias name so the alias_prop
+	 * doesn't depend on pp->name remaining valid — an overlay revert
+	 * frees the source property. Boot-time entries point into the
+	 * FDT, which is never freed.
+	 */
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
+	if (owned)
+		of_node_put(np);
+}
+
+/*
+ * Reverse of of_alias_create() for owned entries: unlink and free the
+ * matching alias_prop and drop the reference it holds on the target
+ * node. For boot-time entries (owned=false) it unlinks only — the
+ * struct and the alias name live in memblock and are never freed —
+ * which prevents an overlay-driven UPDATE_PROPERTY against a boot-time
+ * alias from leaving stale duplicates in aliases_lookup.
+ *
+ * Callers must hold @aliases_mutex.
+ */
+static void of_alias_destroy(const char *name)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		if (strcmp(ap->alias, name) != 0)
+			continue;
+		list_del(&ap->link);
+		if (ap->owned) {
+			of_node_put(ap->np);
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
+/* Scan every property of @aliases and mirror it into aliases_lookup. */
+static void of_alias_node_scan(struct device_node *aliases)
+{
+	struct property *pp;
+
+	for_each_property_of_node(aliases, pp)
+		of_alias_create(pp, alias_alloc, true);
+}
+
+/* Reverse: destroy every alias_prop backed by a property of @aliases. */
+static void of_alias_node_forget(struct device_node *aliases)
+{
+	struct property *pp;
+
+	for_each_property_of_node(aliases, pp)
+		of_alias_destroy(pp->name);
+}
+
+/*
+ * OF reconfig notifier that mirrors /aliases property changes into
+ * aliases_lookup. Fires on both direct changesets and overlay
+ * apply/revert, so of_alias_get_id() returns the right id for aliases
+ * declared inside an overlay.
+ */
+static int of_aliases_reconfig_notifier(struct notifier_block *nb,
+					unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+
+	/*
+	 * Match /aliases structurally (name + root-parent) rather than by
+	 * pointer against the of_aliases global — a system with no
+	 * boot-time /aliases (of_aliases == NULL) can still acquire one
+	 * from an overlay, and we must track its properties from the
+	 * first ATTACH_NODE onward.
+	 */
+	if (!rd->dn || !rd->dn->parent ||
+	    !of_node_is_root(rd->dn->parent) ||
+	    !of_node_name_eq(rd->dn, "aliases"))
+		return NOTIFY_DONE;
+
+	mutex_lock(&aliases_mutex);
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		/*
+		 * Overlays build the node up empty and add properties via
+		 * separate ADD_PROPERTY events, but the reconfig API also
+		 * permits attaching a fully-populated node in one shot —
+		 * scan defensively so pre-populated aliases aren't lost.
+		 */
+		of_alias_node_scan(rd->dn);
+		if (!of_aliases)
+			of_aliases = of_node_get(rd->dn);
+		break;
+	case OF_RECONFIG_DETACH_NODE:
+		/*
+		 * Symmetric with ATTACH_NODE: some callers detach without
+		 * emitting per-property REMOVE events first, so drop every
+		 * alias_prop backed by this node's properties before it
+		 * disappears.
+		 */
+		of_alias_node_forget(rd->dn);
+		if (of_aliases == rd->dn) {
+			of_node_put(of_aliases);
+			of_aliases = NULL;
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
+/*
+ * of_alias_scan() runs from of_core_init() (core_initcall), so hook the
+ * reconfig notifier one initcall level later to guarantee the initial
+ * static scan is complete before any dynamic tracking begins.
+ */
+core_initcall_sync(of_aliases_reconfig_init);
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  * @dt_alloc:	An allocator that provides a virtual address to memory
@@ -1950,42 +2175,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
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
@@ -2003,7 +2194,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2013,7 +2204,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
@@ -2031,7 +2222,7 @@ int of_alias_get_highest_id(const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2039,7 +2230,7 @@ int of_alias_get_highest_id(const char *stem)
 		if (app->id > id)
 			id = app->id;
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..9d16765ae2c3 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -17,6 +17,12 @@
  * @alias:	Alias property name
  * @np:		Pointer to device_node that the alias stands for
  * @id:		Index value from end of alias name
+ * @owned:	True if @alias was kstrdup'd and @np was of_node_get'd on
+ *		insertion (overlay-time entries). False for entries built
+ *		by of_alias_scan() at boot, where @alias points into the
+ *		FDT and @np is an unreferenced pointer. The removal path
+ *		uses this flag to decide whether it must kfree(@alias),
+ *		of_node_put(@np), and kfree(the struct itself).
  * @stem:	Alias string without the index
  *
  * The structure represents one alias property of 'aliases' node as
@@ -27,6 +33,7 @@ struct alias_prop {
 	const char *alias;
 	struct device_node *np;
 	int id;
+	bool owned;
 	char stem[];
 };
 

-- 
2.54.0

