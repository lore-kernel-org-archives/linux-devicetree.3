Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9D0380FC1
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852675; cv=none; b=Tra/2qHvZnTzrKLWiwpIdwRN8VVG35CpoILXmiYq06tW4fBnyQL4vBgsYSkwRRbQ2i4QCRGegl8VuqJDK2NNGljWHd2Ykd2FNdSuR+0QGpXk34iFxWLAP91TaVHnpeIrsle0LmiqNbS4AJdTmUYBMSzGmPhwaH2FSt9HnXECQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852675; c=relaxed/simple;
	bh=xipAbO8sfslQYWwVMG934ZBmEibO5OVkHredeiTd4i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC+ooFAgTBHGtO49Vj7PEIjJ+xDp2lyybdHhyGNAq8HkMTVZ/yR5Pfn724A2F6VX2HXg+T9yJrwS/C76tFBvnDq3XzynrjkVAcwSq2tmE6aVM6TKjVWoq3FNlHLkh1nNRCTWcqfpOnxkLW8m/jfsKiUbzEaFNa6dr6gLeRPswa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEUK25q8; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEUK25q8"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-824c9da9928so5377651b3a.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852673; x=1780457473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=lEUK25q8scSwMMJ6WLXB3CF9GOmPrF52UBeUmOBsbVZJ8wcEQZSmzmMRs/bd7u2cHw
         Kz4BwL1ne5eVtYJygHn1jimJt8Z+uBp0Jwy9A+14WrXJxDXX8CfyRZmXSFyG+ITK7IJa
         SvZbR0mHJqWC4iJgjXEfqURKZ49w7Wd2nQhYl4nsd8smJXi5z9pOMb3OM9CJVOyPtp1L
         hLorm+1BXjyGFpZFWHWNsNEqFu3QxL1dBtulLpG/6418VWdWXZLGgDvM8iyIieobV5Ti
         MaEPFF2YQGCKdLiGXKJV0zfzMVT5jj75tun6shqkrwmpW4Q641Duo+Od/ee9kIXhf6Ww
         2aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852673; x=1780457473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=B2al9u8eacjduj8Nv/rtQM3Iy9qO2jpOMVkKx5cOnB6DevgGg7lKYs8LZKyELYPAKx
         lEFf07HDegsBu57VjHaPeFQogaYQhJs+Xz+jJlFYiQVGdyEPZArBiVXR2hb2cOtdoE+g
         L0ZbcCYKYgC3mPpDcbpl6mFul+ToifGB6TWZCTMh4C695ejDN86LJWzEcQJ7OT+QR+Pe
         2c86mmpKROBUDco7zdRlnZUPZk5uLk4q4oYpq1h4ZXyJqNdt1YdWQfITMe38Fg7xgKBN
         Un3tiJs4hDgTXOe5aDcs337MZq9tLGKz1hCavq8OcEyKt2Ke1J97if4EGhOnVCb+XfZp
         5Gaw==
X-Forwarded-Encrypted: i=1; AFNElJ95pyTQc2FHlzoq7DKCTAOcSIKRv2+WexvDV28wNNIdNyu6GOt9wY6HAr5asNxD/mUOk8im6q79hU6G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7oeFEeEMp5+6oiF/+vArcSPv+9IJHZjt5zNYr6QoJXRtNh15
	9nKOv/1wvyd4RGD3Qb4+U1AmJFYRwFVKNN1+KUX0KxStM1d10hw1Oub0sWqFTE/KNDoAZA==
X-Gm-Gg: Acq92OFQsXVK1hurK9w4b7pViWFGU25GEo6GtDYkg1ZgA9QaTOyC0O08Ug3aBGv2t0y
	OyG4yLUp+5BdJcXHPd6XwSLkgMFRepcu7OjgCRUt04vfq6E4aG7E29NCUbo+W7HSrY9JHV3t/CV
	nxOWPTq52endH4ZO7GDew9Xz988riD/3MSvDSspTYo5jo+MsYporpISZHCL+SjVEGRYdtNStd17
	fLavhEpgqVtGnXdx+eWLA6s/jNOmamDAuStYX7F3HWWBHy1oBINn2sBE2kjdN7JKGTxiOKojup5
	duPOlFrHk5eqDPm+xWaJ85SS1zxbabAK9pOZQx3E3neyq65pjecdV/B/YDT2UPPNR27iGdev4Bu
	ci1Up9eIbiRssyXdCkZ3bjcglU9rlADFmV8J3O1Y4ij/fAypnVynbUPwV11EZlZ4Ra7GwL3n+ni
	0gp0sMKmPzac2i4z5gDZfV7UUWNA+vw6+kn/nnwJGAxn2UFeA=
X-Received: by 2002:a05:6a00:2ea7:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8415f363b30mr20565995b3a.39.1779852673468;
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:15 +0800
Message-ID: <20260527032917.3385849-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

