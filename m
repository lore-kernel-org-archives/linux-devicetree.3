Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0C13DCD80
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961872; cv=none; b=Zy73+Ik4eQWrD86vWbfCZsvJLYULnZSpe7QipoYWeLy2krdqE7aA+/inM2HIpQ/jZV4yGp7Q0hPb9La0vpXgGsRI+AL9fziik8UrdJMFcTMg4hLelJddqsTrah4fU8LOdx6Zw78H8M+NePql9kkGh7OxSZRmcj7lLJrOYYQ2ChU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961872; c=relaxed/simple;
	bh=atzN4T9hnhv1vj0XHXj7Uq6H4Tt7kjsN5kly1ikRCYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6APya2I6ylRjxXqnp2g0DzSBb6y0neighmGEfzs5PdcdvS+/N1zb+9ClJwNbU8A6dLFj2XQ5brTGjFK5P+WCppa+bLuijxUkf6c1mfWMGLE6u0Uyw9RH3m6BpMc2OIua1pp2UkdVV9srAHzqzGINaytwLzEK59kgvDvUFOdfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QB6Lm+s2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QB6Lm+s2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so193677a12.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961870; x=1786566670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sO+CA6vi0PxBMnFwoi2jpRN5c1zZr3ozsf5hG18IO08=;
        b=QB6Lm+s2Wj5mt5GGugVq6uKwF4Ooe/PGdsfCEpRpR17QODjjCJN+AGhCXbmdJhB1U9
         o0LQGEQrbeGgvSKwWBZSyk6WIxmmfEJWuHQ4UHGmzx5Mdi3guO3xIXlgYDJU5171nwLi
         nKqkfsQ+nJP7+8mXvYAtxxFJwbUjxondi6+P/8P1weCI/WZTgBriVPNE1z8ZXbXFG1et
         UJj/XHymv27P2zAyI0RNyI9PLiEfO6MQbgLUJNlf2mOaBf2XIV4V1FsE8LTcjITb2fX+
         nHHO1Qoc5t/NdoNuvsZbJDpB6Btek/Yb7uo6EuEEqP/KBOpXVLgVlgImheh8vUkT54Ci
         KSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961870; x=1786566670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sO+CA6vi0PxBMnFwoi2jpRN5c1zZr3ozsf5hG18IO08=;
        b=TESyi/eeKdCqqI7vE9SocItH0jy/Ejq1nY9lbAdle5kCgGKCr5fZbmf5/VDk8W+RBK
         b+4SjljfE7n59UalsiN+iE6cyTh/U5Cs4jwn+zq0xUEolix9ckDYWTnTBuovgnof5+se
         hkYrjRsIVdJz3iazc1inTROi3uitllDd85aWwBMeesFmRlOkmdCx0McJIuc1c6B7T3+V
         IM+E1ztatkAnisJ2khiqaBHobwe2aYeaezdktDGlbIYSXEWCFqf6ewWRHGJ7C/Majuqe
         MQKqaHUN6IiIstKY5v0F25szggVEK2Aod3Dq6yz3N8b18ubo9lwszAdC60lFc+c3FvGX
         bvrg==
X-Gm-Message-State: AOJu0Yysdg7WrZ7WcDKYG6gS4ZEMzXg73Dt3BH0d1Lf0Djpyw1gFXkS0
	u44dH/1A0+8yJeBhgI8G1IG8eSUub7mPrGGngWAFax15EY0wAW5QS4l0eQW+9nbVXULv7vDuQpw
	F8LZwZDc=
X-Gm-Gg: AR+sD11VaDSyqgorfn1T3ygtIZwU1fN9ux8kCiioo9xnHzSSaCkn/7aSjVF7inDOTrK
	dKriOzd7Gx7an50hjKTmhMwwaja9y1GUlk9film6odJp4gwHc3EjsROYBigcBX3vNvblFsbnjPc
	YVLzXbChDGSbqsB9kJ/Hac9aeS2CA5zHk/Hfsmb0Qnk05vl68OVemQ6l2NSSOJhvOcQ+dykehY1
	hua6SsvyQL+VywRONoVi/DHHr6xHKPE58J/45azvMknzeu8JU10khQypBvKRbUG2bbD6c2ttwtv
	yBqgHDkdeNm6rXeja1AcbftcgYerkG1bKpeAQ1WVZUSb/3+lnhFocFq1lo2n4NuQZN5e/XoS/65
	LTyqCoMHbNou3AF7Fq2eaIfvEK8N8vUYM1TYf3TXDoVkDPb95/BfRpbQuxq2YUDHr/0oy7ukdOW
	EX8gusgLISHPTwhav8qoMYQ65B39l8ZpgxMAdEeixlg09G/Sxu5Eq+iH5hP+8EjMc=
X-Received: by 2002:a05:6a21:6f12:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3cb9c2338eamr2270842637.14.1785961869978;
        Wed, 05 Aug 2026 13:31:09 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:09 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:01 -0700
Subject: [PATCH v6 02/10] of: hold a reference on of_aliases during alias
 path resolution
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=3553;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=atzN4T9hnhv1vj0XHXj7Uq6H4Tt7kjsN5kly1ikRCYs=;
 b=zpD8Eoss32GAayLU5QhEFB0qX2rrxPr2H/0RMnsYHY7t/MvSAss0T7vtrDSBcB+BJ3Mw+mlPk
 fo6mOyTCWfSC37fe/pKm5kxeKnPziqO1u3pNzrfVOk6vmpT+L0cH07H
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_find_node_opts_by_path() walks the property list of of_aliases
without taking a reference on the node and passes pp->value straight
to of_find_node_by_path().

Take a reference across the walk. The walk itself stays lock-free
like every other property iteration: it can race property surgery and
see a stale view (a removed property's ->next is repointed at the
deadprops list), but nothing it can reach is freed while the node
reference is held. devtree_lock covers only the pointer load,
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
index 477017ed6f49..eca1f55eee87 100644
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

