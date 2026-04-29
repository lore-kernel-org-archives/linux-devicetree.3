Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410AF39DBE1
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445965; cv=none; b=fwa+8kcqFMzDtrtjfhTitGmxh9wmH4Le5VREGPQQP0HW4KKJ5VaGmt1H9PZ722HVNOGE+aRUwEK+WMPqVlcv5r8bIVXBtKsHol9rpMqpTzVORbaZ5UP/f0/CmeMl33pFGs11M3tn01r8G11k8M1CPmAB17dX/U0BhWRUx/nSoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445965; c=relaxed/simple;
	bh=AscXsVQdQtSzP4LlCGAz/Bs520rvB9Y/aAxkWx2lFak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyK+S/FOPnY3iv63n5qpj5A9UZw5A0xWmX7oF83fDjYu+VGKqoayx9qANMRW5vHulYVCkPsP+Mn6izaMSxp/qAU8MTjnA8+SK+dIpYYnLNNaO9dggyWUk4twB8PL/XJOOBdml/ajE7myUyBlDyVAHtgz2VWvLcCejzzyBTb+XAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnVoxcCo; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnVoxcCo"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso5570253b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445964; x=1778050764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=ZnVoxcCoAveJ4rIHsBQ12JxKf+R9lgl5AhXozPQpSLLiF8+wiBEHHW0LJyxlViKYy1
         VAxJpIoy42UOkWXFdD+2e7ifiSW+OMwkY7HcsHMWb+sle2r8NJW7Lgz9QG4DxNI1NuXs
         jOIJ6IKwMpRE1SbURUdW72HbqFDVvYSKJNCvCuu19+bJ185LySuWdYFxCnz0xdHtiF7N
         cR35X9dLQPuQN/lQ4pP1zeteyWSQ+l2ZS0jBHoZ5y72PZ25GIu6ArWIhaf+YgJzDGHWp
         KNIorlgsSlCs0IeGDbqHW0ABCqFJwP2KSDBfKNomlFpyIjLtnAnBopCCi6+UePGsyPg2
         nROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445964; x=1778050764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=mv7RldsKFTulZnKoCoKOdx5Lt+/oFbE4enc0jNTRdHhucA/Z5G0Hou4SYtErj+rHJM
         Ha9U8yHNYapURtxAw0G2r30p8E2WLe+gLbx3aw+Ukr3Z45NvhGFow7wu5+Q0gKgcj77V
         u48s7D8lAYfhpdtrHBQ4YjnidZg2lL/NT5swBU3ssE5vP2tNg0dLhiqRNmXs6AO6OwW2
         yiktq/wC99IK7TmRc8rjFxtA3WWcW+c+JdMybG0tGvetleIMDhdV7HbyIYE0VE+f4cL9
         jYef2ikQV+7E369eH4H+BUpVwuJPURhEAiEw123A4TJjiQPQiX/UELoUtpUtRinlFzgo
         rIwA==
X-Forwarded-Encrypted: i=1; AFNElJ+jUh7qXubkKsypOR6cbcX8MwhE2T/F6ywwDnX+5QVNx69hh2O7ApeWpHrl2Z8HCXRtXFUoD258G0qS@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ0Rdj7CHO8eXGeaS184b5lPR9aECr+mtM0/3mk5WISlouxqbL
	57Rpgb6JGRKnz2YJKbrByVU1PeMPFem85xA0onak8+eXWcoqkLKXXLNj
X-Gm-Gg: AeBDievj6SEYnt5GxzfED7U01jotCf/YVfq/XB/fiFswWhIUvMnu93QWevqBKMDotXg
	3KUMDnI9mRO8ZpdnDuGTKP263Xao36qMHZa9KzSyUvxst/B/ojuxnit6ikzbOlVsLhukelhorI7
	94PH8jp9YFgEEoGVoLxud0p/KHfuw+Z7DLy2UAJKfQoR+mlr9KwiJIUhiTJ7XuzMs5OD8edyTaT
	i5j2Lh/va1Gf+WkO+eTuGQfPwA4mlEdfRmhIM3l/1Vg+VC2FPfSIYQ70n/3sF57C+vEa0RZu+VR
	iGPs0hJDeYj9NIDUB+MfyErM4AjHxQvkCnsylClrtJX5hNP0qlQvtoG5MmeQne15Y3yr2m8js1l
	JIpAwwZ2zk2oonW3Ja8aD+5QkOeCutrEzFMjTrnQZTchrWcy+gUvuvn2bBRe+qK4HH+HKkqgDNP
	65p0PR6oqPLdqlpwecX0bSY8pnsnQv8UkktFJyp0NrmsxhuXtC
X-Received: by 2002:a05:6a00:1c8f:b0:82f:29fe:7239 with SMTP id d2e1a72fcca58-834ddc4bf7fmr5980744b3a.50.1777445963631;
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
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
Subject: [PATCH 04/11] of: reserved_mem: skip reserved_mem array allocation when there is nothing to save
Date: Wed, 29 Apr 2026 14:58:24 +0800
Message-ID: <20260429065831.1510858-5-chenwandun@lixiang.com>
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

fdt_scan_reserved_mem_late() unconditionally calls
alloc_reserved_mem_array() after confirming /reserved-memory exists.
Two issues with that:

 - When __reserved_mem_check_root() subsequently fails, the call
   returns right away, leaving the freshly allocated array unused.
 - When /reserved-memory exists but fdt_scan_reserved_mem() found no
   entries to save (total_reserved_mem_cnt stays at its freshly-set
   value of zero, e.g. empty node or all children disabled),
   alloc_reserved_mem_array() ends up calling memblock_alloc() with
   zero size, which returns NULL and logs an "Failed to allocate
   memory for reserved_mem array" error even though nothing was
   expected to be allocated.

Move alloc_reserved_mem_array() past the root-node check and gate it
on total_reserved_mem_cnt, so the array is only allocated when there
is at least one entry that needs a slot.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 807b222fce5f..93585af9f8a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -276,14 +276,22 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
 	}
 
+	/*
+	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
+	 * number of entries that need a slot in reserved_mem[]. If it is
+	 * zero there is nothing to allocate or save.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	alloc_reserved_mem_array();
+
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
-- 
2.43.0

