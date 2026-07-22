Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85733DDB03
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704456; cv=none; b=aULVwjz/mh44HmpIzomWG7e9oBK4GX11UQsZrw28oxujsWZm3XJs8GQ/VhYVfwjorobd1ZQInNfAW5F9+6gkY+FNz7FSqAKp2CHea+L0h7FEt5r5OFlLynxgq7xoFjUJBFD25Nxoq1YJckgApqgh8vozpD1IPw5fSbPA6mqhi20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704456; c=relaxed/simple;
	bh=56EaOWu081VTlPQJyGRihYZBiu5C/z9UW7OFVNQGU1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A66Qkn4t1HcEmRljATicyTzzIkv+rWejZE3Y6igVI9MvqOTXGamqz4yRMIKGqoto9Ra/1x6raPKtuVSwiMGZxJRNTI6dWTB5NFXllpC2yg48lh3P4O4Eh1wy1Iz82ZWl3TDSyBSuWCD26M3v77YDYt9amPoLVb1jpuNlqSgp6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ijxmvbWh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ijxmvbWh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848643382fcso13155433b3a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704454; x=1785309254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzDaZAsTcNrLrR0gCV37X/IPnoIRBp6UhmD6467PjVk=;
        b=ijxmvbWhhl+nnoU0OJIGFM0rmt6+7EDcA0cm9HsGJC4LOp5hR0g/7GtjCX+6qLHtTj
         HunHFuINTNldLu0/tk8yqZ4Utu4r3vhXnfQXQf0+7tW6BT3sWK1cIlxXo+bv6GeKINc5
         bukCgj6GK+dmsZmm8zbgke9xSALsYL72g2OnpCRVNIRX2cgiekFwJmCai48MxTN6LxUK
         gKu/HR8wOw6u44bOnRHWBbt0WnMisf60LclfA1ZNnwRpe+2Wl+ML1t3yATVLUldNe+4T
         tsMeT9qOEdNjNNfxHL3+VJrJsjaq0sMBs3qGpCRArzNefPdP+fHEH7FaxuchTR0ZzjLx
         mcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704454; x=1785309254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzDaZAsTcNrLrR0gCV37X/IPnoIRBp6UhmD6467PjVk=;
        b=XUQPczULGV4zC8QvM+pJDJyHh2cFypPXKtUqMMsBH357aoK/RPR7+4o4d9tDQfPUqF
         2qG9inEU3IHg70VLLBUwN07eIvPbklMZMMLqOn5jZsYzuCCS43fXnKKtih2acFkUk2By
         +8A632X/+7foWhxBS8PLM/6AU4fzFlFwLhMJ+ZWPJ6pwOdzqTkbCKjqXreVdSNN5rdSu
         8wn+3O2E5SAWD4hE6OtwXzdtWKQIqdrtjKZw9oqKWLCA684FwCwvc9cLm3FZBupVOQQP
         G/k7vstDd3EO96VOctCVasnv96BwBBp+W3QGpeOBXdSt+5g2kyuyNU+C25xD8XvXexfu
         8lYg==
X-Gm-Message-State: AOJu0Yymt85GQYIeokuHJYp0E1bQuNvjjQXlUNIi5JLCnWgDSDhqx3Rk
	Z5QnWWLt1tB9a/wBTW+FXkdGlGRSUdq6awYJVAJNNrNjaOtMBdNyyNi3rTEUVttvmFGMVH9rlWo
	30rYTkio=
X-Gm-Gg: AR+sD12UsFhd8BbUuJQF6qKFLsXxtufNzCg2mfbwJKSV1N9hMJ6muncADw76D9bHQ4g
	S4LMnczHpoTKHYFEU47wsea0oMmGx1LQPcIPzhCHlYdCdh2NwuetQVCAAsEnf89gWKquH5E7e18
	0/RbtqBTxZoAtdxZefr7PqYjoEKUDoc5bSaiv/aCtr9Ooe2PxaiFeYdYyxxBblOiZNsNjnxwppt
	N1Qiqu9Vp4kRKnDbZK4IqD3CMLDM1Ja10Rnrsgxdgq2jDhy5N9WHlAimkAH5Ln5wPI3SKFObE3G
	Fod6CdwzL9EH8TwyJSwC3ejPTBFb6hRrBMWxc8hJz0hOtKDdh/5gue64YYrBl/aK87cOeGtPaJQ
	JEltPkA9aObtYNWsW3qpPr6IFry8vz37S0CRKhiCOf3n4gVSvIsZcQyST+gUIAaPQho+kax0Nu1
	D0b047
X-Received: by 2002:a05:6a00:928f:b0:847:9367:e054 with SMTP id d2e1a72fcca58-84c2950185amr21414583b3a.57.1784704454284;
        Wed, 22 Jul 2026 00:14:14 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:13 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:10 -0700
