Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B33B4E9D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531001; cv=none; b=TQ7dZxN+pVnMzNtAtMIbY390tR4DiRVTVBS0DfhRP4INBbT7P8gmdltPgMW4hHACxjRBKS2PnjeaF/lVpdf4aYcvtEL8uBxkoru5fpTyiBlo23iAY/fJAsVbSg0myXneTTVVLtbSed1fXYogim4A+P43fIJm3vMctVWnxZZ690w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531001; c=relaxed/simple;
	bh=AXh/+BVSNBJekVgTzZxSzokTgbsSUiKAaKcyY0FFV2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMUv3jpiSOuJxf5YiVvcDhiPBYpcBSrA28B5Ik7Rnc0DKXFf3DUCiYHvyuwtQu7F2Mhxtc6fmClR10ts3HIcIU5jIruk5vqeNEXiRjkOhE8zQUeWXiru9e9lYoEvcJNWaWhUrs1Gdfk6ZF43NZkmeTjSgVsE6KtO8wDILZxJqyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=SzeLJDUs; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="SzeLJDUs"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso7609208a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784530999; x=1785135799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKwZA/kKgqjbce/z+Ie0wgEXyyQ4XQnnJsQw4aZLb2o=;
        b=SzeLJDUsItrr6L7SVRkymOTUMyOfWXpHXD/eBzyUwKCj+lnLObz2gy3Okv/cu+c1X+
         dSt8s3XH5fuSJRWwVEjIzzAvCJbAQmzIILWyCRb+uX816WzgIEjFpMZ+1RXS51lmtYlI
         l8aEji5VJ9r3A23Tr1ENOBv1sLx3ySGafbdQ8aSc784tqmsL+/v1l4wgTEqcZ7iQ/mu0
         5Egj1QzFdwaMGT/yNkUxjq4+FlQn2hvScroWSLlog4kjZPe2kEjDUMwP5ppZueBr3SBV
         KPO58pjFRiQxIjw7cP59J0lLtHgIAHSlIDv8T8gjncrWm2Bbcxg2f8lF2PbIsW0deBHL
         /GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784530999; x=1785135799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKwZA/kKgqjbce/z+Ie0wgEXyyQ4XQnnJsQw4aZLb2o=;
        b=stJjoqgnp7dPej4XGXbYvnHwvBH7M86d+XJCqDlSm/6Zu3SU+wkcM/O0xapAF5BnWE
         8D0pTpHz7/1Nlajna9AkPHIMr497cKvIRbI7cL7QWMC24ub+r2UQ85AZcfGG9bIjBU1J
         M55rKmuPDnHUf27AzBC/+zocsKn1DQ+Y4vZr649KJ/lHnOOHUD6fCdaAQSPitAelHmXo
         TxaheQve5dmCOMUweA3jIxwVnR+1LQ5UxZ1olSUdks58sEhqQhqW5qqFEp9rWjzWl7x0
         8q+6UvokGvCuAbmU4Djoo5ZZO1mG7xTIX3KPBhOEAE9Bw2Zm6Jm4exvbXZq1scPzo2Ml
         GuIg==
X-Gm-Message-State: AOJu0YxsP7NQOXvSPOR/EwYsuC2YVKTPNc/tTStRvEXhHAGPqdL78/i0
	Upu8pVbUOcRoc6yY8YuZCnH7N5FZr8BmymkMUKJ+YsAGq2vSLaGjXyBlXoNEjepV+F46uipCM7b
	lgXLD
X-Gm-Gg: AfdE7cnPJQ6k7GE+QErQH4VrcjnqlEWq9nkGh1U6EkGCP+gLetCmt4/orL0gJLnE7VR
	p/aE+Es3js7RBBLi1G+gk8hCbTjXlb8u3BCyx4MnAf/6SAno/e9KmHEoQmbHfqUn+JamuEWvZjw
	RHIPQbLPeejx8MmRU8ro3tECOiBiHEH3IjFARlnmr7uFuV3xIL3HJD2EBXVjzlT7C77yaNG44oY
	B8JoyyTX1jbcNiitD8SuykYrVaAT+nHspZM/qNxB9rSEb48MlH2NzbbYPUJuWsRlHhKGMgay6/e
	1Ma4Z28WTSa+mhCS9C7oBFaiUVnCvmu90AbzCmQJ0V7eA92LVMoEwbrznLhVtvPjAbCiSP12bph
	xcQTqP52EkS/0dSQ6hHoGP/nqcsXMGONoR4ilBXub+o7IVie6WyZjCabzLQTwY0Z1C5Ke/ClEPV
	/Y4btf
X-Received: by 2002:a17:90b:2692:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-38e4b3e11c8mr13395985a91.9.1784530999256;
        Mon, 20 Jul 2026 00:03:19 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm463052a91.4.2026.07.20.00.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:03:18 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 00:02:50 -0700
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
Message-Id: <20260720-nh-of-alias-overlay-v1-1-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784530997; l=10139;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=AXh/+BVSNBJekVgTzZxSzokTgbsSUiKAaKcyY0FFV2I=;
 b=Y92NlrUJulTwPHL0XGt/BnMV1CEpavP0tnNyNXOtf62TQWqSacepXMfBtlfu5e4TbKGunIbsl
 QBOcg0kQhHSB/rDWVCwSgs6OTt7aXggZII5mEZSA+65aSnBVic+XNyw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

