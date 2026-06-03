Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FCF3D88FB
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500487; cv=none; b=K1kYVoat2fUP+av/qCECmjB/tzFarItpYnPM2IFHQfK4ZqnWsMv8MGAXikkPYg5vI48LszisELemuVU8olBJhhwVhzeGtEeZSC12c2dp+mSmDygI/ecRnqtPof/Wf0gyr3sePhXVzkxn4OW3zlFyzDNSHN7y25ECfV2IgZ73PFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500487; c=relaxed/simple;
	bh=KvHAe0AvuOAoes4UZDGvh2s8NnStfb8rUlQlgpH51PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vw8LmAPCcCDkRXsxzLhKcdXMdTv41q+xA6FFR/jfcUWuiXpnLsuW98n/NqwMSBtEVdxulnb9tpiZHk0aYiwMwc7FpA91GCcAmQOJDYCLAd+ZI5tscy3k/DwgzbpybAco+m4Gf6J8shQpINpT7kwVgJX+TvdEo2+x5ZWgg9wJrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxIchyvI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxIchyvI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so3100757b3a.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780500484; x=1781105284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLtXXU0NJs5ryiC71xZHTIGuUy5eFHh/uyyGKZ/bRwk=;
        b=QxIchyvIWjNh5XVZqKBxK/QFcX/wx6PPA7bAKqlgRc2zR89PKo8EYgIEBHgFMjlAj5
         cLhgJ555qbCnZedrZtS1+jcSPzj82a47nivS4FxdxgrfQcv8VL25oCW+paCRl9m7oeiz
         M6BR0oMzrFtE0C46o0c//OLd7Ez+NiKDcSFr7F/PHSkX+Zx6X5bAkFqnI8UEKKZ1/cYr
         Jjqploq5YnDWgQmaDZGLCQdCd2fT5WCvi/0ZFuUKPmmC8kfe4TPI3Op/mzCYk6Awrt8A
         Y4mpKISLcSoweVOXPOT+iaVesYb6Vo2RatKmoFG+Paz+icGckPWCjZ/TcCFwEjxzPvq4
         UsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500484; x=1781105284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLtXXU0NJs5ryiC71xZHTIGuUy5eFHh/uyyGKZ/bRwk=;
        b=DCIpSGbfrzA2EmEzzRb3lJEz7SGmJwKQjHv/bZzNSUswS23TfRYmttLJwhy5CJSVMp
         /qKyGCtA0ZuFhrDkCu46ICFGKCLXoS37AQ9MQkPbhpzuSt/yKE0P10GNvhIzT39pl6Yy
         A1ubR4YmtMYbddVCtjyukqUHKQRfOq2CvCrodPNE7Dlmz8bL7HMHiPpuSx0jtURBrGUU
         njnJRATPZmEjYUlxfOF1l1Fq2TsDLYOG5D/WdJK0d16XEyUOhVgPBJs+AkZe5Rtyh6I/
         8XVU5taXXSFicPt8Q6jmyfi8OtR2sbi/wzSsqg1nN3UZHQ6+IjU+o9bBFB2TyvDZY+oP
         19sg==
X-Gm-Message-State: AOJu0YzvpONPKHvD/CMWdJ5jtXwhBIivR1xJpjVjQA5AuVPjBWlbnKbS
	tQoeBykcQFhpef0HiGIELICnwNLBUlgoq8wW05/UdKAw8Z+R7BdY3s9s
X-Gm-Gg: Acq92OGvQ37zQRzmJBmW5t5QHJcvOwSsmSFdyJTbgAWumQ1FRINoUc9WMEwPhzLwjZ7
	DOYD1vsoUzEq7AnPKSf7RqMs6SyTxVTHq6xTAb8erbWhIr2hHDyT3P9+Ute+13X4qB2DufPfYbb
	UF4+2eLa0lT91fq0a5xQO2giLBPEhPkzonJP8NPsrKrs70qDnVfVkmR3y5DxTHSSnczPdBk9OYr
	G0VisGpimdAw6QL7tdBnf39VbCBlKwW/d0mMjsgnyR//XJm7IESUpRtT+GxiVlMNwt+HWwLFRyJ
	+RkgN6TL9F7mhR+pd8WKAUuPxBlvKky0pDcumOLOV6Doo1DbAo/y1URxoEIlwxOBtEcRDEsVF2s
	5yD7XkuzgFTdpTi1RNgMr3o90d2MNP6ILfKeVZJ/bt8qE1AefV9eEsuW4+YQzaY+YCAEXfXqf4T
	93Vd1g4SSYP8NWsdk9PfkWHQBs3lSL
