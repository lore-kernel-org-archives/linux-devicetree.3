Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F03D348C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704454; cv=none; b=fh+cmRsO5a2sb4sC+jfczIWZxImL4m49yDRiJSbqbse3tB4BOhv2LoVF7GBZUOZwdz+UsNXW6J+zKZvW66/eNhaggq8awX/za9KjZ+MpYD/Qx+c8v+U1HHAclcHvLspHkrw2HOlRQS7zO1HrGECL8KWKN6bBfWPzCdxFYD4sfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704454; c=relaxed/simple;
	bh=kRpIeIkOBNbm/VqI0BkoZECW2QHfP+btpWk4Ns3ReaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXbfSxR/HfGH0Muw/z/+f5hfPMLvfEJBVdkXZl+BCHqKInivwWRkGOhQSBymLx5kWhJKKQk0VPlWr13HUKjt7JqUH0MonP9R9jgCrROSN76lq/bAZibmrrAiY7+LFaIJuFA+pKzZw3bEjB5OZ4a+dUyc+FMrXkR/aQ027/YR1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OjwfnqzO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OjwfnqzO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84874b52eabso11699742b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704452; x=1785309252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dw4LW8kSdGmcldnGWhnWc2M/cNC9RFM1UCRX4bcCtw=;
        b=OjwfnqzOak06zzN9FemLuld38DStyz/hNiP5E8G3FE3kEoQZxSVonULli1M9ClqNMB
         VqGHDrJChspNphhJvCW0b9CBZ/eAhveawXm5uNUWRubzjBg2delMM19IDCbC2eS+7ZKQ
         L+HIwuyIZDo3Eel/BnqthkVK3ybJMdFmDPm0KJAXTA0BY+wFTAquF/bHT0q5TIwEOKMg
         PuC3kWtg4mMJ9TwciWwzxRy21srQ7yW+y0LgmbJCZRBpzAtw5sEAwSzKyBl8DOerQhnJ
         4nWGv4tuyUED7tkc6zlo/ihwFug434FenZQs0yKeX3v/Oe8jjwsk09bk8C38QpDE+Asp
         oaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704452; x=1785309252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dw4LW8kSdGmcldnGWhnWc2M/cNC9RFM1UCRX4bcCtw=;
        b=EOKeJtDx5oXAi3RipV5M2dRZltoqMULf4ehxpw/IqMSS04ZKzhoc7FjC5z1c9qxl2O
         x3S1T9lxsLw4BmJPlNc3fBBlLYxXGmwN4EBZr6fTOn6/635ZIt/D6LN/n4Cou0NeLrL9
         X2oQ07DloxKbRVca/YFCRK+VSJ34gz/9wpfHSbTs/gxig0MvfIX9nVw2NPkBNBd+Jjc1
         ZSZzcbLca6RxIYo6k3s+p6QJTtGHg9xRu9NtSpffYPfwKR2+Kc7raMGW0eo4a5cQmtjh
         cNEvKC0x0qvyalmi7FoK5Zu/c7XAqF/TT+QRwROq/5ZiGJGORqTzp4P/lF0KvypZHDdQ
         VIjA==
X-Gm-Message-State: AOJu0Yxn9VgdG+hUGRiji2An8RVLuaQw03V35o9jt9tXrZsMLauztCUt
	6S+rGmIYNJScY5cG74CRQqxUHcxqZW/6194Vn8sAgadOkUXIQolchKYPImDRVdUmOxvLVZfuH6L
	LbsAsOb8=
X-Gm-Gg: AR+sD12TFjIQM7jsUd2MRd4DNPE7Bgh4aUXddJFptfiIAncRp62FczOnK4yMTLqRf25
	OfQk7Xnjk41GNiaPpxc7VFcgiRHeMJJ+BRkeSWofSAYJ0OdArNUVwXtIFc1urI35a6yu1Px3ca9
	pU40CTkbDBhp62r3BaT6CXmr1MpWErrACV3DedLHg5KS+hFIOEfWl5lC9Cy6wH/H1JjOao/AluB
	Q3co/2ADbdCQgoG2+e91Eb7QoBiWHaFZC4hAyBRUSGowfZdx7dSPT/ajdSLuwaRHcaYhMxUIR1J
	jvqSWxnPE12o+nfJ6ksJxoNZOtNjeFq7KCWEPtyBQBV1LYSNFgYG7ZwmywR+hsvpLIQqIe3Oxq7
	Rv4e9I3ikHiWUymrmyliyVqKDGqzmuIe+erGs6gSVmLU1dT9yS3BWF+Ng53As6syvbKIsqX+g4z
	S/siYv
