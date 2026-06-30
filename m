Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB253DA5D5
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805702; cv=none; b=Ci2CWuPANd2gFzDVVxCRoftK/L2p249nU4J6RFO7C76QDtiMNKlXHnpgiSc5PWDN2o0xJAxPPMXbrYHQgJkUo6YtWUvjcjveUu74qPeR/uNnhIBRFSOsLQLxTOV+Za3ELTfQY7EllhaMw34brF3e6djq4UjU/EpCmyO+DFfpqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805702; c=relaxed/simple;
	bh=lchK79R+AmUhTZDwGVbOfyN1yZY6T1ioSHcBPnnM3IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnwdW5foZNBpRXkbOcoZc5AKaj7ZS/qCnqRIlcIEclNeFqdo8oQpy9S8vwpP7rk2qWYb8W/VGc0ERbdXo+C3HChi2W23rF/3EP869+V3EXWExzk3ZJCD9ECri9TLrzLzaP2MPA6uTi1Sm63/zjJ62lfFjU9zfqYWTVzoIs1VGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMdb3V6Y; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMdb3V6Y"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso3258724a91.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805700; x=1783410500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=WMdb3V6YiunpKiaDD4rTHdOXXp9k3dA6PVzim1EsrBa/VxrbwPghDcQpoFhoJcNdU5
         RClQXE8QP3WZeOVOnasNcufm6JWyeYS9/FL10X0uGQ7BGDYJEc5KSLfrCRyOEmHR8Vgw
         o7GFpZAWlgMw7CD5nGn0p49T7Ecye10so5xTHmIFWWIte1prXrBSDf5qlrMCQHT59gqI
         Kq8B7gv5cH/AJ+SQ1mU3NWxjtfQ8Tjmt1NytUK3Crjq3Z14lVMJB4AyVcvrfyZCG1ChO
         gBSav3/i7GUTVikggI2r5+VMehLnXO7eB3lUoyfEToKixEFfmpLFKBJHPKX5YqDFJQhF
         0iHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805700; x=1783410500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zXdqCoAvNU5Q6CQ7sbboLRp1ZBRBcN1iNhiraDQrK4I=;
        b=CGpl7yjLPZWb0jzEgD2r8bJtMYeg9J45N8gN1YmF5ar7aqBgr+PBcK4nrbu+IGs+v3
         vc08yaS5CRxavNBrOsuD1tUBOu25xWSOw2yfbfFTi53oBd06hjMjdbbk2sqc+HLQxMBr
         5djKx8ke22NogvoKzhp3ogqP5SOz32pPd/gVV4u5pQ7CslmnxtpE46GPOjf9r5XW58RD
         cNsblkMOZyBvWQLXXHoH+yuzU/2xB0QDadj1ZQok0qRbyTQ5p4kHns3sX1lM/baKceex
         qf1sNDId/nEZvCjvBc8xTZonOd4F+si1Qcp273av/u2aNvGF/JKnVFbEkkscOlNBbxzp
         +uJg==
X-Forwarded-Encrypted: i=1; AHgh+RpNHIMVp+eQk45pn/HRi4EtOeLCbgqHTLBqmIqQs8/YqfP5XoMU/iARqie1f9OG1+PvxjmZ03/0XhCu@vger.kernel.org
X-Gm-Message-State: AOJu0YyME/BZd/6H/nkteQnSfbINoJEbJTI42IfXHTXNgZvwyickRBcx
	D04nUX4YhYMdtWA4c87G0ORJDIjdP7aponDVMmMHFK5vaisG9I3koGQv
X-Gm-Gg: AfdE7ckO9YFVnqgmZXxTZsSWXuMRexjMLC6d6jZJwvkZ7mj5CX6wWLLzk2joLU/AUaY
	IZ57DuiaoR1s9r/3lXOQ96nM2v0xFc04YSeXG84jQ+hN++7ax/JXeX4/+YvYBMnF73AwOlo5AMx
	eWuI1aZmAMf27mAm3UuLfR3zYLlRKq/9K8lH464qc4bJMcNSXxsRcYbxqkTWsjQ3OGwdCYWQJa8
	k4WlcLZZwZcCYU9UaP1baVUtXUsU+Sf/wuzo9NOGDzr2zIjHAJQozAJr4axaZxuMaHKTWlDOIS5
	6J3tCgLGqwsSTh6K6R0TEBcW9y1Ns5v1MW1vMnfRpGSsny2fQDSvcjGfbdjX+8/s82e52SwlHg0
	sdEahKqZ0alMw+J1wqvGS6jTbKHzCCRPnfbneAflJDJElwonVX2bpWI9PPMxRAtb6uecXub18Rx
	7CFBUxfJsip7z4OMl7eaKhwcW7QA==
X-Received: by 2002:a17:90b:2249:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38052784effmr1969443a91.23.1782805700221;
        Tue, 30 Jun 2026 00:48:20 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:19 -0700 (PDT)
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
Subject: [PATCH v4 05/10] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 30 Jun 2026 15:47:09 +0800
Message-ID: <20260630074715.4126796-6-chenwandun1@gmail.com>
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
index f754079a287d..63ff134dadd4 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -565,6 +565,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0

