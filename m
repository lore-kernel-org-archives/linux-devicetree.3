Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475C63845AF
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776521070; cv=none; b=Ri1qyrnSPljKRu0D4s0kxqupdbGqjPpsYr06MdGlKKspWgXHw7VxjXHce8FQ65MfJ19VOlPxSB/Hn3iDeANqzreot5Txdqs6ITfHtZRqvOosb72FpoA8RVMchR7h5pMPUTfJxabkGHYzulOZ/ji+W2DGVNiOhE/Iz3Hei60cCUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776521070; c=relaxed/simple;
	bh=yc18ztJG4osZ8bm0qipDK+7zsSdmqsiR7hXrTuncM8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWQMaTm+0zl4/s8h3Qm2Yqi7bsA2TayKn5P1Kya0kRbMhWUw+gTJBmyMQyBKhxiyKBVTW84ljahaqkm53KhoWmA0/zpk4Y0KozjqdlVeZFlfiabqY6QtlwplWqBf1Dk/GfU5UyLopS+twwd20IJxqOyHoDpd/JS9QmHyDuvZ3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psRLuait; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psRLuait"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76b6abdb73so1039427a12.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 07:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776521067; x=1777125867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UX+XLnE+n26GbzvVTx+sR3X8DY99aZe6Qgz/9cD/YQo=;
        b=psRLuaitwHpzOiXk83LsCOF17lQmm11Yyp7MJ58mtZIYAyLTtjGWT+dv1rv/omrt5O
         5lfUJ1JM4A7Hu88KYSDDXEwcRewVXl2fm7JAkCcL7YiRZt+qKL1U6k2cvVJ+QBMTmNO6
         +Neudq3swnJ6H8hyfnkdBTptJTyWd1inJQgJJhhRY/+PxeQQw+pxzKela+f+9qb4feof
         VGyiUUMqZ+RT56kk+oDfgSgsovJFMFIdy4MyH3e1t4kXAM2DiCXgDkqlvFo0DmCuArmf
         ZMnw86LOtCF7YnH89GIV9oVVMN68MHrWjV8Z0ZbueBwY8ypDyxm/lP8zBMefzW0jtDRu
         adjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776521067; x=1777125867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UX+XLnE+n26GbzvVTx+sR3X8DY99aZe6Qgz/9cD/YQo=;
        b=VW7DNFTz3M0irqpC7Ss1+HehtAcQRs+4fOEYx5pkS3sXYZCD6MwI5kXggEXGIQFzVb
         3a5SKJ6MF/tPtb0bmxu32oxBXkFDevjiNm3uK/FF4Try1X6lA+Gbmr8wd5Ps3yuUbRYN
         GcmySplsMyt7M3l0r3MuJgyWP0KWpgn7vXMVj6ZZuUBHhO4XMZCM+XH5K098CRuXby+b
         pf3qUHP3H26Q/HKHG/ASQ66O07dDJwCgTtzoIISTP7Qv12oHzAWFO7KSj+lfbv2I3SXo
         DSqvIjiGDG5uEq6qacEFh3bFm4gLyxaVD+4+D1N90rdyXbI3lttQkifCURhnTyA+WZfo
         bSpg==
X-Gm-Message-State: AOJu0Yz2bKtx/OD7D+cDZDcVR3nGP7IlFDVJ7l4bndTPZR3xEGiGq2bE
	N1JEFornFpZbd93iMX6PC91B8H3oPMpEb6qTFaSjr4z0K8JZDiuxz2t+
X-Gm-Gg: AeBDieszw9WlyjI8b7KQbUjUFYnqvQkvrCy9s/cucZiZ+jsv0cxJKuAMA34LPGvQNof
	hHKICKFwL89DItqsTo51HCQwBXL/7PNZqHPi/3SAGiYSEIy8L2IuGfVV9WHPYpmfGf5zcJPshzA
	ANbF1P1KW39ZwkfLSZcRadKa3TWCNVXWqGUAIDup+IZCU1M/43kzsULvJXVqjTHRsa1D8mmmsbq
	3Pe6kTJGz2GlideAeoUlyCFupc7U6stFRaRvkQCCqcSgEUUcWLt3adQC1U5nU9eLtzIRqkv6HTx
	qfxObgK9e8CNLD0F8Q31zCzj0KLU++dFQ3GxthVfWZ03f6oH5CAyEkCAHlNGVIdff1Fy3R0zFkA
	azu79JMFRkKtHWhFNNlLksRsIGWcSC9RAQ5f/a/uIWGvJexSBpiEqDSyOdDNWYyEdbVVSEo6ivC
	CabVM+F1H/tWmsMgXY02db/I8zX9lp
X-Received: by 2002:a05:6a20:9389:b0:39b:bee4:2955 with SMTP id adf61e73a8af0-3a08d93dcc5mr7149913637.55.1776521067230;
        Sat, 18 Apr 2026 07:04:27 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e985a72sm5410933b3a.11.2026.04.18.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:04:26 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH] of/fdt: remove redundant memset in __unflatten_device_tree()
Date: Sat, 18 Apr 2026 23:04:20 +0900
Message-ID: <20260418140420.2221736-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All dt_alloc callbacks passed to __unflatten_device_tree() already
return zero-initialized memory.

- kernel_tree_alloc uses kzalloc()
- early_init_dt_alloc_memory_arch() and dt_alloc_memory() both use
  memblock_alloc()

So remove redundant memset after the allocation. No funtional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
dt-test result

[    0.529540] ### dt-test ### start of unittest - you will see error messages
[    0.532758] ### dt-test ### EXPECT \ : Duplicate name in testcase-data, renamed to "duplicate-name#1"
[    0.537608] ### dt-test ### EXPECT / : Duplicate name in testcase-data, renamed to "duplicate-name#1"

...

[    0.781700] ### dt-test ### EXPECT / : OF: resolver: overlay phandle fixup failed: -22
[    0.781718] ### dt-test ### EXPECT / : OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table
[    0.781945] ### dt-test ### end of unittest - 423 passed, 0 failed

---
Hello, 

While looking into boot information, I found a minor enhancement point.
If I misunderstood anything, please feel free to let me know.

Thank you for taking valuable time to review this work.

Best Regards,
Sang-Heon Jeon
---
 drivers/of/fdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index becc855ff8b5..647bff2c4521 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -391,8 +391,6 @@ void *__unflatten_device_tree(const void *blob,
 	if (!mem)
 		return NULL;
 
-	memset(mem, 0, size);
-
 	*(__be32 *)(mem + size) = cpu_to_be32(0xdeadbeef);
 
 	pr_debug("  unflattening %p...\n", mem);
-- 
2.43.0