X-Received: by 2002:a05:6a00:a253:b0:84a:6e0d:692d with SMTP id d2e1a72fcca58-84c294d4bdfmr22264981b3a.46.1784704452418;
        Wed, 22 Jul 2026 00:14:12 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:11 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:08 -0700
Subject: [PATCH v4 3/7] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-3-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=4474;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=kRpIeIkOBNbm/VqI0BkoZECW2QHfP+btpWk4Ns3ReaI=;
 b=5knW5jjfI3OWoYNxxiYknjtFAvioJZ6zfPSzSD5HXNv+ixHw5NaMxUWPtAhqCJiDmEQYuqkjQ
 MFxlQG+eFdHCQ+l121Y7ejnfIZ38oyIU7+GBUCyW9+XK6BxIeK2MUyD
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

When of_overlay_fdt_apply() is called with a non-NULL target base,
find_target() currently concatenates the base's full path with every
fragment's target-path via "%pOF%s" — so target-path="" resolves to
the base itself (the intended common case), but target-path="/foo"
resolves to "<base>/foo" (never the DT root) and target-path="/" to
"<base>/" (never a valid node at all).

That makes it impossible for a two-fragment overlay to modify one
subtree under the base and one node at the DT root — a shape that
arises naturally when a PCI-attached device wants to declare its
peripherals under dev_of_node(&pdev->dev) AND add /aliases entries
so alias-aware drivers (i2c-xiic, spi, tty, ...) can pin bus numbers.

Treat target-path as absolute whenever it is non-empty. An empty
target-path continues to mean "the target base itself", preserving
the existing shape used by drivers/misc/lan966x_pci.c and its dtso
(the only in-tree of_overlay_fdt_apply() caller today that passes a
non-NULL base).

Spell the new contract out in the kernel-doc for @base and
@target_base and in find_target()'s strategy comment, so out-of-tree
callers that modeled a base-relative target-path on the old
concatenation behavior have a documented signal that the semantics
changed.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..74aea704835a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -688,12 +688,15 @@ static int build_changeset(struct overlay_changeset *ovcs)
  *
  * 1) "target" property containing the phandle of the target
  * 2) "target-path" property containing the path of the target
+ *
+ * With a non-NULL @target_base, an empty "target-path" means
+ * @target_base itself; any non-empty "target-path" is resolved
+ * absolutely from the live-tree root.
  */
 static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +712,14 @@ static struct device_node *find_target(const struct device_node *info_node,
 
 	ret = of_property_read_string(info_node, "target-path", &path);
 	if (!ret) {
-		if (target_base) {
-			target_path = kasprintf(GFP_KERNEL, "%pOF%s", target_base, path);
-			if (!target_path)
-				return NULL;
-			node = of_find_node_by_path(target_path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, target_path);
-			}
-			kfree(target_path);
-		} else {
-			node =  of_find_node_by_path(path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, path);
-			}
-		}
+		/* an empty target-path means the target base itself */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 
@@ -737,7 +731,9 @@ static struct device_node *find_target(const struct device_node *info_node,
 /**
  * init_overlay_changeset() - initialize overlay changeset from overlay tree
  * @ovcs:		Overlay changeset to build
- * @target_base:	Point to the target node to apply overlay
+ * @target_base:	Target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @target_base
  *
  * Initialize @ovcs.  Populate @ovcs->fragments with node information from
  * the top level of @overlay_root.  The relevant top level nodes are the
@@ -982,7 +978,9 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
  * @overlay_fdt:	pointer to overlay FDT
  * @overlay_fdt_size:	number of bytes in @overlay_fdt
  * @ret_ovcs_id:	pointer for returning created changeset id
- * @base:		pointer for the target node to apply overlay
+ * @base:		target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @base
  *
  * Creates and applies an overlay changeset.
  *

-- 
2.54.0

