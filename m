Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B7E3BE659
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268773; cv=none; b=t+hFzia1W4rjLR+HfX+Auz+rn/08FZyUhWjpKJ8qJsd3KVEQlHlw/sJDL5JdFoyemnilory7x47uTHoQp9C3KfFpiQiYvG2umddh/qomNewfkMB3h8dWljkoT8EPLO5j08/nNhIAMI2TxuTrDBPwzZYyYgqwymLaYLJudYPuD2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268773; c=relaxed/simple;
	bh=25Wos8h+kuVxYdWnXQjvGbC62TvhYYtucbzUo5/jn3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjO0MsDk9g25wW9GL2p6Ih+3bWXkg5UAIYtnbJrOb+FgumWngtURi9styIFdsi6hw4oi9o/Nwr0xi321QCPcvAd5uIa8MaNyyGM0nBkmb4N/Zt3RwHld3pQmVsJxwuOtPlCBkjW8jn8Rf15dTGuZLHpRsWSDLb6rpfSsiEEEUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv133uTE; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv133uTE"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2171799b3a.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268771; x=1779873571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=Cv133uTEd7NoIU1iQ72IFWNo9+QdDJtmJ9+EDluXIZWepY4Jh4JKGb8ZjkGfQnxqTK
         6jWjLLM3TS5ksgZYRgyRtPIH4g+5LuRHsf4cCmxeqkRzVK55MPTkSAHukSJCHjla9BpG
         m4SS0EM9QdoR2WgjdnQaQ2ZaExMiS0WDUq+06XhF+5HcsgzMbTiiTQNG80O4yIu+T/4q
         nBvthhe5FOjxvRFJiywgGtenfWT5eQeWSfbowrr+EaUqznAeyVvbZDf26c3D7sjRf+BI
         kgzI/pvejDST4gc3rj6V5A5nhxjfcx1rbsFn4+BmJOAnDwcNccIbzi6sDr2gp4lG2cPs
         ls6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268771; x=1779873571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciQnv+j7sn9Iwh07+rP7odEwkTvIV/Tmpz7NteXq2I8=;
        b=WtGi9JHznPKdvDcE3eXDVYMF0ZyoUc6KQ50/nCzKbpttVRURCLDcAIkoip0zBr7ipY
         kYf9Vj50mWSZG+AZHUlLl0Wa7N19QBQPdO1fQbj0oqxIMWaoQPNlDUbbACCEABGqinDq
         HRYAiCKPf+7has2+tfJkNPQrUMV80t70ZLHREiLhyq29l6mCyBNi3HeB2SKZw35cBDA/
         LDouhIXSV+sUj93YFCCXMxxxkj/HBG5MJJcFHvOs8GhMe5b9UfvDJi8/e9G5iXCgQFAE
         74MePu9qFhhpJz6BH4asuTCiqet2ScWhCU5XUcEd7mH6D8dbwRcVtPNqILvBlAlu5CC5
         /DrQ==
X-Forwarded-Encrypted: i=1; AFNElJ97XLkIn4jKUs/JJ3XZ+BtE5dLoxleGL0m+wG6DRCSDwwsraOWlu6ur+hKd+j1pKzzTkjEw+JUW6Cdm@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0f0YEf/8wgDUbJa3m/CmiDZc5hAL9hPYWIVs0nT/HC2ywibV
	flspcPVo5IIquV3xNr7PBLyTyqoLUAlotzfkg5a1UKzwHKQplgPK4lEX
X-Gm-Gg: Acq92OFcHsVFeAUqesb+qG+7QK/Ilcj6y6wNGoIAr4AEUgO6BAUHd0cK5n+UNaT1ko1
	UAE3bba2mZ4yxCmt9Xr9xioD1dfn2qU1gYpkYfeQc8fHCG43Z5YR1j10wiM9ZLUX0XjxRLjzFgk
	MXd10p/+jzesboOwTJCtNbLMjdx7wSsHO4HHlhgZ1iDbad+tFVEFyGUDc9ofMiXf/GoJYJW7TKV
	Vh12diuzmChpdwVqpbMTForKWIveSM2elv0RJWLovZb1k6sN+lsNg8ATZT+DcqhB9bLwGZEnntq
	6ZWnYIxw1zofZ5bccSWxr6qMyn1Th5g+pAKlr8xvFlCDuv6OpH8b6Nlp4p6NDoss+/0JGquFPz1
	tucM5oqyd0mDVzdtvoKWWll79fuhL88/BGy65zopTbYJ47TsMRzTVbyurdZ902NDMxHMl+i/yma
	4RHkYZn6brqwJAqwyFeRQ7A5Cz4Qiy/9MyANPdEroUpVCvA7DQ
X-Received: by 2002:a05:6a00:90aa:b0:829:8c08:d1f4 with SMTP id d2e1a72fcca58-83f33ccd856mr24019073b3a.39.1779268771454;
        Wed, 20 May 2026 02:19:31 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:30 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 3/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 20 May 2026 17:18:39 +0800
Message-ID: <20260520091844.592753-4-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

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

