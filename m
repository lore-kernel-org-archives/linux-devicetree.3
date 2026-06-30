Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166D3E450D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805736; cv=none; b=ruUCuGQNuz/UO3sYDHSyIGVvrCQS8rmF++x1Px4rwrAHRm4Op3feTUoa07p+oXhjg0g+Jm2RpoTmPYLqS1TE4vtwLwrkg4c1Lw//ugvkkIzB6+AcuSNm+Ire9kn7IcKb+t9s35HS8w7tFhfNhCOQWTUpIK1ZjIUhIKB79nXl9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805736; c=relaxed/simple;
	bh=no62Ldx/VYtMusTTq5JG8f1ZzMtpg2aqQYYLKUw/J80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZM+bDSwS2wo0H4vV6HBkkfb94aLep+hOJ6kdW49w2CKD8pM0mtG3E+Y0B+kTtwao3iDvZwOkp1nMu9Yr/LqTUPcecl66h4BYes5K5Urd85twbLOxMBG7SKsFN5IdOAgguM19zaIlZCMKNaP1Ju1Ca1fRsxwTqc5E/00afrnviz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrDEr1Dl; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrDEr1Dl"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2c825308c4cso1969985ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805731; x=1783410531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=YrDEr1Dl22QeFmN+Sc2sJl4UHOLTHG5kKbr64oLa5RxMWeZW3Y93Di5bcqWs0aIq6E
         rbb+xUI7+4bZxWJ5UM9vFK1ufXHAObtb5ty3cxT+H6SePZkXIAq+tO2P1jodKFUq4YYj
         u4Iavcg2DSvOj/DX1m1OK4KTqulAy0GWmbZX4GmF3A59lRzD2TIbcyOKlk0ODmrJuiPM
         QhQXqe3l7ZVwXcYLlCVDQ7ztSD+aAHBATw73PC1KHsEqqgzG0ef6bg+BgTy6WLMc+nzt
         rMvgOBk3/MBiv7K+LEO5KcGrC1bSnXncXf7gxM55v019fRuRvrF9n3NUqUqqSrza879b
         lU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805731; x=1783410531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kilHQAUiYtCIXGoXTLzkG+QFNETPWES64QJavnYCw8Q=;
        b=tVtuaXoECXBnxAkuiqn3vdII1KETvGt7bTlemDbUHUziQ8DzR1cEQEag78QAxLGx7A
         Lxel8QCWUJZIjy86DDqgDrKgAfSEfXWPIjCadFnGOHgeKHK5SVLy9cU1rPWhJRrpkT+m
         oXxwUuNWw1/ko1XftXT0UqsMxPjiwwMuPSqUUAH4rh+ihhC1CFCH37krXbJeNhvTf1TY
         mH4CCmpyOVn99eiuKwbDegqWdKt/AZ9mcH4x2jom+cW+2qwVDFWBhgFNmEohiOLfG+c3
         GEPFbZ/EgE5U0k+bzQnwZAXcvZYq4ICS6zcrnsh+Y27FOpWF8kOIqdXpkFGIMIyxwrii
         lXSA==
X-Forwarded-Encrypted: i=1; AHgh+RoS0mOorGs1FVZwWN79b8DF4P22O9tuhn89XICyD7bBM81jaba1pJmEfdPw0OaV2J4CEeLyCnU5PSQA@vger.kernel.org
X-Gm-Message-State: AOJu0YyygR8NF5a37P1wD12fGfCBIinfsMX0S898aXMHQgSppm63uPL9
	i7alBrLKAPd3f3WTcRPw4jcoq5x7hzH5YLi1UzTBDtj7/bbxPTyGSpcq
X-Gm-Gg: AfdE7cl+WflYLLxNAyhc3IKEbWSx/1hsLeQ/2RU2vTeA3vn6brbngxKH1bM1NBXqxs5
	jYCD0OTKRMdRFlGWB9/HqvgD6KgMY6Ml8eSNhun4gRrts/vOHKqi9NZJJlU06lYAkRUiNWD9bOI
	hF30JQuXZhbE+MCAhzToHakiU+KwzUiG4nypUjlajYLnDi953m2vBjana1LNeWQzYqcZGM0S8pb
	/RwXPnBwuy2/cfXrV2mcn0eCewdAQwykCHqDbM07Mpi7BlOCb1jiegBBVuU0vJyz/6fkzKgKO7K
	6N1yZ2FwjEAN901uaBZMRTHLWW+5qTaotCxL+dxK5qNc844URpC4aholSwWYSy5g/KYtNS8Wuiz
	HHsvzkeEZcpu5Edxf8xwNsSWbdxq8MPAV0L2fHcm8iAKOYlv9x2OfyP9qKQcF9fcvmFNRd7DfEm
	sYVrJ+/9Tx+3lQy92FScXF5p6oog==
X-Received: by 2002:a17:902:dad1:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2ca2d55dedbmr19212325ad.15.1782805731371;
        Tue, 30 Jun 2026 00:48:51 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:50 -0700 (PDT)
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
Subject: [PATCH v4 08/10] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Tue, 30 Jun 2026 15:47:12 +0800
Message-ID: <20260630074715.4126796-9-chenwandun1@gmail.com>
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

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Will Deacon <will@kernel.org>
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