/aliases entries added by a device-tree overlay are stored in the live
tree but never enter the global aliases_lookup list that of_alias_scan()
builds at boot. As a result, of_alias_get_id() returns -ENODEV for
aliases declared inside overlays, and any driver that relies on
alias-based numbering (i2c-xiic, spi, tty, mmc, ...) silently loses its
pinned id and falls back to auto-assignment.

Fix by registering an internal OF reconfig notifier from
of_core_init() that mirrors /aliases property changes into
aliases_lookup:

  OF_RECONFIG_ADD_PROPERTY    -> of_alias_create(pp, kzalloc, owned=true)
  OF_RECONFIG_REMOVE_PROPERTY -> of_alias_destroy(name)
  OF_RECONFIG_UPDATE_PROPERTY -> destroy + create

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
from the first ATTACH_NODE onward. The ATTACH/DETACH_NODE cases also
update of_aliases lazily so subsequent consumers see it.

Factor the per-property loop body of of_alias_scan() into
of_alias_create() so the boot-time scan and the runtime notifier share
one code path. Add a one-bit @owned flag to struct alias_prop tracking
whether the entry was kmalloc'd (overlay-time) or came from the boot-
time memblock allocator via of_alias_scan(). of_alias_destroy() skips
non-owned entries, so an overlay-driven UPDATE_PROPERTY against a
boot-time alias can't kfree() memblock storage — addressing the
allocator-mismatch worry Grant flagged on the 2015 series [2].

An @owned entry also holds an of_node_get() reference to its target,
released by of_alias_destroy(); this fixes a smaller leak Geert's
original of_alias_create() would have introduced for overlay targets.

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
 drivers/of/base.c       | 184 ++++++++++++++++++++++++++++++++++++++----------
 drivers/of/of_private.h |   7 ++
 2 files changed, 155 insertions(+), 36 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..d516523a71d5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1915,6 +1915,152 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, np);
 }
 
+/*
+ * Build an alias_prop for @pp using @dt_alloc as the storage allocator
+ * and add it to aliases_lookup. @owned is stored on the entry so the
+ * matching destroy path knows whether the alias_prop is a kmalloc'd
+ * struct that must be kfree()d (with a paired of_node_put on the
+ * target) or a memblock/dt_alloc'd struct that must be left alone.
+ *
+ * Pseudo-properties (name, phandle, ...) and alias names not ending in
+ * a numeric id are silently skipped.
+ */
+static void of_alias_create(const struct property *pp,
+			    void *(*dt_alloc)(u64 size, u64 align),
+			    bool owned)
+{
+	const char *start = pp->name;
+	const char *end = start + strlen(start);
+	struct device_node *np;
+	struct alias_prop *ap;
+	int id, len;
+
+	if (is_pseudo_property(pp->name))
+		return;
+
+	np = of_find_node_by_path(pp->value);
+	if (!np)
+		return;
+
+	while (isdigit(*(end - 1)) && end > start)
+		end--;
+	len = end - start;
+
+	if (kstrtoint(end, 10, &id) < 0)
+		goto out_put;
+
+	ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
+	if (!ap)
+		goto out_put;
+	memset(ap, 0, sizeof(*ap) + len + 1);
+	ap->alias = start;
+	ap->owned = owned;
+	of_alias_add(ap, np, id, start, len);
+	return;
+
+out_put:
+	/*
+	 * Boot-time entries reach here on parse failure; leaking the
+	 * of_node_get() from of_find_node_by_path() is fine because the
+	 * boot tree is never freed. Overlay-time entries need the put so
+	 * the target node's refcount tracks the failed-parse case
+	 * symmetrically with success.
+	 */
+	if (owned)
+		of_node_put(np);
+}
+
+/*
+ * Reverse of of_alias_create(): find the owned alias_prop whose name
+ * matches @name, unlink it, and release everything it owns. Non-owned
+ * (boot-time) entries are skipped so an overlay-driven UPDATE against
+ * a boot-time alias can't kfree() memblock storage. That does mean an
+ * overlay updating a boot-time alias leaves two entries in
+ * aliases_lookup — deferred as a separate cleanup.
+ */
+static void of_alias_destroy(const char *name)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		if (!ap->owned || strcmp(ap->alias, name) != 0)
+			continue;
+		list_del(&ap->link);
+		of_node_put(ap->np);
+		kfree(ap);
+		return;
+	}
+}
+
+static void *alias_alloc(u64 size, u64 align)
+{
+	return kzalloc(size, GFP_KERNEL);
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
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		if (!of_aliases)
+			of_aliases = rd->dn;
+		break;
+	case OF_RECONFIG_DETACH_NODE:
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
+		of_alias_destroy(rd->old_prop->name);
+		of_alias_create(rd->prop, alias_alloc, true);
+		break;
+	default:
+		break;
+	}
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
@@ -1950,42 +2096,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
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

