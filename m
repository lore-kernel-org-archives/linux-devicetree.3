Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B086233952
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704452; cv=none; b=ZIQPWuaTOHc+8beMwFpKKfQWunWBDCaOiKPXlGKs+Jp6JSAlEmhJrqDuviLzpsD7FciKX87MhkuVlQffAXfRCjqofWiifei7qjefEcRWA9kdZzYdkk49UIJ7RReFn3DrCcuTjJEfHheuGgE89Bhbmwty0nOP3fazET1jdZ5cWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704452; c=relaxed/simple;
	bh=CzglU0PG4T/1tAP+1ean7yfZy/UcG1CF1h1xLRBZt5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeHX1AEEydCP7OWuZgYmA/vwx9Ej1Ky5Wx2iFa16W3XayUL33tuO/JcuVVBl8RH783dzUQQmBNl79cvI+OPR/ADzysK7h6XWUQFvVZn/Z7WesdAcCMCfntGJZcsGjNnf6tXXt+NwKpCuKgnlNy9dtLDuHr4q3KLJpoVCSuQRKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DbSOjXlI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DbSOjXlI"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84874b52eabso11699717b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704451; x=1785309251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnTWoZ5wDGxUlUNB0qU2s5na487tWVd5E/ewSvf8uj0=;
        b=DbSOjXlImTJcmR5Bj8hAaJGBFCMSC3n46LiIhlMitY76wiWK28YR1rMkNc4uWZ/KBf
         gaR57Z+wJCxZVXt/yPwsxCD88k8LHhLXxgnRQdCzAOvpH12WSuACMvifH6ylmuna8M7E
         uUK7bwsrJlR0LG2CVZeMA6kY7tNeOxkVqzQ6UG1ZEZA+DgRz65dV79wlxy6sc0oAT2TG
         3cxBSbVXtb0sZDMW5RS4B/3mS5D2q1PNcagHacknTIF8R0dTJSAvlYbUR9oC+d50PluA
         PgBywXyHlYAuC6whwaa040YqEp/rNsHSJ7IX9bEnaqiryG8e0KZsz9cQc1rDJ/KL2OYZ
         D/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704451; x=1785309251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnTWoZ5wDGxUlUNB0qU2s5na487tWVd5E/ewSvf8uj0=;
        b=W22Dd8Lldazb+sE34ox1/9WhT2iUFpgQ25E84mdwsGrNjXJaelP+sQV27NrEwUCtKN
         SPB8idHzq9MjIxI9UD3nW37dp2rhNgpquhH52K97EzsngRHwtyLUx7MXIJWFayJrlFDq
         TN6uYcJCnnXpljwhxwUJJ3YeV8f7BYrOjMrqPWWPshRrlIe1LgBoZJb6pbT44q5FQm1g
         nPMwbiXYnyM0BWHOpchoDrNgV08t49qQ7xcqBM2kNu6GLXuU+dNbehMXt/kUunMHc/Jt
         q7jUyoZE6BjXLLiFl+y5RgfgM8uZD37qoGhigQjg2pkj9NX7a6RHZLrFmhb+LT8VXn4Q
         BSgQ==
X-Gm-Message-State: AOJu0YwtX037oURJQFSyIcoW6xz8q50HcvSpJGoMGcMJnmb80UFQg9U9
	5bEkYMV7EFn9vjCF3jYoirIfj84vW46yxhom0UcfqZyHQxe4E7pJvKkHfCE3CO9+KM2j7FwsOqC
	3eKv6WeA=
X-Gm-Gg: AR+sD10Qo6WvzApHmiqZQQ/nTLGs0Exbzjh/AhXoUhTgH7wGK7tlGAWYzjQ29fe6Y9O
	eQXFYzuWrtXDgrZi8QezZzM22iVsmZMxqN4e+tD6d9sOq6jjg9J9EEMXwQkyaEVA6c86hqB+mLg
	Lu5gELmm/EWqR7sAc1nRC4XbjwExvf/dE1t4/viEGDlb71G7fGRMh3qwr+fRt9e3lkoQ3PCnPZ3
	SX3F3vRdM1KHTQMz6300P6DVXb/oyPgnMzDI+kGgsg4zeN/jrU7E+vpCrS9jIojqSxnvF40RUjs
	m4kbaCN3L0YX6nV2vC6+89tIYFeqIOKfvupn35JpqMWCaGWU8VMbKEZNP/9Mhvf4VtAPt04ooUS
	Gm7A+ecwS50/gSQy3De9rUfUI1Q5QHc8iEhhUYMJuKiYsTxzit2WNrJu7DZN4FLBeCEH5Bx02PR
	spPBx5
