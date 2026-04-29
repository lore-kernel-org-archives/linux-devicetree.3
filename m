Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EB265621
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446018; cv=none; b=KRNpRMpDSZo9ymz0dViB5T3dVHnAjDRlocNoeuqSere596FeNMvrWAk+DUTczRvSFBCwOVNUZi/XBDgDLUSFTOIrRxQZ1gHW/f+oLDk3tR5Gx2xJosKxmNE/TNq7mTRGSOgaXOko7QYvZ0/KJiR2XnQKwGbiBKNROhZhs9fMKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446018; c=relaxed/simple;
	bh=MCjZ4wIsMlFVxfNUvNxM58nyFA/FtDG5OZK4rUoOlR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5R/YxOqZYMFbaxQtmt4XBk0+CEA05V8he5xwNCklanquTw3VGjR2vaUf9XImYoHmASVczzLmLsOCTwuRjQhtoF5jiDhL/dTkciSvBUYwP1ON/MRV1to3Ih91l3s2nxcvaPYqzPZjHZcNIP3Qo2B/rAKru0ynvPEOhfwpchhZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXBQxBe4; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXBQxBe4"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82f351ca23cso6291841b3a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446013; x=1778050813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=YXBQxBe4i0BSZlLvLJ7W5t+4HxfUh47g6LNLJ6t0i/09tOwPFH8Chn+8lbolryPglQ
         LIsG41UDT+ZIKYJLGj2/dS8+ngnNMvVs1hcpas72AkwTgXYuyBU5RzWIAi/8/L5FLBtG
         3iNMtIRIIziNV6wJ3WxNYIqqsmMc7xG1OTkwM/L+ONqKnwycvp0mw3k5pyGtGKkYhsce
         BZxlMLo+AJpesg3LJvLADElq1dNbixlAVbPFhlWuyx0Zl5MHvpJJfJRRSIl4o3Ys2QEW
         JzHfKwgigoJIy7dDBOrbo4jTD19YQUfu5/ImnKG0d49iAXAOJ/qjDNUtMyiXj8z38nUq
         G7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446013; x=1778050813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+aKzcozrfPvAHDOI307L3sGfueBolTmIlF5K5tQEKM=;
        b=qz9iMRccXnvvc+PN8PyNwxnEinGGglR9l954f7uyckMAchOS8K8vbrsoWoa+AuiE+A
         0RMBpSwD0ZRuB4sERIGHgC/8w3EglZA091Oo2AVLYCLxckHks5uISzyMiFhgudybSetA
         TM5fNb5ZZXaWugY3laZjiLC+nNcdVYmN0JLUT96F0pwi2T6OT+oSDAnGAwsfDSGJVJFs
         FVlBNfZO13cm2DUL8OKdnAbmAJ0wlBMMWfEJy4g+a6vJoGV0vQKYWS/zY4aDHuWo5s04
         O63vC8S0ZFCJVTvRxF2dGR/SkNOhYhyYzYz9JQU2Z2LKxEMWWTkL6I2ym4O9AqLovYMk
         hFPA==
X-Forwarded-Encrypted: i=1; AFNElJ9ay71YIHE2SX4jbuzlYyhCLSmQbzHrSbXrAIZ2bTAO9RHr86dVYn0LMIHsDcdVDXtL5vlxmXaPsVoY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Xo+1oKnXSta+vMGYnm38LbRJZrE00aXaGnHNYZaYtsknNMBE
	KAGtjFEJnvYznQMy42TR09fHfQxJKE0znCoYswFa7fw82vyim6deyJrN
X-Gm-Gg: AeBDieuanvMcg2El0ahyQ3dxYyNqIJbHEjCpXZChCKcbPp4TTv23Fma9Dj145gDHwcA
	wpaCSi28dRAS3bspwuhdnc+bw5XDkYu1Z7LggXUdRE9WeOskglMhkMQkeTzQruVQMWxwCKzwvPL
	joE2hWszFoRI5y6Bxfv1P730QBtH7reZ6LzrX0i5A1qEIiuP6Ldwl1sK3mG65GLKGgxsCs4pyxw
	tnsat45G+pOzG+SEdrJmzaY/51t0hfhlf9HpARDQK73ekWwt08+ekbwIg+ZXpYg9U/xDz3OQBQD
	PdSK5OMJIVSuGLW3UCuBdnGDO730AxW5d1qKHMOXIZE850eBJZAp/WU3WWfTMbzXIvR2wbb6fAu
	Z88YRUPh4UeiiwaS4/U5xXzTMmkHnuSmedgPC3F4UL0DUI+te0Mj2bjYBbjBBcTsLdLuQC9F64g
	OZc7q46j8Lpiyboa6c6DLMduzTM3tmSqGXmr40gL4FvxMS8NxR
X-Received: by 2002:a05:6a00:995:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-834ddb2d0d8mr6649550b3a.13.1777446012829;
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:12 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 09/11] riscv: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:29 +0800
Message-ID: <20260429065831.1510858-10-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply the same no-dump reserved memory filtering to RISC-V kdump as was
done for arm64. Use of_reserved_mem_exclude_no_dump() to drop flagged
regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..012885ac9b79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_exclude_no_dump(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

