Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3130C60D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711430; cv=none; b=IreIqvZMhbhox26NGA0qfWulzh2hpz5euhpzJfuddIFFLaCinupecGE/m/qw6TvK4r6rJzV5mN5JFIz2qf185TfLGPEjFr70uz0wlpiMpXrhelm8k1mLoFKQ11ZSuYVknRrauDIPLMlf5rwVGUOfLLoTJMY7vJwpum59hiPBzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711430; c=relaxed/simple;
	bh=h9iNL7GcSDIAkVpPEBDpEbAJy9stQvpAtUfYK4xo1NY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW2ROhIuPbVCM94iI/8DMJv/lKw1qc+eNEC96NGWdAMc4rS67lSF3oF2ZE/U6p/XCmZ11iW4Hg73Pe5c6A/gL9BWbXhdfAkYNTrcQadViYj4yk5/81LRShC1G5pI8EezncC/vis54i/rni0j8QqMsRtnKJui+ewtKU4LJH+jgkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDXODRjd; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDXODRjd"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2ba4efedbeaso72356155ad.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711428; x=1780316228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=luD6oCvODFwNGsXqoj4sMPhB9qkWWUzbgy0pVHbWtks=;
        b=ZDXODRjdBL2TLyjmxhcgQl20I7+ZudxfjizJDk3rwKwko1IAxLNpsGydtAyLkLA+JJ
         XUEBMbjw3DBcOKNnestTDWjVa+S+ERHR/zqE5gNg4Z7Q9AYtdeid6Vpx3EGzoOR2Aucp
         W7Yhj3f93oTut+L9j/rrgBpn/6vIuuqcBgoldnScpGH2W34iliRlnUs+0ddyWp+V9HjH
         q/fi1mzREs+0auGABZ/qeoP1OEidzupa10yMV/4yW0rlmitjX9Ks2STCkE+w93BqkTif
         R9HpSKuVvVOZy/pas1j6aKXf76yftyaVe0AtTuqh9jPKRxpvsUfhZnONPVy+UM4nFAlS
         cqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711428; x=1780316228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luD6oCvODFwNGsXqoj4sMPhB9qkWWUzbgy0pVHbWtks=;
        b=Nn1zURdQz/ROFPj1TfISHj57mZQiwdvPAWKOEeVo7fc96coWtpFnlktPMM10Xc3XU7
         pQ93hLudGDlruaotGBon9uYnCr3qPxWKj8g2L1bAYh+JX5BGg+bIaz+w/u7pual3V3kX
         QYeXw82blj/P1NLSltvXMGa9Q0iiV4HTioH/3lSUcbad56xcJii6KWE2prOWosU1yuQS
         jrQyTAae8brMrNpCT8tnoCSzuObhpbruzE3Ee7LZvy/2ZDnJAWaxbY1ovkAZtLWJYzB/
         pAHNDsssP3MKzBVqFqbDfOwv3Nq8g+NPZEwLvtXkeowH+auv/lqgplhRA0fjgQ9THANc
         k9lg==
X-Gm-Message-State: AOJu0YwBkzb9K7PgBmwiG2dNljsj+eNL3Fvo7m3xXIrerPa6WV9QHXup
	gIflSiqLI69fP/O14QBpRCSx3Ii9DTYLfsuK5xKhry9pBDbA7aVvvS7hdZMNVi1MZ2sIeA==
X-Gm-Gg: Acq92OHH9kuFyVC1O0gk9ZQ/MPMnLhaPdROpuHQkrUMIAWNSPZZC0QiMtKjcFSqn1TL
	9inUSdgHYijbRZg7HcAhpraPgA7WRgag/DzadDl1qpv7wrF1hMOUDOld0yyDN7hvvxmvF4yeYKa
	JveDq746zWfzpo328WjK673c/GxVaVnoCvn93IvD1mfx/jY7yfBBbECvo8rQQanIQa3qvupI2Ea
	+P+tYdaWAKrWrOzEze7F0ZCYcI8mZH/hUhh3Q1jHducjNokGBNvbjjvsW1jEY5EJUnSYxtv7/vK
	WFVuDCtZ18w5IljmdQ+cupPD9E/+Kb/RhuMdBpVkVcCm7pkJeFsvhK2Rsu4sgwU/YabiaOtnMy8
	q7uoCvAhArK2DMSJrLXxfYmtT1DtpcrSovNnsDWCpcpP0YW1uIfmNRNbXU5hN/c1lziAt+24huB
	PENMNEmjhqJOpMksC8KvG/woMWfOkalW7QWIWF