X-Received: by 2002:a05:6a00:288d:b0:845:d650:b75f with SMTP id d2e1a72fcca58-84c29270e93mr22915892b3a.8.1784704450541;
        Wed, 22 Jul 2026 00:14:10 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:06 -0700
Subject: [PATCH v4 1/7] of: resolve alias-prefixed paths under devtree_lock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-1-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=4803;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=CzglU0PG4T/1tAP+1ean7yfZy/UcG1CF1h1xLRBZt5s=;
 b=arj9uEEBYDPV0UiCINKd+TuGUtNG6b5H5R/rN3UsRrbaUsE5QtcxLhpTg1W4uNO7ffnqgvgUi
 r3l/1NsKGRiCXRL27qgFs2ZSaj1ThcZQOXIDFkdBLelqabpspoZOK6Z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_find_node_opts_by_path() resolves an alias-prefixed path by
walking the property list of the of_aliases node with no lock held
and no reference taken on the node. Property surgery on /aliases —
of_add_property(), of_remove_property(), changeset apply/revert —
mutates that list under devtree_lock, so the lockless walk can step
into a property that is being unlinked. Nothing keeps the node itself
alive across the walk either: detaching /aliases and dropping the
last reference frees the node and its property list mid-iteration.

The race has existed since the walk was introduced, but is hard to
hit with a boot-FDT /aliases node that nothing ever detaches. The
rest of this series makes /aliases dynamic — overlays can add and
remove properties, and create and destroy the node itself — so close
it first: find the matching property under devtree_lock with a
reference held on of_aliases, and keep that reference across the
of_find_node_by_path() call that resolves the value. The reference is
what keeps the value string valid outside the lock: a concurrently
removed property moves to the node's deadprops list and is only freed
when the node itself is released.

While here, validate the value's shape before handing it to
of_find_node_by_path(): /aliases contents can now come from overlays
and from raw changeset/of_add_property() callers, and only the
overlay path validates at the producer. of_alias_value_ok() (shared
with the alias tracking added later in this series) rejects values
that are not non-empty C strings NUL-terminated within the property
length, so the consumer no longer trusts any producer. This also
covers the empty property (NULL value) that previously crashed in
strchr().

of_alias_value_ok() also requires the value to be an absolute path —
the DT spec defines alias values as full node paths. A relative value
that names another alias, including itself, would otherwise send
of_find_node_by_path() into unbounded mutual recursion with the alias
resolution here: `loop = "loop"` exhausts the kernel stack on the
first lookup. Both consumers (this reader and of_alias_create())
share the helper, so one check closes the recursion everywhere.

The name match is folded into one bounded strncmp plus a check of the
terminating NUL instead of strlen + strncmp, halving the string
traversal now done with interrupts disabled.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 26 ++++++++++++++++++--------
 drivers/of/of_private.h |  8 ++++++++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..9c2770823889 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -995,6 +995,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
+		struct device_node *aliases;
+		const char *value = NULL;
 		int len;
 		const char *p = strchrnul(path, '/');
 
@@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 			p = separator;
 		len = p - path;
 
-		/* of_aliases must not be NULL */
-		if (!of_aliases)
-			return NULL;
-
-		for_each_property_of_node(of_aliases, pp) {
-			if (strlen(pp->name) == len && !strncmp(pp->name, path, len)) {
-				np = of_find_node_by_path(pp->value);
-				break;
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		aliases = of_node_get(of_aliases);
+		if (aliases) {
+			for_each_property_of_node(aliases, pp) {
+				if (!strncmp(pp->name, path, len) &&
+				    !pp->name[len]) {
+					if (of_alias_value_ok(pp))
+						value = pp->value;
+					break;
+				}
 			}
 		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+		/* the reference on @aliases keeps @value alive */
+		if (value)
+			np = of_find_node_by_path(value);
+		of_node_put(aliases);
 		if (!np)
 			return NULL;
 		path = p;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..9bba999f0bf8 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -215,6 +215,14 @@ static inline bool is_pseudo_property(const char *prop_name)
 		!of_prop_cmp(prop_name, "linux,phandle");
 }
 
+/* alias values must be absolute paths NUL-terminated within length */
+static inline bool of_alias_value_ok(const struct property *pp)
+{
+	return pp->value && pp->length >= 2 &&
+	       *(const char *)pp->value == '/' &&
+	       strnlen(pp->value, pp->length) < pp->length;
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

