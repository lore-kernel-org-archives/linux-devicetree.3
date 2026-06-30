Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6E3E3DA4
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805743; cv=none; b=ECVkwL4S0eYIQjGD534Vxtn4HfPWOKqiztjHut+Px6iLnlFiBevrmW01iv/QXv2Ybfzlu5M6TvGGKGAYBoxB/OBS9s801jO2XkxP3956E0etpmSrZVaAkJzk1kYOa3ubWIXJxbcfpmXAHM8XHoePuoS7CNBcgsM+zVBHUP7/rVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805743; c=relaxed/simple;
	bh=y6ocNgSkfdA76nqYi7hGDzpnjmSBmWUarRvhw+f2qaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+ExgCobdEOP8Kkf87c0rbA3pYDA+G8u1oDL4KDykkSD0KY6dJUd7Xa6IAICzs2TNF2fhIpHNCSpRJJ09+07P7GbFJFQMe1H6DWZF6nEb+ogEIGqTQv5yUEupTd5FmgRlm8B1+q5SkJGWphwIe0umf6mxUfkizA/LHaE6BWVHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7xNWrxw; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7xNWrxw"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c9c9916f75so11245035ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805742; x=1783410542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=I7xNWrxwp79gxNCLNtz3ecdTVCz5ZItgGEO0sjA/iSwi2ipBYbvEIHYZN+SuUfjDc8
         G/3qJ6BBkouE26ojJeYWeQcT9zprm0iFzJSkwLEg+KlQ8NHo79dirNYjKTGU0Zwv4TXP
         CbXqXr2hcjubvvELM4MNnYus4HBPqYx83thL2YrO2uY7LHm0rWyHAh91/qpOau4tRGFg
         C5s5W/lpsIvqZmDLnuy/jyhN7AFV98ACNXIdX3XBVz3g3U6KWiTDIZFCav2wI7howfhh
         ruv/2BCvqVV1xIzj6xtN9Md8WxPkRM0jU8Zn2zZbhy1De9VPSMTevgB9CypeC/EytGU2
         4mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805742; x=1783410542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miEM+ZI1eBAN6H+hUm7y5SHAIdsM2tNi01WsyWumT6E=;
        b=o25B4k+ZarCXi5X5NNp8JMI8YFRlv3pV3SRCSEjw+PxMv2pnODKPPeKHgeWI6EYKhg
         Y+6Z7qEbAP4oPUe1F63DC+mfPk3IztH8u9Rv8O92lLiwuWfoWvjPswTPBTc3r4kBcLxl
         UWW+0mn49/i2mDCLwLIwDu6j/qtFIt1L4CSHYzyzITlX8qJVjZYDmm7kmP5xNS3GTiR5
         CiIBfwNXi84IMKkE35SuYaowqHMY3sAD/zqiAVspWPS2x13q6jFlEjyd6Vm61XaavFZX
         GU66IfmoGO9AKy5oNnXEdR4yVueLzO9cfTist4lcxnAsm91ZjPCdTSshIn8lqLTc5Ki+
         rrvA==
X-Forwarded-Encrypted: i=1; AHgh+RqwRhvax/K5DhRh3L0hZ4BmVmThYHYB7KPPZnOuEQeScjle4F61vm8EVs7TDDJSQQLD9LsZ/F/Ito/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzHs3SoVKh8uR6QU3+XvfmOyJM9s8AKK4yEnQJ4VFCp0Sve/sEd
	0GS2GA02R9auboQqqSoG498yQ/1UoXtq8BD68HdQL3A00ngA7qSv1qA/
X-Gm-Gg: AfdE7cnQTwKm/Z5ApXrypF4sAskx/AFRDJPpNup3mJPlWBybGJm/IVfNiq3qHOjuPz4
	R4R6vJI0pOfw4bsELD2lO1Gq3mZB5uMeyUpu1cyNdRPifO1YZg50v1USog+qp2VlNhuRl9rWbM+
	TN9IXTN9TyUVERoYe3FhtlP3uCNZlPXHJm/IN2e7o/ormadtyvggcNfrVsxUH87eNzrpfNVjhF8
	ex6Is6wjIZcQHr3f38fYpE0Jxoj1QTCm9254Z69lNOLItJC+hMxrkqbSWQtbnQFLv2POXWU6e5A
	nQ2JgjR1NR2o4VLW0ZWf5MwMKuq0LtxOU6b7ZVWX1WIbRlC5vf+SsviBtgswBKfL8mb2VZi5T17
	MaghfSmaRaQxRt3NKpG+joKldase5CeyieDc3INyACE51wgH9bqJqrZByWAQYrybl/acOjgZfOf
	8kYNL2oTXVb5nMWbZfuL7n/RjCow==
X-Received: by 2002:a17:903:186:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2ca2d8a616amr19688075ad.22.1782805741701;
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:49:01 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 09/10] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:13 +0800
Message-ID: <20260630074715.4126796-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 59d4bbc848a8..25359d583bc3 100644
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
@@ -64,6 +65,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -77,6 +79,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

