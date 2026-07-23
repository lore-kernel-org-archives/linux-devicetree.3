Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8190A3515FF
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776807; cv=none; b=NgIcorjfa57IW5fKEHsb9RluH+vIMCPZpEYz5bm5c115d+gxSLC0jar/eLT2/cE0fXL2C/YnQypyM+y776/Eplu6be4O+oxCm9ZIAGTL1zFouPrDSngivszzQziobaoCLuSRfGUuMjc6kyZwhNmTsFMFHkk85a0TKejOHK/Uj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776807; c=relaxed/simple;
	bh=dNyq0gHVNROKupjvqrJOvTkgnMbbqscYff0AMbsn6hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEnyJojsA07F99TDP6UW4EfJh7bE+i7Y5/W1MG1pFyXylmQhN84Tx5cxAlkyfyrwdSj5gWaEh106KGYUVods9G5/skIdfcWrhSKcAYLLhtQ0DS3aeYTOlzWys0mJzRmU4r7BrqYmqPDXqBFYeRf+h+91f2sGBVco9UhSJxuIW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=kQ4BU915; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="kQ4BU915"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso221590a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776795; x=1785381595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayHuk5PnsCTzmn51E1l8BC7HjdIcsF327JBpGTA4oZY=;
        b=kQ4BU9151vu9LSDMyOdY74diyZNgSHQyoZCClQw5pJd1RDJCpYC7UcTB94fBQVot7C
         7J4sAs0RYrw6mk8IcBZsunZWmCqT4hJb3PsIuc/Q4jQpwLD9qilVlYhJm7rT6qprdRXY
         MVML5eKS1aFLQ1dnxY6wUbBSZe/zEf1pwMRf7R/S/Z56wV4sV/qtbKi9ChxLpE7NURdg
         BdEBwnU3p7X2WRe2HSlQwf+ovyWM8EnHnpL5CltdUJt2gE7vaz/JxolZlyFd6/+6P/gm
         VT2GVWRpUMLifrX2qMEqNOGdblC8mnYSFck2V0SqFntHPLpdcWZalLBL/eBXtXSAXx5A
         2ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776795; x=1785381595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayHuk5PnsCTzmn51E1l8BC7HjdIcsF327JBpGTA4oZY=;
        b=jksSHibHPOj0YpnXeXGiM2Vq8qdCC5t2yZoPt3taXeRMcqR+Twv3fMxh/4coDIxybm
         vR7Ex0coB3CNdke7yNR7hunWchtJpq2OCXubEL5wuHBfr/cH8JcUcIlQEFO83LljtRhj
         ISydy7MjM1TQ743sxbm9vgQaciXwzlAvuv8g6sAnCS80m4Jp+dE+Mx5sMclIxOoFS7Om
         WWLAbBjHRfIM8HngnddzS/5Xn8rl8UJDn4qXOpLC329Do9+BDIIugEfgN6CUfoptlLWD
         FcvUpRbYKFKJjsuLKKJMn//SFnN0wQSK0abqTKRKrod+8MXTa1+2794iNAN+5pfONigO
         VR+w==
X-Gm-Message-State: AOJu0YwfiDuxwOL3cMoly+FZa4itNGWUzfPlPHRfdqfwqjX69u61A8ao
	4x9W95C2Of7jXSZz0NEpzrEtvv0+BoTXqNlYllhwKbmdQibkYAw1P2lXcI07/Z1qhxrCHD+13bm
	0gYantV8=
X-Gm-Gg: AR+sD11Ck39qColPKRHfiQUltW11q1qdVCM3lA/04fpR3fL/FmQJp6pTVEZk9StHOBM
	PTTv3/Rj7vsGYydj5fyafiYzzSnICxf7az9Fd+/IIOdYIePgzTwhEJvP40zcZL5mvZyQa3dytwB
	7SsxtIcNmKxeN/IKV7BZ4a5NIeJnfFdtgn3gkIcnv8PbWF3dlbVGY6Pzdi/RKcTeSA3na7Ec6U+
	CY9T1Yq7OUkErDc9SOO1PCiCi9R1CA7rT6DC032cvFcLJSHWwugBa/l3q84iKPxJawNjCR6H/4f
	Fqb/hcpHvHTxcd2wTR9Jh4Nnh62HeaGXsOIeuTbrCCaxyPvYzsI3HW/xa0Y4OY6gsGYbqQwroca
	HlzPZ2rCS4YjtVkgfRtWb0kydsRaY0M9gRcmJ5+veiY8xi2QhJTJF+HhWB8vJZbF5W0A2Tk9xoe
	bV9Dp2
X-Received: by 2002:a05:6a20:160e:b0:3bf:6237:b1b3 with SMTP id adf61e73a8af0-3c44b18ab60mr1411395637.42.1784776794761;
        Wed, 22 Jul 2026 20:19:54 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:48 -0700
Subject: [PATCH v5 7/9] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-7-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776787; l=4346;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=dNyq0gHVNROKupjvqrJOvTkgnMbbqscYff0AMbsn6hU=;
 b=kC5kSAp5GOx2zMzvch84da8f2mlE9W0fNMOUFW9mtXRM/LCfA7FlSN3ILaTVe6KfBg1IVE57x
 EyUbhk1D+9HC3nU0X5UmZXh5OYjPZZBMD52czBWnqQ8I/DLt1kOxsAH
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() returns NULL for malformed values, for
values that are not paths into one of the overlay's fragments, and
for allocation failures. The caller reports all of them as -ENOMEM,
so a structural problem in /__symbols__ is diagnosed as memory
exhaustion.

A later patch reuses the helper for /aliases values and must handle
the three cases differently: copy verbatim, warn, or fail the apply.
Return ERR_PTR(-EINVAL), ERR_PTR(-ENODEV) and ERR_PTR(-ENOMEM)
respectively and propagate the errno in the /__symbols__ caller.

Also verify that the value descends through the matched fragment's
__overlay__ node before cutting the prefix. Only the first path
component was resolved, so an absolute live-tree value sharing its
first component with a fragment name was sliced at the prefix length
and rewritten to garbage. A prefix mismatch returns -ENODEV.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index c6962e9948cc..1a2df83fbd8d 100644
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
 	/* a root target renders as "/"; drop it to avoid "//" results */
 	if (target_path_len == 1 && target_path[0] == '/')
@@ -284,7 +299,7 @@ static struct property *dup_and_fixup_symbol_prop(
 err_free_target_path:
 	kfree(target_path);
 
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
@@ -353,6 +368,8 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
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

