Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1453B6348
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531002; cv=none; b=BdAXQ0UO9BG2AIcTXRawbb37Xpi5zOlHF48/IwtQJxa1oL9H76X7crPRxN+iis0kYfJaHSmJookJlXpigxt9UDwVVLJjxfwRHhGzlDngkBPyGTPqOKq05RkNPf+Tiz/syloko4uyq1o4oGgY0UiYt8+TtdP1JbShV38f3uoVwVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531002; c=relaxed/simple;
	bh=R6tBpLfkSYlFbeXQtoe6ybjEQWYkSemCib35gwY2h1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVrT9xaW3N/V/UYXoiiTwhQFEufpd/fpx5HmpWe29WREQQow7jIDSSl6ffIws3YCvYb9A3nwIKFEsA8Gceac2nG0EsS3o2mhzqJxhP0x0oZB9iJVWYl1vsl0FfBUVyys67+MtopclXa6oLUiBP0PjGwCbKyvs3V17KtthW3LjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=clzU1yRn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="clzU1yRn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso7422636a91.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784531000; x=1785135800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb3SzunVzCrAW1kpVHD7vkFwItBmsZgciNXBopwYDGc=;
        b=clzU1yRniYhUJ6RtlG4JaeeE5wD57r6dTaYJZHMmZyUmdijQtdxQ1FFPglYfEb7pKn
         UeUe1MeIuAxoquYQdcM+GkfzCvMU5nWl3RkzrSdhTau+S+T5aHz/O+Xj/ueXkv9VB8r4
         1JAaZjJ6RIcKD581p+z6IsBWNpv2rsly8NaSCbYXDWU4mSsh0NVuB16Yd/mWEeQk0EV7
         +uysH5kOTcvFUgsOjI+4Oh8oDFgqXe3pZSi5i8GHtx+VIWyrMGDEpXVwQlu3zpVRXu/d
         pLcNv3qMomgyfYn9/8XC39PMzn3ZFjxEWwHvehpzavtwzxobt6k1qnfKGOe/fZzIrs3H
         YrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531000; x=1785135800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jb3SzunVzCrAW1kpVHD7vkFwItBmsZgciNXBopwYDGc=;
        b=gXAgm61aiR+3xpQ6QV/9e4Gb0oXu1TElGCa+S0DGnN83/rBMe7RxmexqaxTe6GJGmG
         OSzNg1Ejzet76KZq0wOXCOnceqMMWKf3RugLn7eD6j6PaXwKYuI0KC1SzOgWFI0BvzA4
         SzAv1S/yR23HmttBw4TEWSxijWAbY1KYRODlgjHruWpZ19xlh+ctR8hExM/Zj7gyYzQj
         jZ0RFpl7zyJEK3DqN3fhIwsHK4KXtyQgkHseQBzMiqpH9TY6FEBPzDzpDGToRwmd93pG
         cbXIwQIaRdZiEtStk3r10E3Wy0pY2i2267DE+pQtM0mKGlpxmCywPep/hV09vBCSjE0I
         SFKw==
X-Gm-Message-State: AOJu0Yy+CgcxnpIvIH2Msx/5osqld965YSpO84LItQmtb3wYKB7AYdkX
	Prci8ejPuh51VIuxNOdVmtytpww0na+o33Qd3mdEsGZxkstaXhsUSoQCaWdYjwrTZ9hQiqOdpWg
	djal5gVo=
X-Gm-Gg: AR+sD126B93l6YMyvSfNldsu7qWIYbXVJVGAYDZfL3cArvrcGtQQkQvYGC89XAAw8ks
	F9IEJSmeHzdrB0RvR2OgRj4wRIm09rTcgKZa5Ku9uG1iWIKay7YECmgIP4Ifq5KK2FIDYFFYuWq
	QU5ADDhQhc50UmWHlMb3o28D26TeENA8RHCDRJJCSLOBKzOlY+Wg53ljLWTJoqCH7vGjRokuw3b
	+fWRZPgHYu9OgkaIxoXcrUZ6aR47n+8VsWVTpdzJU1JSRAeUxfc1GHUjdkpeugY01vr3vGGefLh
	zSBWH5Sw940VZdPGrMBkzlURYRLeAIkTtRJeQTzIkKtGtr9ntAvJg3B7VJQtfxO0+jyoPx5hiwy
	cl6BULvugk/IDawyQ8m1pyfmZkkyR70NHlGxilIWUEF0mt5b4mSOV3gpKCWpn+tSHIlesDZPaAi
	QqmsoHVKZ39n93uh4=
X-Received: by 2002:a17:90b:442e:b0:38e:5701:644a with SMTP id 98e67ed59e1d1-38e570170d9mr7802747a91.27.1784531000271;
        Mon, 20 Jul 2026 00:03:20 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm463052a91.4.2026.07.20.00.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:03:19 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 00:02:51 -0700
Subject: [PATCH RFC 2/4] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-nh-of-alias-overlay-v1-2-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784530997; l=3039;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=R6tBpLfkSYlFbeXQtoe6ybjEQWYkSemCib35gwY2h1U=;
 b=TXgPnutlRoNe0Wge8odd/KK0fuVD2uAR0WfDoS6ArpQ035gAW51sflvkhAFsNWcKhhMyL6i8n
 0ZwMaNU6wZfCYJLakp7ZO/1psakX+WO2MNId8kmjZxsuiURfTE1nDKN
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..654a70d5cb07 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -693,7 +693,6 @@ static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +708,22 @@ static struct device_node *find_target(const struct device_node *info_node,
 
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
+		/*
+		 * With a non-NULL @target_base, an empty target-path means
+		 * "the target base itself" — this is the common
+		 * of_overlay_fdt_apply(..., base) form used by e.g. the
+		 * LAN966x PCI overlay. Any other target-path is looked up
+		 * absolutely, so overlays that also need to reach the DT
+		 * root (e.g. to add /aliases entries alongside a base-
+		 * relative fragment) can do so with target-path="/aliases".
+		 */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 

-- 
2.54.0