X-Received: by 2002:a17:903:1a2b:b0:2bd:ef12:14d6 with SMTP id d9443c01a7336-2beb06cfc33mr156683025ad.34.1779711428250;
        Mon, 25 May 2026 05:17:08 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56bc46esm100762205ad.25.2026.05.25.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:17:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH v3] of: reserved_mem: only support one <base size> entry in reg property
Date: Mon, 25 May 2026 20:17:00 +0800
Message-ID: <20260525121700.2706141-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

A /reserved-memory child node may have multiple <base size> tuples in
'reg' property, but multiple entries in 'reg' have never been fully
functional:
 - fdt_scan_reserved_mem() in the early pass loops over every
   tuple and reserves them all.

 - fdt_scan_reserved_mem_late() reads 'reg' by
   of_flat_dt_get_addr_size(), which returns false if entries != 1.
   So 'reg' property with multiple <base size> entries will be
   skipped, no reserved_mem entry is created in reserved_mem[].

Supporting multiple <base size> tuples is not a good idea:
  - It requires reserved_mem_ops->node_init support. Currently,
    CMA(rmem_cma_setup) and DMA(rmem_dma_setup) are not supported.

  - of_reserved_mem_lookup() is name-based, only the first entry in
    multiple <base size> tuples will be found.

So change to support one <base size> entry in 'reg' property.

Also update dt binding:
  https://github.com/devicetree-org/dt-schema/pull/197

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Link: https://lore.kernel.org/all/20260506014752.GA280279-robh@kernel.org/

---
v2 --> v3:
1. Fix out-of-bounds issue in v2 if device tree contains an empty reg
   property [1].

v1 --> v2:
1. Support only one entry in reg property, suggested by
   Rob Herring [2].

[1] https://sashiko.dev/#/patchset/20260519082427.4181476-1-chenwandun%40lixiang.com?part=3
[2] https://lore.kernel.org/all/20260429065831.1510858-1-chenwandun@lixiang.com/T/#m29fa0f1c22c23e6343070e70f905c9482f930901
---
 drivers/of/of_reserved_mem.c | 43 ++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..ce1d5530ec0f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -128,42 +128,43 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 }
 
 /*
- * __reserved_mem_reserve_reg() - reserve all memory described in 'reg' property
+ * __reserved_mem_reserve_reg() - reserve memory described in the
+ * first entry in 'reg' property
  */
 static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
 {
 	phys_addr_t base, size;
-	int i, len, err;
+	int len, err;
 	const __be32 *prop;
 	bool nomap;
+	u64 b, s;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
-	if (!prop)
+	if (!prop || !len)
 		return -ENOENT;
 
+	if (len > 1)
+		pr_warn("Reserved memory: node '%s' has %d <base size> entries, only the first is used\n",
+			uname, len);
+
 	nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
 
 	err = fdt_validate_reserved_mem_node(node, NULL);
 	if (err && err != -ENODEV)
 		return err;
 
-	for (i = 0; i < len; i++) {
-		u64 b, s;
-
-		of_flat_dt_read_addr_size(prop, i, &b, &s);
-
-		base = b;
-		size = s;
+	of_flat_dt_read_addr_size(prop, 0, &b, &s);
+	base = b;
+	size = s;
 
-		if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
-			fdt_fixup_reserved_mem_node(node, base, size);
-			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-				uname, &base, (unsigned long)(size / SZ_1M));
-		} else {
-			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
-			       uname, &base, (unsigned long)(size / SZ_1M));
-		}
+	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
+		fdt_fixup_reserved_mem_node(node, base, size);
+		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+			 uname, &base, (unsigned long)(size / SZ_1M));
+	} else {
+		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
+		       uname, &base, (unsigned long)(size / SZ_1M));
 	}
 	return 0;
 }
@@ -274,20 +275,24 @@ void __init fdt_scan_reserved_mem_late(void)
 	}
 
 	fdt_for_each_subnode(child, fdt, node) {
+		const __be32 *prop;
 		const char *uname;
 		u64 b, s;
 		int ret;
+		int len;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
-		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
+		prop = of_flat_dt_get_addr_size_prop(child, "reg", &len);
+		if (!prop || !len)
 			continue;
 
 		ret = fdt_validate_reserved_mem_node(child, NULL);
 		if (ret && ret != -ENODEV)
 			continue;
 
+		of_flat_dt_read_addr_size(prop, 0, &b, &s);
 		base = b;
 		size = s;
 
-- 
2.43.0

