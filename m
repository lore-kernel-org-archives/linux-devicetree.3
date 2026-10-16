Received: from mail-pz2-f5.google.com (mail-pz2-f5.google.com [74.125.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A978839FCB4
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131454; cv=none; b=DMotzFNE+E7N64340UafZJCIohd/Ju1USd7DdtGZHCoZmypNGxK/w1JGHRp2OFixSYT54co4B0Xq2Fu3Yhg8yP0dVuCt6EAAUB7Yzh6ok0VBADJ3ZiURHyXPuJ5wG0LzZaqRqZPuuD8HxWykYdewZD0n8k8Fhd46GCm92miDLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131454; c=relaxed/simple;
	bh=FYy5PHSg/oCo4Er7s9x4p7nGdzrZ9/PNiuFGdN0WpnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJbQSkY39wJtPhWdRxbSnZDTyFkQHu7dT7zsOfCvUZkdoTq7EX/FRhKUeGCf+7/DOF/Isvnl0TVBnvdklWGTQ88GxZLUYzR0jEjcdgAlNDZ3dywHJDXuQVKWYe3aJgLHUu0nbzDUFNEfXrBMtfhYKgbYPaP5PaW4F0yZyXPxewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKlsFNEE; arc=none smtp.client-ip=74.125.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKlsFNEE"
Received: by mail-pz2-f5.google.com with SMTP id 41be03b00d2f7-cc7c286026aso1451957a12.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131453; x=1792736253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=HKlsFNEEfOcShA9fZ2FF7FYGL+S/JRT3MUWX1Cfwnm3wUqjk7oYcdFcXlzCCtArQQt
         yJLgncZAwKD3xhn1E11tK/6Ko1z1HtMg2vFM0SyoLcuiOnlcmaONV6LhhdT11kf3wMcl
         1mhrzD0PbpJX5VgQfpQzK/iEAneTdFLJjr4xlHWZTGORCQW0Z/wK0ZIInM5GoeCvLCBI
         wk6cMvuOpuFY/DLSWHLgM8EYg0Df3luEapI5ldMeNK2kq+PWkqmQkccMrartpj+Na+kF
         5kwSn9fch+rDsRFGbMAjGKx9RvZ3a6AjGKpuaegWIFpq4A44wtYPoBe+GLs25sM69eOo
         kg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131453; x=1792736253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ICQyIKowVj3RyrjMn4gMzYuhROzG3qohL1WARXEfQY=;
        b=Rj000jwwHy+FKc2TKXr/NPi4Bt279veXpl4MRhQ6E1tlyMG4hb/NxUkLsMilDycGHQ
         Uugn7s+x+swZzDzG4G3Q9xNfM8ppRD+td5ZAyvxLS9uC3uaYR1NdkVYid1anmzK/obEx
         Ho+qyBb0a5yAq5ElM6h5E6+x+9b+htZdUZRecmwRzouJztK9YPdRzlgZ6tWFEyraEphs
         hB3cRvz/rqjXv2xFUrR/Lh44+vIBzln4HagMDVbufagXAkT4AQp6DIJLo7NTmpEoJ7Z2
         AiiSadQAGxjccRT/YQ5TDH8x5Denao6cEl/qhrwvl9SFWz9WjWmoMcrXOTLHHtV4uhVI
         j1SQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2odLmeceuerVVkf/S3BXrP7KieekMzTAdVDtj/F03mcLcf5XYPbekLLRjNzEW7IxMPLWHqO7R33nV@vger.kernel.org
X-Gm-Message-State: AFq9FYItBsgFr4+YQyivO5+fxFZqEKbvUqgxeTAx22o4QUKML4pPa7wr
	buDriy10vMwJDRlVU5pOhGgxc9n1k1IzipLZW9aiDy3GggPStgSoKK9e
X-Gm-Gg: AYBFou1LVL8V9hHj+8b/fshlD2dyftHqtyqnGQ6dXocZqZlUwFkhkKZU34YtGopVHbC
	tUuRlAtCx9NIIvjMkzUGruGh1q+udWSFLdSnW9dJ/LK+rJYLjOh7/YMgp7z8hszHjOE1IljnkOR
	7AwY2KoTySsh0tHASWhXJcTabtF001rT12nBLEaAGCzGSVm578CCM+IaMgp9u/By/35DaGxwgx5
	QXZW3/VoJSsTucSmMQTbuAuo9eDWG9TQ2LBgq3zZH0bmR6tFQFq5Nd4bew2YreXlQzOfOjgA5oC
	LQlIIXa7i8p9c1Q/57gg8CnUBHSuMn8ga/rjaTMJHRiKHj7vqY7fqMwX18VKT1ZS8WL0DfL6JYO
	+0QFldigobEXQ+syNPhzeY/+SOVJDTuVUcLCh+mj1p5sPzRjVBL9bYp6Z6tF8me8lBwuVEIr8xB
	5oQZvRUcN+R638N/G0wNZbRIHe3CpwxIa581jH1tmsKeMNGhCzsXq/lq0koMHBwVRpD8P+259FV
	jQoYl4rDvs=
X-Received: by 2002:a05:6a00:1941:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-89d7f51698fmr8778955b3a.32.1792131453020;
        Thu, 15 Oct 2026 23:17:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:32 -0700 (PDT)
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
Subject: [RESEND PATCH v8 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 16 Oct 2026 14:15:48 +0800
Message-ID: <20261016061549.4181390-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ecc923102622..a5f223a74b7e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

