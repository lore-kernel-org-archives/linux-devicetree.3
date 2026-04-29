Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7909439E166
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446014; cv=none; b=HJOZ7McKk0iFYjZdSUQVyLDnegaAtfoM2NLsOV/4h8aKJ6NlXZNxPD/c3I3CiCijCrRELtBwd7lDUpK8FWoPYKpmbaYuz+1nDH1prNXinAexsHJ03/D1ngTiH2pSrKu9/ghWtTD2neT6sQvMUbSCUwKx4X3qj0YieU8DBUhzBjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446014; c=relaxed/simple;
	bh=19ChOYuQhKdK9qw9JWxQ3u37AolQaWA1Yu0JwsfzieU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfAIMSmi43vbCjveD4nFvqwGwCdcemh7AW9nR2PkVR31rTlGSeI/05mJiQvXJUilV1Bs9I+4EE6std7c6ZRlp7OefmDHqdTQYGRSmdBPxxUmypiiEZAEKVS7t/prl2Kpso7duLEZQb8GCoMipBaHpw2spxoEJCfn7/ySitTFXDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxezeEF2; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxezeEF2"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so5860952b3a.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446003; x=1778050803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=kxezeEF2Wcb16iDVIeF7jvx9Z0fFU+MgS5t34N+hQoDuE2Y1WQNVTXlR4u8ni7ndmn
         OfeF63M3uxLF3GvtdCBMNrEcfUQO5IB5jD53CeTC0GZANOUJ5MhWUwnXi0wErfWQT8CW
         95/hbQWB6hwk4z6NrK7Bt6NmqipK0p6L22UIqiu57KMOftWY8uhGcdUyAPHyaORoSn1U
         0CNWLV20BczBRSA8kLGzdN31dDH7FZmAE5qZfoBmxOTYipsFe/d431rHseYv47gKuev7
         gLbz8TQvVp5Gdwdq5bR1B5AjcZA7L2h6pKgReAVP7n/WeKefTcEwmTnmtv8CeobAvps8
         7lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446003; x=1778050803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=dBNLKCzvsLxmfPTa1vf3orvhMICfS5k/RzOCGpi0mHcOo8m58CeKVP8Fh6lKbH/jna
         Ot7iT9MQU1Cik/rIxgFw4R5YZd/m4Nz6EQDYQJF/Y+OgCmHDWGCozrcTMlOWPun12Nyf
         PjvEyJ2fSweMrDTuZj7qPXxCaYSwsbNVJ2zz8jbdutrRgZ+1/SMw6e6n10F0q3FTMF0A
         RI6DXU3KjaWV6+JH+jF9rgMlgVXmC/dOsTTslJ7qyaKpT3blFLrOWTazyVqnLmBRvSVK
         R/Br8y0CvTln+Ldj5t1FTD+sZvPWTt4dyNC4T7sU3kEALMyvriNSaRbIKHuR7VFHGffq
         HFxw==
X-Forwarded-Encrypted: i=1; AFNElJ9eERVOwuSureHA1B5ZRWAedeSfj5Tl4Z5LHnLvwgN6gkDPIUFdsvqCmEkd7HOkQsKqfvETkgt6JJkW@vger.kernel.org
X-Gm-Message-State: AOJu0YyfISaUm004MzmaeHpN69/u/rXxNR38x8YK0MrJn/i0ytPEiflK
	oQARO53wKXM6OCNjbF1pYrRCQBBBcuz/SXKSc/G/jH24VLCFTHiQF8YJ
X-Gm-Gg: AeBDieua2b8/7oHtJRA5XFwNB0tWygyn5a+Mtc45XwQprEMtYq+BMfYizoRvXoAhmwq
	ZZMm8lCApqN3e9ibfo6F6OPCt2pS0YUPhYMZe9yg02+NtltOESJWVAyZVi7EnRBd5sOT0WjySfz
	Dv77hH2ewHaJG4KJr7EvasA0hvQ9R8Tyv/AexSIUMZOtCArHQWWB2/wBw3scbEekjF9tCio/Jra
	sTulAohxcQ4LUyJaIw5SqNJw/wCfBmMnohTMT42g36UqGY7iJxXfnNqR2xl+V9aAWuYPSOAeu5r
	Ig/pzSEvOPUclwLtR0SmZhlFxsCQCS1f9qpNlri9zzXcIxsM6DtksURUP4yOiWMmQDnnQ0prfNa
	yRo7RSriAKZCzf3glV4dhmDbT8bPK7jdzAwNkhMcBdyXIkCH33qM65W/R9G04KdNUPqVq/j2Y9+
	l64nva2ZtmujWcm6txLWCk6S2EUFXDwf3XTxDbNe2Q3p9YyuvOZrmmc4BY7rg=
X-Received: by 2002:a05:6a00:338e:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-834ea569f84mr2491372b3a.21.1777446002842;
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
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
Subject: [PATCH 08/11] arm64: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:28 +0800
Message-ID: <20260429065831.1510858-9-chenwandun@lixiang.com>
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

Exclude reserved memory regions marked with the linux,no-dump property
from the elfcorehdr PT_LOAD segments when preparing kdump vmcore.

Device firmware memory regions (e.g., GPU, DSP, modem) reserved via
the device tree typically contain data that is not useful for kernel
crash analysis and can significantly increase vmcore size. By honoring
the no_dump flag in the reserved_mem array, these regions are filtered
out from the crash dump, resulting in smaller and more focused vmcore
files.

Use the common of_reserved_mem_exclude_no_dump() helper to perform the
exclusion, and pre-size the crash_mem array via
of_reserved_mem_no_dump_nr_ranges().

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..7c9c38096c60 100644
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
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

