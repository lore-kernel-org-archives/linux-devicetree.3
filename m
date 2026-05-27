Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D59383C7C
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852640; cv=none; b=A9yIp4A9BjEbzv9uEnKEDHYyfXGiixyZz/7Gb0r3WFr/JPVFdmVgFWNzIvOuxP2qXqXSd4ZPes23hlu+blFLRwChom7oX+ceppOUEOalz2r1ZApP0CuBSMCmPZmK/DMBzxmtm98C51xIvy6DdhmiA6SEG/QItOliGaantWFEjSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852640; c=relaxed/simple;
	bh=Da0oBjp44x8BvyVj0AmgQWkstuuP08sX20VzouoaLK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf6ju16xZZK60pB63G5I6PHZuRRX8HpQReC6TpbK6A1EScJZ2zsboYisUom7D1cgYO119Jw4aBBA/k9CzgepXb4nOmC60rsI5P9v3tQWPuMRsuleLqGfY6ZoNJQ+eLWcHWERyJNbgGd0XuFo2ebrwm7eXb2uPTAFqVFX/ij7+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flOgeohb; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flOgeohb"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8379e010b01so4861297b3a.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852638; x=1780457438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=flOgeohbcvCEw9Kgjt+5g+tX9miIdczk8Yw2+ILOaPmkuhnxdLvCNpR2AHZX8SrE7s
         oKP1QPTBmDyMvsEFApDtcmG67Bv7NuaqF4X90rva+GeO9OtXivhjpoeTlaiZ7qjHuYHE
         yi4BVl9R74T4O/laWoaWF1TmpcGSnkFShJifl51gM23tj1kAgmTu60pogVIqy7+Oc69b
         ExtfUVBhaa+XSqHeZG/N10O/+kzTsE1tnB5o5MgmKqRBX8dVVaK1TVeT8ZF9nQxrT2XR
         1CYsReC/sJDNE3EUwb4F+dxS1y/baKV4gsJl+pC4jqteCdd6+mHQCoowdeKR5erqXsHR
         qXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852638; x=1780457438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=ekgOY3C2ziq3yv5wnlkwNJW46Sxi7b1t6KX1fpHnd3b8OT8mjT2W0A7/MlxmM0Egho
         q8H2KyieO/Pta2uDPKQr6DlehDtnLpA6TPSaw8yUgj+BR/DhsXWcPc4mW73nVJ6OvVDf
         tQQj+KCGG2Gnx0HTpBLajnjTI3CKz6MWp/ejTEB+K2TDMuzBqcB8oty7R3KPYJYz1rCg
         VNIC6JyKcMnidVRJ2kMoKyWcBfwGdSfs1XqSfyahJevhwjDkoJeOBF3GNYO27eRYiPAl
         hhMtj40fOUr8NVLEz10ngnQ89yxwqY9i3LmFd1WQMZIj9GqhwjjL+dsx8/y5UUek0khX
         99UQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2+yo6i0KN/YChgNFIzluWye3AynuS4Dmoc+kTcldeg/Rt6XTOTf3sQRSlxl+n1S8gzufMNADSadaa@vger.kernel.org
X-Gm-Message-State: AOJu0YwLy1Y1C2LDTen113KRuh9Qy2AXACuQY48YYAExdSa+EgGoEAXq
	63gjk1rxM/sIfKUIG9oL+nFPesZXwRtSer68PgGdiD9kOqn4wVQTdW78
X-Gm-Gg: Acq92OHXA1tMVnezUUL051qqZMH94HhMge2HMW5ulMCfd9WnRoibgWDXvoh2xKq7Yxt
	betKmngbA2ACW0QFSeLW/49uUdnLulw7bu7yAdH5NT9qRAG8/uCsjy4Yb8/YOmKuDN4OZRNqCGj
	Y6SdadXYoL3FoWUEsUne99knRfuC+fUf657sE7Rz5zXVwK42rnuw5l6v7kvoxXgbu2O1uFT8Vsk
	QYidhlqzqbvgTJxXUC7Siy0eK0W3kMd05GnkI/zOsrB2GtvAxtYNO2PuL/q0YtPIPMpqi8qX6cX
	wDJ7dklOR2ImKRJOPEAhw8evswLnsgSYGEthHsdbVBK+u5gCvd0wQtN3x6lkf4vJMFclX5t+kd0
	N3FFrDI/LepgcQRSPb/ZHW0ebdb1f5ldfymxeIYQxlTaqxGGUYWa7ptGW6lextkf5E8fF6TAbZA
	qgM7hF/XYR7Am3TSTbn5OznPmbkfT43GxWRlgm
X-Received: by 2002:a05:6a00:1d9e:b0:835:38db:82f6 with SMTP id d2e1a72fcca58-8415f69ea9cmr20057592b3a.36.1779852638276;
        Tue, 26 May 2026 20:30:38 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:37 -0700 (PDT)
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
Subject: [PATCH v3 06/11] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 27 May 2026 11:29:12 +0800
Message-ID: <20260527032917.3385849-7-chenwandun1@gmail.com>
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

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
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
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

