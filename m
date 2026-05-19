Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FA31917CD
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179086; cv=none; b=nVv5QBopStpWUcg/H+eETcuVIVmQdoSFxmomYa8wiskNl8C5N2dRsQRxkoC38rILijiLvzkrWBd0LfEKyMFzK108h8P/sfdOWocNOTlSa/5Akzgw6HIIX+qf7zJLRVHo4yc6pSLmhNuc7HSZOKQpYf+xY2lvqoz2sV6s/7bL59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179086; c=relaxed/simple;
	bh=Ob0QeBApGXxL+bHjlAt4A8HF0QM+j4NvS2rVrECCubM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC2ezir+EzELqa8N0T7+RpegL0gggQltwijkoqiU6qXIUts+flZk5QaORY4v0XJL0wDwBYzdzbDYO8TSAL9RDmhdzhb/qdfKgDGr6xWCEMGtKs+L6HweiFQk2TBP/Lerqk6kokwAfb4i9u6C3i4dxTW7MPpumveIx+dDUoIQgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqqZZavi; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqqZZavi"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8379e010b01so1343365b3a.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779179083; x=1779783883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TgtSA5cUn5h4h0Ny3QzeZ6CBBxSd3EVznRrJzHVc6I=;
        b=OqqZZaviL/Q/STmZ2C9ccqUYW0xMV2EgWHDME90Zp/WirY0WVsNss9zlwL3oYTf3s7
         FcphN6MsPLvppVYe1VWyANWiPnJIMlmyTjO4b0Ju2Go1hyRVLpEcq8gUc3gHsFnD99jf
         PBnQIQg1Gx0Mttg3iaNv8/ArQFDpImXVq6BkSgeS3MHK7XNIVTfggywuorNgTdZCiAdw
         0SjiZ3cjXUIl/GBMmL81RRvl8cRbGNhSeA/i5dbvpjqMvFsA88jCNx7J1H1VrDeZIQR6
         RZA3mQN2BPW1lonEaYjUofJq8wWeZynSBn03mSxUeM3YYavgZqT9VslD5lrj/ZMGvmxo
         Mwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779179083; x=1779783883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TgtSA5cUn5h4h0Ny3QzeZ6CBBxSd3EVznRrJzHVc6I=;
        b=awzx/sK9ZvpiHO/KPmGQcbkSzHCJuznmcs2n1GkM8HepJiCQRLdr+YBOpsa2YNi8jf
         d5X1UP1XxAZ3U4LyL7sJibU0a/hmPz5k8wQZ2/4nyA9YW8DCJakZCz/rR5HF6Urckimt
         Ld++OfqkG8s9hro1s12yMiflj650oM9/2jTVDe9xxYVfXg1aslDrOvHjnyqPiQswDGyj
         Z3TvyTHWhYsofZqNqQ+2si/eCkbfHNVg64UIRaTt6viKYsBIhqGIfrRvdrmSnpfa3iwr
         tb+W3E26s1iekTnA75NdHSBjEnN2nf8AvY0jB3MvymwL5Kc58oqy37zudrhN1TUoexkj
         3VWw==
X-Gm-Message-State: AOJu0Yz6yNxr68MnDhFpkH/q/uK0xUrCDOraVzjpnx8cMDuiR69kZwgc
	Iwg5t2FG/UCbUoOlwOmFzncx5W3DWnTTyMCRX+GHC16FRlIFUFZ5y3oOzenTzfnn5I21hRLJ
X-Gm-Gg: Acq92OFiOCabpSl05q91rrNUcci1noh7CqxKC42JmpXFqZjJm7lV/obtIewspAIdt5V
	/r9YLpi8shLOw1WqSyhNxymdMXogZnX+92RQdXCRDaykXUIsTIMsYgfDXFrl/1dcchtoE7jAKyP
	18SHvmEKnbhk2Fjqu+LWLdFByafCArs5YXenVk0SxlYwOSLfFEONpPhWrp9N2Y+936wFswSjYNK
	AnNMxM45l1Solwbq4t3tCewO+3pi9Kb9lRo6Nxtz3frwinLQ3pRAZXSTSqXPUCBRHodC2pnYjlT
	6zLRptV0ofx/gEv/DYEe3mYBDU+t4/kNMVv1dxmA+YLeq4QXp7pbV0KnNfGKHJtTB+HbHH4DoB0
	jqyZuTFaVFn/lwLCAEB/2jfa7Rbz3oTwPcWWpX7gtlJ3IJStscXjQNfME9kTgdfKhXW8Yia7lwy
	YK6yjpiVsR+Kc5Mu/8wv361gYz0UvtEvtGuJjpjABTZxYIfLMh
X-Received: by 2002:a05:6a00:3925:b0:838:29b3:9ed1 with SMTP id d2e1a72fcca58-83f33df85ecmr18320240b3a.41.1779179083239;
        Tue, 19 May 2026 01:24:43 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b4bfsm17822898b3a.28.2026.05.19.01.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:24:42 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhaomeijing@lixiang.com
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH v2 3/3] of: reserved_mem: only support one <base size> entry in reg property
Date: Tue, 19 May 2026 16:24:27 +0800
Message-ID: <20260519082427.4181476-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519082427.4181476-1-chenwandun@lixiang.com>
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/of/of_reserved_mem.c | 39 ++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 462e7c3078a3..0e91c4a71d89 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -134,37 +134,38 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 					     const char *uname)
 {
 	phys_addr_t base, size;
-	int i, len, err;
+	int len, err;
 	const __be32 *prop;
 	bool nomap;
+	u64 b, s;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop)
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
+
 	return 0;
 }
 
@@ -277,20 +278,24 @@ void __init fdt_scan_reserved_mem_late(void)
 	alloc_reserved_mem_array();
 
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
+		if (!prop)
 			continue;
 
 		ret = fdt_validate_reserved_mem_node(child, NULL);
 		if (ret && ret != -ENODEV)
 			continue;
 
+		of_flat_dt_read_addr_size(prop, 0, &b, &s);
 		base = b;
 		size = s;
 
-- 
2.43.0

