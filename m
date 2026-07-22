Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20051A3166
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682113; cv=none; b=nKyMUrJe3g5kuT4TY4Odzs58Q8Icm/84BR4nvRP3aEZWDCXmhvJjPUsu5AGNdKdWcysFutn+y6QZmvgGBnMbYuaKINwM+lODLJBHrZjjzruJ2Kxi3SmabKn9Lfgn+d2r/0fskgCAzBUrktBYzqiZxeNUfdmvbaQPMDZugfpLppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682113; c=relaxed/simple;
	bh=mvQzRuDTBJ6+ciorG8UImWjndciZ5rWLRK/3Uj4h794=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oApfloiT+WpFEpcCtIzNsEusyANvhV34PoHG7UQT4N8GT+xoz16/hEFewGV3imhUh3MXJny3GxAKJ6oQCnGGXRZ7BkNi2qiB1NObWx9vJF/U6oQODOAB63C3h+xbd83fMf1Vk9llz3cpKdrbeGuY5yJShrOu79VV41OvXT5Twm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=eWQ3smzo; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="eWQ3smzo"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9aea40d799so4227864a12.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682111; x=1785286911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mB7RYWDgta8ixQNPzSsJsRPVpnbMTaTdGd52h3AbyCo=;
        b=eWQ3smzo5bg/qqWosHa192jhSaSIMLcq9wmf2iSk84KYt3eEuiPqKJxOdWrDOF+5Cu
         R9k1Oo+a0HautPnkA5DTZ/juiZ39hM+mXFdhq8BW7oxlGx+Y8c8od21yBAr+s86SIFn3
         UtCwb5g2OgQO10ALZYoie8bqbckkORxJs/AHq8qcJzOvuZEYq5Lzhxze3f0sn3wto+vO
         e4hSkXyZC4qBhuFzVYp2zBZup7DphzKjS58XnFBtzXmhvUUkDtOVsuFfNIJd6+g79ZsO
         D6zPABbBJqNb9kyKLkYugRjiOiApWMY8Mvd6qjmhe7jaCKloa9EKIxHangP6nGBmH7TI
         Zw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682111; x=1785286911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mB7RYWDgta8ixQNPzSsJsRPVpnbMTaTdGd52h3AbyCo=;
        b=gc2zzYHOyBYkUFDLEHFg5gIcKqMNcTr06KG7+o0eQ5hmzsozQjEjo3GiberRn2yrBS
         kOyo6ilemgEXSemAwsw3CAf1zf4VbN5WY9+tmFxFb08HnvAn97TDefTGzZNn0xPbQBzI
         Ikel8z/xGsfHm3E6MrUOhsvft/jEZWProHHkAEHF5sKawW36Ow3Mh8NwwGMpO6zU5uq5
         x9Nz/e2wYCpwTr/Q8NdY4wJmr0dwtABIdRaaBLcNZK9q2qgRcsdIxofFbUsFAuR5aXqv
         zudJu3VV35yLp58Tji/aWxO/dLbRiTpR5gPxaGjgDZmu9cByUJdrJKC9QTioQW6iulV3
         UpWQ==
X-Gm-Message-State: AOJu0YwhzZ1l7Kth0TliymoDu5bBhLlJ8oT1Gul+Wy6Xw5gMEwbTWENe
	vZJQ/L9LC+lIAKgX0y1lVkPzf0MaR8163uMcbhIHM744fhnerDzDd7NLTdLlQWBUaLRGsZ3bpz9
	U+e9WjCw=
X-Gm-Gg: AR+sD13UNCh2WvV8dazo6grhYPRbjlG63ZuRkH5rA3vFPt4/X4pmZyutbU0hA8VYoE+
	JIr5ap7PS+JuNcOFJn/tSE/8R7GujMS+lRYS3ayeJfcVFyLWTJxMA0pAwQbg5OOsdL0hXt3T8ck
	i249UR8dfPWOSuZ6hMZrc9RrxeNx7ct21G6T9n53wTeTPskwEQPIWgwVQyB1WehsSbWoL4wRSLW
	m9csurU6AdzGfREeK8yYqHRiZsr5ZArfw0gSUyYkwn2DYDDUjIjyH1jmaT7ql5cSTInQxX8CuNI
	/6/akplPPSaItIQAT8JBnmyRiu0fBpsivxJ78MYLI9nTJlVD7EpnKpvcH4l8bnnBLRDYVsFBXLq
	7mXI3RfEWpbu2hC6lPPBANZmVqkjxhSkIE6VbBpmmVchhR61+qzwQn7ZEW8cf6NbCjU+1S0wBj/
	HN4IP5
X-Received: by 2002:a05:6a21:7a45:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3c3ad6681abmr24319552637.8.1784682111151;
        Tue, 21 Jul 2026 18:01:51 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:50 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:46 -0700
Subject: [PATCH v4 1/6] of: resolve alias-prefixed paths under devtree_lock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v4-1-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=4285;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=mvQzRuDTBJ6+ciorG8UImWjndciZ5rWLRK/3Uj4h794=;
 b=OzzvHIxOPu4EDau/EvsGJu/uKjL5WgLPLHXetG+yEjzlxYClFWQVc4wBezu+R5zrhr0/FnOdz
 oBY6KgslNAzAW4KfWdlIUPhhsH7Gk7IhSZvFyoAB3re4zcxZgkcITZo
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

The name match is folded into one bounded strncmp plus a check of the
terminating NUL instead of strlen + strncmp, halving the string
traversal now done with interrupts disabled.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 26 ++++++++++++++++++--------
 drivers/of/of_private.h |  7 +++++++
 2 files changed, 25 insertions(+), 8 deletions(-)

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
index 0ae16da066e2..792756389691 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -215,6 +215,13 @@ static inline bool is_pseudo_property(const char *prop_name)
 		!of_prop_cmp(prop_name, "linux,phandle");
 }
 
+/* alias values are deref'd as C strings; they must terminate within length */
+static inline bool of_alias_value_ok(const struct property *pp)
+{
+	return pp->value && pp->length >= 2 &&
+	       strnlen(pp->value, pp->length) < pp->length;
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

