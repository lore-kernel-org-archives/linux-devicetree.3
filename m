Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B15326CB
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066692; cv=none; b=LqIhRnk/bNZLh4wK6P1S0yzHmf+BMl8bLSZOVxQrLFnR98blJg9Ds1DJYSWwz7K7oBQEv22a8/8PGInzz5wy4U+5+6AGXgtmvR46AELukgsa8puiLCIufNWrr7B2vK/52OXbuNrgNsO4o/Yi9ExDxhsiLOhu/UuvJE4/Vdz0Y/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066692; c=relaxed/simple;
	bh=vMAX5brBzncYCW3D+6UFt88v8II7ELfiaKipSUvadDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8SKwZ5Hi6kY8QbrCRA9bUGwK+ZKDhQtCLAYLoBFIYoqJdY4fgbKi7C3MI+hj/ezQZybmBX8vHQP/UGslFXnd51p93Oz/+T9zkECQ5DHrhZsvdhBijJbjSJTSKbebZ7eggQITV9RADaPoPGaYkVi7iurNCz9XgohC1ZTHPnNMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/JKfY0Y; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/JKfY0Y"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso1633157a91.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066690; x=1790671490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=K/JKfY0YN7SMNfD9TwUpZDxeEyE48M0YU73DRI4IjUA7tbmdDBgeen708uuransBsy
         HnAz9SaDqWRoQCHOGWO2JEdx2cc6gHh7YYnq1IWmP0h8ZCM2Ub7xcHWbrwSSa/YO8S/S
         +7VzoQCGV2Z4NGoRnr4lVkq5ngPX6mcTs3x9Cfe5Vm4/Y4Ew8MIcYAdZgceOU/Gtz7iN
         x+P3W50Yfu6z/11LjC9jNKBfHhUd2HSeMGS6Kk8QAd28eaK2fipTbFlds79mjQlR4flP
         NXEVYaHLDmlOMRww1UkfkK/2xSV7Cyz5JR19HgLi9kzkZaV9PayC2STzNhYEGDDk/Nj4
         arVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066690; x=1790671490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBMl/FGlqf3qixhPiHBNfiW1ocejNfHGRfKnUu65etA=;
        b=iQOAZ8l4s8AUusxwQOnOW9Oe1aUoaBDfC1W93oyzWYkR0Xw1B7U7P3Hm9kLBF44kEc
         SL1x2M3OrOAu+Vdu4kScTyKSQ6/P5a6YTdPB05u5xMnj5WSd2dPo8qsd8E8LesqSXvyx
         qqBNPdtLegcVq9+fT5SSGIodjl3DT6zIXlZc0DWu+rIcId+jw7+SGFsPbpdXvPb9zAVv
         W7wUmRV8KHM9tJX2J9ahINB07G4ZikICyUwp/yobogZcf76M/Q5x/e5d/hNWAvecB7VY
         uMSB+6+wFWXiO2wxOw3rGAWK0fqKFgqQ5BForPCd82bgRVe2Eb4O+TXYu/kfQQThT+3N
         3uGw==
X-Forwarded-Encrypted: i=1; AKwUvBxzujchPgPKoi8gpwpeZtrErUlCamTjG/Ia5+s4iTS6AJUXi/o5jx9gKyqWSHDQejxbzSkEGAHwCeYn@vger.kernel.org
X-Gm-Message-State: AFuF++nqPjN6FaXZnKGdZKuAv1rR9+Tuv++/jJ5HMVjUe4r9Z5BhxO7y
	x3EUS+9vz3oWVAprt/eIJv50Hsv5ZkDGG0jcSaK1toxiPDD5bfF5U2kT
X-Gm-Gg: AYBFou19dw1aCUFE2LR/N88W2pqe1l+Y2OZgcWfbnvw4SiOODEP+nRzJwgh0zfiAMGs
	/3rl8yavPJWr/KCfRHNb3iWQ55ux9jRuak9vBDQYsuO4Q8Va0/TK+tLB0kLrBi+TueEthIiG34l
	NHYuryvCWebCJhsC4wC54WqoxYNSsQUmWNLvZeRC5+FpEG1+3f06fTvIfecw1hLUG1XDhXu6+IQ
	3tPyMJoFhcllgoxdWVmmF5VBAHK6ldm8ABogxrMTXMuumyiz/4c77i8LiN3cuBOSOMZy1FSD+87
	C56eZF8s8aU0R1X6ZVdUCnypL5Og8qh7tvMcyu81R51YPRKTffClT9MQ1JMhH3XAhKZAuzRrjo1
	kfzxJZprIsp0CoY/mVTj4tybQYJnine+SKLZDavM4gGrR1FjzF0rHvUU40S2I36Cz6UNs6N2ncl
	3PeTnLeh54gntIvjIIHvrcR0MNEXrtAYRhAFaO1LTE1Tlil/vFGZnvGf+zVBprUETbrYxOmHoK1
	mS57q91Tukb1Xzpo5+Exw==
X-Received: by 2002:a17:90b:35c5:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-3a0731f9793mr479077a91.34.1790066690219;
        Tue, 22 Sep 2026 01:44:50 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 8/9] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:55 +0800
Message-ID: <20260922084256.1515554-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 286fd4db6312..9a727941b5af 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,7 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 	fdt_mark_reserve_mem_nodump();
+	fdt_mark_memreserve_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 505735732c13..6497404ec751 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -188,6 +188,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
 void __init fdt_mark_reserve_mem_nodump(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f29a07e8fb23..a42cf6eac55b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,39 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable &&
+			    base < (u64)rmem->base + (u64)rmem->size &&
+			    (u64)rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0

