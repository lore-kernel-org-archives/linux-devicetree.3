Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770539;
	b=5EL043vXbIUyr9l1ntHT+ebdVTgQbBhFgtvIgjHEnCIsLjZhY7OHAQ+AA1KIwmkQusXu
	 S38sUG4zHNRIPdYtoY1fiW++gR0tDsB/WmRQuEYqC7nzBVXfQ/wfM0byZjNkx6RMUV55G
	 Zd2gah8YlzCI0gX14H38vl5ylDylk49GxKALZg9FsAnY4ouAumXUxbwHHsqu3knN64Jx8
	 9tY+CDSdUHxdEH4JTm7OTIloLTSLMOObvEYIBm7QoC8ybUbDv8/IwrOl9O8hyRRtgRCVZ
	 rcthUad2t2fm3tD3PnVzMaZrJBZnaRc4wTc7oLibMangdbPXQ+MlTKLeHFm8EbgyiRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
	b=LzActAjYrQt+1+IgFoOdqqrnKmglZR1IXcfD7fbK6xW7vpGiYeRRZy5U5q/eXfUBNLeb
	 PTXzuiIS+YL/UXTLfDl9BwsU5w5bP/cXRiOU6d5M7RfAHqCGBKdgwZwwBlMBy8XemyACw
	 ElAtJH/xlFd2k2mbZk4apbm+PDM4uDCaxnYRVYhz3eM+6ZpLX41F7W388LnIS7dzM3nML
	 jhVCBt5jMDUaKOeOtzKYMCy3+1hiLTPRDamCABZDOBgfuHLA2W4dejDfb0oYCd9nnXRrX
	 QcqE7DYymFaKUCkHKmAedeKcQ+g4Fxb4QniZwou+c4M+DG6wedhep54iT7mlO7EBYCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr9VzQgL;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA3606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr9VzQgL
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1403150a91.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770538; x=1796375338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=xr9VzQgLoqkzYCc8awgGNcYdoxo33W937HaBi3e+ooucZltmCGvMHdKYS79ZjjT85N
         T2f+9Biz/dJJp2JqrAWQI/c6/s3J5xZfJu7CG/3OfrrhccMzSTXCJWpfdRZ9jVJY4uPT
         ODSHI7Loudt8mvxrLuio3JUZAn6vf62CLxrw3TitxfZPyKfIAaR5uq6S93KJjinEMUP6
         34PkHFZ5dkVwhXwBnRs+cQ7/BrCcshgFEKIN6ri81CfF4D5wwNnJx3UU+CvTl0DqMI1E
         SQpQhjoqfIuR5cKbU4J6eBjCtxKyOR5AphviRmRfBcXg1SZG+d0a2oABYqtttbvDWETg
         UF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770538; x=1796375338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYWYab/i6KswA9jBoR7n0gUVHNmGP1kEM/igKErB1/4=;
        b=kT9RdE2vlyfGjchl4uKslJst8Hl+vUT+UGk8AUZNLzOAcjyKxb6821uuM21lwIy0I2
         n6z+FZZ1WZVwhqhn2O1Q7NoZRk6uXwZlesVEWhIatyO5Mtipw0j76NexS1Sqj2pr2nK/
         XKhz3NHlCoTQZg2Et0bTOFVPcfagRRBSq43JhAG313r9rGJtXiCkcyJtEMiNBQS7h60q
         WvnHVmd+DFR0QmTKduIaASl/M1gK8pCM0dFqNB/X4teZW5Ad2uyCqqW5Hi3akCy/Z5EC
         KfKM6mUzloaGuu29zFoEY8qYbZfsQtaEIhg+5ph4gj5X1tu+y3gYZtZTn6DGiOWdm9D6
         8OQg==
X-Forwarded-Encrypted: i=1; AL+hErFkeRlbc8wR/vi1xab49k6x6NwP72wSsM2IVU106/CPYLOs2pouokM0tOUrIq77l7Pb1V3baCNdIniI@vger.kernel.org
X-Gm-Message-State: APuU4Z+B/W5W2e6AGqckOy8emff8esRVf36RuHydAMe2MxJtVACdlos+
	os4MiNgafS1Ed5uJr91VzobA1lN3ChaxmXoditX/1YN+eob0xouFAySS
X-Gm-Gg: AZFdTZedRTLmMwvl8/14SWJIKc5zCMDgk2yKg+HdqSok7bYRVitIbkxOX2oGuz85Up8
	Eex97KEiWJzlBNVDSZyUDA9dcNTUSB5Z3Ci9+/uq7MuyaQvM/7WF+v5c9HfhbgS6mmR3q6z2xZk
	Io3czBH1eo+ovSnP/kXEcR8wLCGkMaA/weMB6J2m4dx8La758au3q5Bq4UfNlfivADgtwfgiI+Z
	Ms07VntSfyTdAQkK8+BGlbTKFF3SowtRS/+E19FMJ18cPPn/jeWtUactJ3KxOw2DaZPUYWRtkMx
	GrinbgAlbqbbNyhFBzghqyyyzW5EqO4pkap6c2RNO7uqvKz8Jq19jl+KPdvS6Ii6it7wjnPA7wh
	pNgtoQOmJ3JT42F9+7nm8bNKDyHS0dR81uEwVWW7YB5hGmojzj8u2nYLolSrI03TEeKD+PBoZ+V
	749aINz4uLFrnTtWhQSrn2vc48Xc2vtNmOfJGZOutZRpdop9K2zNOR0u2Cvv9LUphKuH3ORPOwJ
	ty68WRpq5l+RQX5wASp/HMCXV7o+Ic/sH8K4nb7qaz4gstrJwxRHlg1mtBAaZ3oKtXlp6N6D1wF
	1xJWTNBw0U4mElPZxo1xo11Xn7Y5rOULgebABOlc40Y=
X-Received: by 2002:a17:90b:3d92:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b41c8dc8a3mr20396792a91.17.1795770538277;
        Fri, 27 Nov 2026 01:08:58 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:57 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
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
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 27 Nov 2026 17:07:21 +0800
Message-ID: <20261127090723.741253-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 7a940d1815b6..caac366bcb66 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 865d7cd2f0e1..ff92dfb09649 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -555,6 +555,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