Subject: [PATCH v4 5/7] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-5-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=4996;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=56EaOWu081VTlPQJyGRihYZBiu5C/z9UW7OFVNQGU1c=;
 b=Ufc1sozpdFdWAt07dAHXiTNVa9LBYKpx58iwYkv2MmrwuzUkdtXciJVER66cMd7wp+jk9aLIT
 ojJ2maXobb7C+xBZxG7A3shgh4WgZL/3j1HUEr7Bwpq+8P/zxIr1lNv
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() returns NULL for three very different
reasons: the property value is not a valid non-empty C string
(malformed input), the value does not resolve to a node inside one of
the overlay's fragments (not an overlay-internal path), and memory
allocation failure. Its only caller today reports every NULL as
-ENOMEM, so structural problems in an overlay's /__symbols__ node are
diagnosed as memory exhaustion.

The next patch reuses the helper for /aliases values, where the
distinction is load-bearing: a value that doesn't resolve inside the
overlay is a legacy alias that must be copied verbatim, a malformed
value must be admitted inertly with a warning, and only a real
allocation failure may fail the overlay apply.

Return ERR_PTR instead: -EINVAL for malformed values, -ENODEV when
the value is not a path into one of the overlay's fragments, -ENOMEM
for allocation failures. The /__symbols__ caller now propagates the
distinct errno instead of collapsing everything to -ENOMEM.

Also verify textually that the value descends through the matched
fragment's __overlay__ node before slicing it. The old code resolved
only the first path component inside overlay_root and then cut the
value at the length of the __overlay__ node's rendered path on faith:
a value like "/soc/serial@1234" in an overlay that also carries a
hand-named fragment "soc" — or a /__symbols__ value with a bogus
tail — was sliced mid-string and rewritten to garbage. A prefix
mismatch is -ENODEV (not an overlay-internal path), as is a value
shorter than the fragment's __overlay__ path.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 284c9bc6c9cf..d4d2591e735a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -206,6 +206,10 @@ static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
  * The duplicated property value will be modified by replacing the
  * "/fragment_name/__overlay/" portion of the value  with the target
  * path from the fragment node.
+ *
+ * Return: the fixed-up property, or ERR_PTR: -EINVAL if @prop's value
+ * is not a valid non-empty C string, -ENODEV if it is not a path into
+ * one of @ovcs's fragments, -ENOMEM on allocation failure.
  */
 static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
@@ -217,6 +221,8 @@ static struct property *dup_and_fixup_symbol_prop(
 	const char *path;
 	const char *path_tail;
 	const char *target_path;
+	char *overlay_name;
+	bool mismatch;
 	int k;
 	int overlay_name_len;
 	int path_len;
@@ -224,14 +230,14 @@ static struct property *dup_and_fixup_symbol_prop(
 	int target_path_len;
 
 	if (!prop->value)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (strnlen(prop->value, prop->length) >= prop->length)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	path = prop->value;
 	path_len = strlen(path);
 
 	if (path_len < 1)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	fragment_node = __of_find_node_by_path(ovcs->overlay_root, path + 1);
 	overlay_node = __of_find_node_by_path(fragment_node, "__overlay__/");
 	of_node_put(fragment_node);
@@ -243,18 +249,27 @@ static struct property *dup_and_fixup_symbol_prop(
 			break;
 	}
 	if (k >= ovcs->count)
-		return NULL;
+		return ERR_PTR(-ENODEV);
+
+	overlay_name = kasprintf(GFP_KERNEL, "%pOF", fragment->overlay);
+	if (!overlay_name)
+		return ERR_PTR(-ENOMEM);
+	overlay_name_len = strlen(overlay_name);
 
-	overlay_name_len = snprintf(NULL, 0, "%pOF", fragment->overlay);
+	/* @path must descend through this fragment's __overlay__ node */
+	mismatch = overlay_name_len > path_len ||
+		   strncmp(path, overlay_name, overlay_name_len) != 0 ||
+		   (path[overlay_name_len] != '/' && path[overlay_name_len]);
+	kfree(overlay_name);
+	if (mismatch)
+		return ERR_PTR(-ENODEV);
 
-	if (overlay_name_len > path_len)
-		return NULL;
 	path_tail = path + overlay_name_len;
 	path_tail_len = strlen(path_tail);
 
 	target_path = kasprintf(GFP_KERNEL, "%pOF", fragment->target);
 	if (!target_path)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	target_path_len = strlen(target_path);
 
 	new_prop = kzalloc_obj(*new_prop);
@@ -281,7 +296,7 @@ static struct property *dup_and_fixup_symbol_prop(
 err_free_target_path:
 	kfree(target_path);
 
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
@@ -350,6 +365,8 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (IS_ERR(new_prop))
+			return PTR_ERR(new_prop);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

