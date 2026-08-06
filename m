Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ECB429025
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009032; cv=none; b=OzbwMhpj37KKBsh3LOj516mf1xYHmhx7wgvNwOVIXnmpx1ZsWKR/iDyIFR/gm5RS1j5DmaUU/yNrOATRBxe6NNKNdv87n7tnYw2YzgRrDwxIEaJkctHHAfRUWkClG5ZCu3MxnDHq9KOWXeByh0s0Zw89Rnb+2k4BH2uznmBHMgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009032; c=relaxed/simple;
	bh=reK7rFNBw0BdYQ91tXN/M3BLzkC5IvWkzOQ7lbAAVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u66hwLCIfT5LbUs/9qLTZtWDHdzDwkhX8Y7rfqICYcvzXj9yfcONTbAXqkA8nwYtNMp2FCAmehK4y/75XccOROM0Ee8eXtqsn0Hwo6si6oWawN7oN10jTGEXpmn7Jo4uYnQDyucWBAm6EEv27CBwNkBG86ZvVSj40K5BvMNQsyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM53nFnv; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM53nFnv"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc6bb7476dso2630935ad.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786009029; x=1786613829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=AM53nFnvbT7fhsU7KsWEXcp83bfGNSi+zHrxuxkw55a25BbyP/Pcf4XJRYI+8UroB5
         jzxp9nWImIr38rGLtLypIS66+FC3dNr0dbjn42jo+VCp2vId97TlVsb6sJkW5IiEVgAC
         K9bq3PhRtiEhYe1M/htIJivPAWbM+XVQxNtrTd1GgGFi+h+bJlgxsr3x6Wt6XPnhgBlg
         vAiHKCPJASoknavU9c32LZfSSuQy4AmocNYfDZCl7nNILIKnxTw3HOmAMczJFXav5YpZ
         sG2CtVVTDeTjQMsdubeN7tXjawsq6TVkIe/2tKsrNIoj+da/AVNBAlqjVADRPA8YAFKx
         Setg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009029; x=1786613829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uyTtFjVVo4Ow+xxdf9JzDuHeX18HS+OnizMa+EN8GU=;
        b=CSQrwMVjgBI2VQdwx4f802ufrJB1ik6rfe/cA5L4W/6ui4Gfxt6+mZCjmH4YQQtm7U
         LXBRkYZ+RRT6JeJaWpozhXdefSAqDANASPfuX/aboZ0bfCwRHncPSBnCjyjjqdd0Mpde
         9qMMhS35+7Es46AfSOv0h/XDDLMDJ2Xd4cSkUIw7q9FNBb9bHGCGIzT3yzBkgSpZE43M
         85UP/mVHyf06UPNEuHIWvqEfCLh51yP0iSHCkcotuZutzxle+mdkhj/fPtj83m1sdkSF
         qtY2zI4kzDpLnYi+OuECvNXBw/XXxvKzfqQyRydw3LNf0VunwICS63/ZyhNWLqHuQ4H6
         BMRA==
X-Forwarded-Encrypted: i=1; AHgh+RrveWOjqA62dR1qb+HDs1vRdDWUD9A5vbkVT206m5qQ7Ni8fQAOloNksyaR9btkui+QXW4WMS1C1fnN@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYnnaBMrbFll1R4AXjQn+sl3jL+eLMqzIRxTI7VuI9uGn9HE6
	UQNaFJ8DzxokJf99raqi8lPJ8gQehDtRnZLwmIVZ62M8/IX9EB4NZk9P
X-Gm-Gg: AR+sD12q7PFT9aWMu4ZnrVIkuF2FJuWCiZUM4rJ7OaG9zqRvH6nQDs19qkUKL9dio8s
	9KRG0Es5HApmnLG0gqoDTJ+clmtxkqHRCeUhFEUjgTjFn7DSo5Y7kfAQ65tFuB6KLlb9FvTHWik
	7YNqUEb2ptSNEwKNar7GZFak582ul+/bUKWmNeMGtzRwLOM9vRvuUUDpGOJUUheHrGLtJwkG5A3
	D4jSp7iE0Nkb7N3Wprxa80V3Vo2t30s26P7shvMCF13A5TWe6lKddq2MxCtMGb3SVW4FCDo6Gnx
	N2KVcEyoDolRFLD4XZKlVwgJ2VKL+Q6pBVDTaMJ0B4WuULehp/JbHXhYF/TMJKPNSljzpz7C6+E
	roTVeUKv/7ynWgptksElwVDeqfLvIEJt5CN/OIa5hRpKw14tt2xN+LqiUI1YwtuGFfXLMh1sQle
	DCKuqS1t/ipMuK/+fZt591NmNa0lXZ3jwFvHhZ12rqCqY5qgG59ugx3wNoW/iP713hECu2zi9vx
	w==
X-Received: by 2002:a05:6a00:464f:b0:846:5d1f:56d4 with SMTP id d2e1a72fcca58-84f47dd0b44mr3119262b3a.14.1786009028817;
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:37:08 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	baoquan.he@linux.dev,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev
Cc: kernel@xen0n.name,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com
Subject: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Thu,  6 Aug 2026 17:35:19 +0800
Message-ID: <20260806093519.2907771-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806093519.2907771-1-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index fb78b7814f18..8cc9d666bc54 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -269,10 +269,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0

