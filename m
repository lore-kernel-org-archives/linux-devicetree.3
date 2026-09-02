Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D63D5C0B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334308; cv=none; b=JMGYux5EIyH/onYD+kG3/gc62DVDsFUtxYTgiA7+oLRmNK4gV7g1w6UqQgE86V6jLxhrC8znZitZ5yqjHBJjjAL2GqCi7wUDBhphmYZMpuC80OgGPmaL2092rRbMsifluIOwvPkE4PBucUrR0zZ1eo9VriGd4tfa92SuwtMkG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334308; c=relaxed/simple;
	bh=3r50C2QwHvq/Iqle8+nbAe80qqES6U9nJgMPBo2G00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBDrFqboTpBlFxXL75jHwnKgT/FalrLoZ6F48SJoIIp4AEXE8Snkl9qk/LcXxYvjFU4H9nkt8nxmNxuHG0uiy7/66dv1c6eK2Acw6x0frzA1h7pVvRMgwzocR3kkgqZfKVhmXFPqdqj6qMVI1rD9td4gOcSFm9pLoe8N44rfQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxZceyRP; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxZceyRP"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f9dddd99so3087675ad.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334306; x=1788939106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=QxZceyRPOPIUIFLCBLQtqe4wRst2Yeeaa3fBDMWtGzCNr5GCmJOwpRRVxNV9Mq7n7S
         Awfyks7KDTKUwxnb1JSW6JV+0/88ohsknUKqFIMkvW23OBVkUwCrl/H6tc+Z0c7H8c2/
         zGl4ILK4vu93n0NvUbdR+/Y3gr6JrGZ44Y7lsSA92dGTj4isBXnuq+1QwhgJI/VRrP57
         R7NPZR9Up49bsLw/C4bQ2Jfmq4+a7ucI2XpypfUygJgtbvCGBIXjIPxxO4Fuvv8VUu6M
         luUleAbmfRGQTAPFX82K3HmuUaJUdKmrpMYnZYOSVHl0rQ2wGC67AG9Dz0RClH99x/lg
         bRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334306; x=1788939106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uqv+RTAI4cJSSsg2qdg0AwAoAqWKAsIT2FLXo2GNbW8=;
        b=nOKXKiEiBrOoyMtOsq2eTiGsu39pupZOhddGuv87IRaCG/+MJF+qd+px7dxgGQjo0x
         7nlLBFzMFSiijRlPaO6+fr6rQlKI0iBRTdlge61sCLZcnED+YinnNDd9cOj0lEY+mvP5
         QZ8V4H4or7VpAQ3u5LZAuE0BMhRayuEnH3BdcYwZaGziTIGdtkeenEdFpW2DNeyCIkR/
         bR18rvSkGdGTEDIh9GUVbLpDwgbLhHCIUAgtfvwueXn00LYuBuf569Ha50bMJua/Vum8
         xe/RVDOoGGW0BWWN8n9oGUmD1YCrIjuY5vClkOI6tNTRBMm6wkN0IMEPsDuWPD+i3nNu
         y+xg==
X-Forwarded-Encrypted: i=1; AHgh+Rp60mUW8wxsJfB+iEnzC6tI+0IxDU4BX/GAIfbxyD41xRBkpmsKgXyEW4GFxueZjNed0/ErqoQh/LD9@vger.kernel.org
X-Gm-Message-State: AFuF++mQkG62D7sVdpqDFKeNHYxLaiFSRbmL4kHGiIxXmh/cIyt6Zr+o
	MmaM2tFnZnJ5t04+of1p/UFRXDjS5JFctrTx6VTUuJ8/UVCK/pWDjsF6
X-Gm-Gg: AR+sD10RB5hXOLmtI//EY1bH/KL1GT+CDv2Jni0nHwPU/THG/SSc2J2mRSsv5ggkWgo
	q9B8AAeOul4dbKoc6TLlYPsEX1XP1VKdOve6fTxTrGW//aVzr9YgPXeTsfTEhhyilYZH6BwkyjW
	wu6iGe72gQeDuUWMgt1mBtSRxRuuIRYplzFeuRS0YJ3I5fs88tHqzm0ss5bfIPVNOq3whdQoXc8
	aMxTPwnx4rLB8coDKSzrt5NDlpojrHqthUD5FGW5nkQM5v9IIfzNiQ24Yead4Pn/7AqQRxyrl2c
	x4ScNrg/vsWlSyGi8vFMJpytXl76LTLXlZ3n3AMraoQIkO5GERhzJY4cZDfMMaGv5v5IwhR8f3g
	v0PhWmTrC1o04IR8F4fux4yWkoyxIaI74jtUYKhC3lk8p0ByAOCx9ucOP7RrynISQJXRnQpQ1P4
	0yE3FFgWpXZuzFWAY3g6rYqcmMO4RR+6g7MJjDrKVdy3sE6pv7GsfeGv+paDwkCKyYEHL3mpDX
X-Received: by 2002:a05:6a20:258e:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d9aa4ca9c0mr4530228637.0.1788334305736;
        Wed, 02 Sep 2026 00:31:45 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:44 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
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
Subject: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
Date: Wed,  2 Sep 2026 15:31:07 +0800
Message-ID: <20260902073116.802752-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
entry to flagname[]. As a result, memblock debugfs cannot report the
flag by name.

Add the missing RSV_HUGETLB entry.

Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
---
 mm/memblock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..f2952d725c10 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2886,6 +2886,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
+	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

