Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982D4A4F00
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019857; cv=none; b=fV/6EgWdppfEwm2IEc89nKCLgBzNzTKZwgEJGwHj6/KdkfqgTE6RXqb3Mwd4Pbclk6rjON+dFK985yAJcBQDjZX7DzTFokxzt9kp7GM14taC1mm6MEY25S5babCItXumIz8fZd5AlQE6P2WzOX89eAplmvCO5COlZZvI9sHuxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019857; c=relaxed/simple;
	bh=qwYBgabraluw+YhiN1swgdbSwD2oWn2nC65v/XDR6Ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6JIBizKS2ECfEREnIm8gcC/p2Jqzh4Gd+8lPeqUYr2Tg6d7OzRWq/iy7AvK6s+vzBAyVxGzBrubOfo/6kOGlmO+3XpBCyfgwZAlKu927PGOYelCwwQUR/ByKXEMUYiRZ0dY1bvdx/1qVfOzMvzkIBSxHXSySu7k3NsQz4hWD1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QIZjTfkR; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QIZjTfkR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4817669eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019855; x=1792624655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8ofDQw8jOAHMvcjyLrF2fZQrOurfMkTq6HZ9r/cLIY=;
        b=QIZjTfkRqTboUDCIMP63GrIcQbcCuGU4/saeRUK9yGqoKSksCjCdx6bNrAWtwp3XW6
         lkm4b+vVuVF83WJclax3LdKptdbwFHTBASuY99H/pdizreLYoTae/mrXM4Y8efKckb50
         qpPX8d4xl8uSpfdStBkmqdD2MzPNqTvyvN+KbHPtUdZ+Xqir0l366q8+QuXW3wq1XAMk
         +3RGDWJysMkDAtfHHdFcSXc3h2wxzzE24haXm8AM/HP1ys+pgs8Pr1mneuX517CX2Xuh
         crO3zSsEkdXYwCBzljRNnUDWMzk5r49CoJjtLAFZw3w2ZJf7kedDAGyj3ijpFk5Ku7GH
         Bmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019855; x=1792624655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8ofDQw8jOAHMvcjyLrF2fZQrOurfMkTq6HZ9r/cLIY=;
        b=yuTjy4O0D803BUM9OO1yHvL1rFsFIsCYiWN314eGzR6bw5n8IhIR2CGLU+exZjgEvz
         M9XspulyUotK3JCU7QEvxX8SqbT62a1OtJyUa5X8M6TCbNWJ9aIMnpdF9wQqKEe4zkS3
         lZtPqJnP2qCh099RmU1Hp7xwCamJdxJErW5peqYXorFaM/EgwsEtfx007oK8OqiJBb/+
         NGnsfe8f1MQRhIjLDtqqSvA1OSG4Q2XUovian8YgBZ8DwVoyni/uecqvGRCb0ESz51w/
         DA6mN8HrQX58Pw6DhXJ93cUWFO5+XjYYlbMLkMB0rxgnXYmFzfqp7MkOI4RHdERLTs5y
         L+4g==
X-Gm-Message-State: AFq9FYLbRnsKU6eiKBTL6MjyBPZlbalTGdGksUDXRrxyaGfC619393Mh
	5jX0SDlXycMYYmJRQ+zeLtbIzoreBFBGvgf8NO5Nwks3zF0Pidwd1+uVnrX78TM/4pc=
X-Gm-Gg: AYBFou0Rr6SVEXMpFIrNS4XI3JNL7ahQG7HA8HbqMsfuKGDS350ym3eUEs0OQSQWGyM
	A9VDO3fwwoZyuMh3axo6REoPxOkqhALOvXpU7XiKkbhGnF/U3gO1QDEelLF4Yg0+cmu5nrqeoDm
	Ii+J9Z5yK2Dbpn4JmZVr33a6eAK6T5gUKABRT/VC3moliLIfpQu1hnu6BzqKBbVkOHVFEa4+MP6
	HHK2v/E/Gx5WgbM2eOfMYJkDw4nVtY/ZhqCUUt8qDzKWiL0nrJV5IlMW/Hq0NBIRrMpICCoY3B7
	hqVEs7sSTcRjwwPSa1Ay08T1syVRRy+giiDnRxpeefrF87gOxope4xW3T0KD82d6SDVJJ896vqk
	G/heYn4H3LFOl5xAskCqiGL5RHsHAN9MOs1VEHHnipLLZuqpzlSWBPIkioEjThoqdjnjb0jWeNC
	XEhKSi3uW/ttEqyob3vVtaEZ627nEFHbmO/mQEKgFhSw2RuRlAzG7trwmxsoTMF3ciA1xqfzWXj
	fgC4ldrtXMK
X-Received: by 2002:a05:7300:6825:b0:353:8103:ecae with SMTP id 5a478bee46e88-35381040302mr23318292eec.23.1792019854539;
        Wed, 14 Oct 2026 16:17:34 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:34 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:27 -0700
Subject: [PATCH v8 2/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-2-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=4313;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=qwYBgabraluw+YhiN1swgdbSwD2oWn2nC65v/XDR6Ls=;
 b=Q3YkMnyyJ/SXzJPTR01/Z52kz71WRJygjkhyWpATDG43/4q/O1ldxSRTsV+iptbNSKy3Q1xKk
 3PDh0I8ulfnCh3mGaHH/TNLJ0au4kTkmZoAL7GBuJbcI2GaDrennwH5
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 6f2d7872028a..bc0c879dd807 100644
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
 	if (target_path_len == 1 && target_path[0] == '/' && path_tail_len)
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