X-Received: by 2002:a05:6a00:c84:b0:842:4f22:f387 with SMTP id d2e1a72fcca58-84284f347bamr3766555b3a.49.1780500483566;
        Wed, 03 Jun 2026 08:28:03 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372a16sm4172100b3a.18.2026.06.03.08.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:28:03 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH] of: reserved_mem: prevent OOB when too many dynamic regions are defined
Date: Thu,  4 Jun 2026 00:27:09 +0900
Message-ID: <20260603152709.941788-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On boot, fdt_scan_reserved_mem() saves each dynamically-placed
/reserved-memory subnode into a local array of size
MAX_RESERVED_REGIONS.

If the device tree declares more than MAX_RESERVED_REGIONS
dynamically-placed regions, fdt_scan_reserved_mem() writes past the
end of the local array.

Add a bounds check that logs an error and skips the excess regions,
restoring the original behavior.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU-based test results

- With 65(MAX_RESERVED_REGIONS + 1) dynamically-placed region DTB

1) AS-IS (before-fix)
[    0.000000] OF: reserved mem: 0x000000043ffff000..0x000000043fffffff (4 KiB) map non-reusable rgn00
[    0.000000] OF: reserved mem: 0x000000043fffe000..0x000000043fffefff (4 KiB) map non-reusable rgn01

...

[    0.000000] OF: reserved mem: 0x000000043ffc1000..0x000000043ffc1fff (4 KiB) map non-reusable rgn62
[    0.000000] OF: reserved mem: 0x000000043ffc0000..0x000000043ffc0fff (4 KiB) map non-reusable rgn63
[    0.000000] OF: reserved mem: not enough space for all defined regions.
[    0.000000] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: fdt_scan_reserved_mem+0x5f0/0x610
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.0-rc1-00022-gcf5d7a55d3b6 #6 PREEMPT 
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] Call trace:
[    0.000000]  show_stack+0x18/0x24 (C)
[    0.000000]  dump_stack_lvl+0x34/0x8c
[    0.000000]  dump_stack+0x18/0x24
[    0.000000]  vpanic+0x47c/0x4dc
[    0.000000]  do_panic_on_target_cpu+0x0/0x1c
[    0.000000]  __stack_chk_fail+0x20/0x24
[    0.000000]  fdt_scan_reserved_mem+0x5f0/0x610
[    0.000000]  early_init_fdt_scan_reserved_mem+0x50/0x124
[    0.000000]  arm64_memblock_init+0x188/0x2b8
[    0.000000]  setup_arch+0x24c/0x5f4
[    0.000000]  start_kernel+0x70/0x848
[    0.000000]  __primary_switched+0x88/0x90
[    0.000000] ---[ end Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: fdt_scan_reserved_mem+0x5f0/0x610 ]---

2) TO-BE (after-fix)
[    0.000000] OF: reserved mem: not enough space for all dynamic regions.
[    0.000000] OF: reserved mem: 0x000000043ffff000..0x000000043fffffff (4 KiB) map non-reusable rgn00
[    0.000000] OF: reserved mem: 0x000000043fffe000..0x000000043fffefff (4 KiB) map non-reusable rgn01

...

[    0.000000] OF: reserved mem: 0x000000043ffc1000..0x000000043ffc1fff (4 KiB) map non-reusable rgn62
[    0.000000] OF: reserved mem: 0x000000043ffc0000..0x000000043ffc0fff (4 KiB) map non-reusable rgn63

---
Hello,

I found a bug introduced by a previous patch, so I am sending this
fix as quickly as possible after testing. Although we are at the end
of the 7.1 -rc cycle, I do not want to rush this patch.

Thank you as always for the thoughtful review.

Best Regards,
Sang-Heon Jeon
---
 drivers/of/of_reserved_mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ce1d5530ec0f..4efd521adee0 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -346,6 +346,12 @@ int __init fdt_scan_reserved_mem(void)
 		err = __reserved_mem_reserve_reg(child, uname);
 		if (!err)
 			count++;
+
+		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
+			pr_err("not enough space for all dynamic regions.\n");
+			continue;
+		}
+
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
-- 
2.43.0

