Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296813BED18
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268804; cv=none; b=gGL0CEOl8M4+X4f7NEJ1ma4fQt1lf/lKb8SA+/XaypvtHQZWKpgOtOjbXxTDMFQkT5gUFLKO5LlcgxUOPDuMGJUru/q7Eefl2FpJZaAbyQK1YUANsiruK9fuF8Sojm4jSwx4Z6HnbZBWLZxyFURzoU27sVg97O65/muKzAkTzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268804; c=relaxed/simple;
	bh=fkGCsIowNsF/AXwiEqemLcl3yM1yUzs10iZ5x1XDEp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCNIDK9vhz6mJlPdzcsQfzgV1Y707dRU5RLDQgbSL2nPWGIgBH7wgPkPFfZBT/YDksxn8EicttdiSQJddLSmjYSB98pgV2+RZvpU5vnq7+D23Uoeg24HdB8FF+ux7a7U+5vr7HEx8LTYmrnDvkGGTAgiu3+xUg6A/J46TmT+be4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVJM0zkd; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVJM0zkd"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1874695b3a.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268802; x=1779873602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=;
        b=CVJM0zkd55OyovB04mH0kZo1HrMBXsFt/E9t1+4rqUnKOYoaQMi5RIXJM1N+FNzAeE
         x6ZEv6bkNb6FjfePIFoTL9ReLWafB351D9JBNRSDMwttWVhGpFC1/3Ig70fY1lTn++Zv
         L+JKsiF03h6D7WHe3ff3LBzouPwIuNZHft2YU595MtfNdGOC7gUBMwJchI3RDdR7K2Cq
         VsIafJUrr7+7ckBmBRu1aJtEbmWEnrJBrFmPTdxmOuzEJrJxhM9IzwUotkvsaoAls5/O
         tPisy+f4XHyHkwilqQYCywxPFt63wUG9M8ldXBNJ35I5QhiMaF7ePLGx0vNtL2Dg9Fj6
         6ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268802; x=1779873602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uewrEsj0ZjEAk2x/Pk2ITnSJY3Gqt9vqmVdLwg6RP/I=;
        b=g7FRf5wg/ZCFGM46rIvldnLdpPXWlIukdbgX31fF/qHjzyKiVYByYO1RpZpkA3OPU1
         Bk20pdGErTM3IPRrRtDtKCvaTjbQXsQhoxovxEOvDfFu/KcWETqG20uZZWVck9qorNiI
         MF9HkhngLtvc5D1mUdrg6V0B7tUEHpGVxNV8rgE091KASo7DN8YffkdNI6Dk0shglh6S
         jDnRK719Zw/Dz8e6D+ljB1mH+g/Yo7n8Duh8A/75ETCmxrg/LYv/XS3gNLNCTVahwwzu
         4mJJZS8/uBIIaUNaeLHs69dKArKdd05K1ONYHZOW9QLLs7m53NPNzm849fJyvicdYoEL
         FXKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9blPLBdRvkyF3fVXinAWCMRoLhYrvFq2IJ5uVutIBYCDnv7Gi1Vlwn2KQCR9EuM32dV0C8WB2Ch/6i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu6Y52iaynIm6iyHrh0/SJumdKHvZsb2LvM/qTyP6xmUYMlyGa
	KX8a8vzImOl0x18mHjcJpnvWVmwn2pRypCLX7FuuTSlrq3aQbkx3V/OZ
X-Gm-Gg: Acq92OEJqGQUQIggaaW1qofdxGa5aBhkXqLDJvmXlq9vsbLMF5C/BFNDAGKBe+VcERm
	hUmxooszTJD92DLwUDcRiRcKTT78LqsTKQHXPi/3fn/vPTAQ2JnjK41y2Zpp9zN8jH/78a0kN+B
	7sh+pAg8JcgHpwKAjogLqZzCAG73yPaoXYmVne5BpLV+cw0G1C8rIRTj0BCFUOWBDjimRT0Cg7s
	0m3EJIksU2LVmkdYjWNTzsbFZEXFo4QCa6AxvjGS4NjUazVgceYJsqqGhIxUQvP4zUyQMxHtOtm
	maCpLVaOrUvonVLmnW8URod3eYKVhXMVmoaCAdT+sck0oLWI8l0OI2FTNmmr0529qWuVNT+hCQA
	6qcaON2Rxjn8H33zveElSk3mRqrrbKl97ZO3j63N8UsdvrtCN3GOfB1yXnFc2422+0civqxy2K3
	duQ0VRqvnTTLi92avtq35iFeXieydOyH+6++ey5g==
X-Received: by 2002:a05:6a00:1954:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-83f33d80937mr23397364b3a.37.1779268802457;
        Wed, 20 May 2026 02:20:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:02 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 6/8] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:42 +0800
Message-ID: <20260520091844.592753-7-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

