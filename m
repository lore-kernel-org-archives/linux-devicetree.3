Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9723264F4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776790; cv=none; b=MxHpssLw0dMVK4cL4nZp3J76bSwA+ZJRC+s7GAVr39cSzWar6iNqPLxxNlakDmIvbBN3TMRAM7U1XVLAB1XQT0hhuHX1t85qD0Uc/BnRrFdfOAGyMfQAV+wSvry9veesYN+1wjrSNiqcYOXBemLcx2TM9WPnTCW6D4FHsLGKO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776790; c=relaxed/simple;
	bh=mqPLl/v2ZHb0lLzVuot2WAO/fbk6bhNfmEWM56hMkfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WMnmv0CaiAWnyaqHBRE6aYdjVQLCKbRzb886XzHtQQpALQNoYeCFijdKJoKa7l2FLs11OEEMy6dbobX0DTmFxddPpx5V499v7nVdqyrCF43VEIBnxuTFIeMnxfQyvpNUNLP5U/JqWdAG1h/A9KhmZC6hSlUeo2oaxkE5FxZL1x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=daXL+BLk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="daXL+BLk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso170355a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776789; x=1785381589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5//9/KNpBeXSP8zMdzS59AXFLM3ShB/lPJNb0W6WwR8=;
        b=daXL+BLkrOE1UUgGVn7mHWYmPdd9LS/KKD6pCTktEwOYvLAR52GABoCBa1oAb33Dm7
         mTaI2FMZxfJkul3G6Dfwqji+6t63/N75WDytG1dGTBPf0BUIyD2gIUW2eRmg3nC7qY6g
         jdUWBfg1gucRCZvFiKMyieMWqL6ONIfKnhEeU5gMOnUPrQ8F6xPNgc+HWoj+ICG3zaMQ
         7byHJuyevV1fgV2qmDxYfDgUAqsfCDjuJBrr5osCWA1ijwM+EjZxwLDJpTWZDC73duL/
         o2wjjl28xf9UTNkwaIlQqYQAH7AQVAKiuUiWJxcBulgMQ24BIId/JF19jDY6V1j2YWtw
         4lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776789; x=1785381589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5//9/KNpBeXSP8zMdzS59AXFLM3ShB/lPJNb0W6WwR8=;
        b=e61arIKEGawVIug3oupeZUbmHMD0s8ZH8w2A/yJJm49kEDs7mPWxSvnpYxZGI3txi5
         c3vqnoIeXBK6mVTVuCFtc+JtO/8z1atv/zH1sJfeovs5e55DpQqAxKmuF8KPO5AAmbev
         HCUgAQJh//oYGNmdDU7MaLmnuwNtcgp+KCDEHbkAw+Z46Hjj2g57cTxxDIqAnwoyNkrd
         UdbHlhW5DLXepFUhZvOjsBcohU2XSQaPIK7wSpqX3zSEMsOwr7Z9iNstFLSe+rz5mvNi
         +GR4lAAiXrwYOyYHpLNpGf/7Mb+b19IjZsQ0REh7ohCaWmgstRyrV/cQIN72t7yKV65E
         r8fg==
X-Gm-Message-State: AOJu0Yyc8wsGW3N3nrcqjw2fZTFf2QaV9YHDzCWz/iDfbq/cXT4ZwCKZ
	oLRor+VSIv06Oi/DeZSr+SMdmpZYb0UmybetdT13tIcSGRIpZN64nNQBWGy4AhCra4C5s9rGnLP
	2rh/DK20=
X-Gm-Gg: AR+sD1348rY/CzVcd8yllBtGG/e77IQ57gRUJLu4tXqlMhs3krNUgXK4hwcMkdIBftn
	JQ2StDgMxGbLpzcJ8rWOyb+Xxu7BTOtC8fuMyopVyvaWRHbwauKmObLurOBAo9aDeNU3KkPPswM
	A6Fwgkb/3Yuc7U+0ADvgYLP+iVfyHvtVo3UF4lcxTXcfI3jnjdmO18vs9U7sWTbKCJXgph0uNc2
	eGWUVQtO4pNUanZPjJqrfwGy9JqbEIxY7oblfr1Ct+pT5zcZ3lnWdRKkWVQyZZWUs8OgCfR1oMu
	yZibKmu/erPGeMIZRhnTXdFv6h0Uc5JCvq30IBJyq5NgZ9k5bCF1H56AgyHC8vvpFhddreL2ydy
	Kc5Z8hEsPgYhYoTD45taGa7TkZ1CrCm++UT/rHyaTMVLQMDFWmO/ng0h12ES/hYNfFM4r1uOUhM
	YZJRa1
X-Received: by 2002:a05:6a20:a11a:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c44b2ae267mr1175327637.76.1784776788955;
        Wed, 22 Jul 2026 20:19:48 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:48 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:42 -0700
Subject: [PATCH v5 1/9] of: hold a reference on of_aliases during alias
 path resolution
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-1-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776786; l=3488;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=mqPLl/v2ZHb0lLzVuot2WAO/fbk6bhNfmEWM56hMkfA=;
 b=Xl/x0shU9GkzO2aja8I28OdQaRhTZbm8kGwloGLtBnwAVS4mJ7YxVwm4H3rAZJiH465Ja2fte
 kzUTcopl18UCP+C7AUtIsY2EU99ueobWyHkfKrHlXL5wQSBFeDJRiRM
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_find_node_opts_by_path() walks the property list of of_aliases
without taking a reference on the node and passes pp->value straight
to of_find_node_by_path().

Take a reference across the walk. The walk itself stays lock-free
like every other property iteration: removed properties keep their
->next and are only freed when the node is released, so the node
reference is sufficient. devtree_lock covers only the pointer load,
pairing it with a later patch in this series that clears of_aliases
and drops its reference when the node is detached at runtime.

Validate the value before resolving it. of_alias_value_ok() requires
a non-empty, NUL-terminated, absolute path:

  - an empty property has a NULL value and crashes in strchr()
  - a value without a NUL inside the property is read past its end
  - a relative value naming another alias (loop = "loop") recurses
    through of_find_node_by_path() until the stack is exhausted

All three are reachable with a malformed boot FDT today.

The name comparison loses its redundant strlen() pass while here.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 20 +++++++++++++++-----
 drivers/of/of_private.h |  8 ++++++++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..6f79f593fc77 100644
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
+		/* the load pairs with writers that retire the node */
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		aliases = of_node_get(of_aliases);
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+		if (!aliases)
 			return NULL;
 
-		for_each_property_of_node(of_aliases, pp) {
-			if (strlen(pp->name) == len && !strncmp(pp->name, path, len)) {
-				np = of_find_node_by_path(pp->value);
+		for_each_property_of_node(aliases, pp) {
+			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
+				if (of_alias_value_ok(pp))
+					value = pp->value;
 				break;
 			}
 		}
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

