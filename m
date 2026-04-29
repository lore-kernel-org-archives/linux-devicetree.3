Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980339EF33
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446024; cv=none; b=k5XFl9adzF3kU4WSlSywV9DYOtkjJGHgxcHAyUrV19J9WGxIFMhS0czuquOUn1XJGMErKTKJ35KtlLZ5HbGUtgOAg7EWYsOj4Wti7qgVy4psfnuIvma40SkUDE9LrTtrH0arPsn72+g/7XBypVBGDYe39k9z/PqIsSmiOQyC8i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446024; c=relaxed/simple;
	bh=t/lgmsImXNg9vJwTMjsNuwxZoj6hoQlo/Fb9w/nVF60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=id98NwYvPY+aVuImDvbruNrvq874YKR+lyFZkIw+Da+uaybbX4ixBO1I/neMoVyj/J9EFuPjew3wrsNPV5V0Nxt42fpuKvtBZcn5cAbQsvr0/yJ8QCU/Iy6UlUPKz90dUYkAfmP1yolK34r6daYMa7U+mNVxRFl3YicM2f6bJM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG1T0NpL; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG1T0NpL"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82f943870baso5218872b3a.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446023; x=1778050823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=gG1T0NpLo+2VjRA41OTFcRWlSDtBOXdxKrw6R1vd78sXDkBvh4Bzi+tXYQPpwBO4+a
         x9+LMi1DemL9t9dOzoXyrSe8RUom4rL1kKlGEFRrsiBFtJPXYgVLqiFaroflwNcb8zKL
         C5X2WX1LElTfwPUrQ9ehb9cdlIV2h/oDn/9kwkn4kggaW7AirQAoWTlcL1YgjmrEYidz
         IHvRzBUKHH/c2M0RwnYqpz+wWXEH8+OZb/az1BOVO3ok4kSBkeJ2TlaYAoZWX16grR4l
         JteRpOZNuYYhTQn6CYLmfQGB4spbMFsaDihguBdk75xgIzdj7+v0xU8ZhCQ4U+g6DBOC
         zOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446023; x=1778050823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=IlLFoN0hAazDChBfXVzRODUwO7LW171IL8VmyR3PQo2xwZCdhiJZF5hETeCnSRjNHS
         0Up0TFZNV/DhO0vCWwkkLqiRvW7nhUlX9dBR3VpKUIi0QV2Te7SXlU6+TlU/XBLNx61E
         q+UXtI05jsE6whv0f3IK5+ZxG+dOJYAB5dh7jeqgaLcSNHD9n2wDQDJf/rTC7X46IzcM
         tslxUwtZv0pRnSj16fhxGYLpqiendSQADoAZ8b3oC+5FvxoskjkOqzffjztcOcaCS1uQ
         fnDKTuaqQtRBfLmT+ftMnDSD5qGDyB3EwD9IPRZq6XbrJlg7TmN17Z3d9aJ1/x6Q2kdi
         srFg==
X-Forwarded-Encrypted: i=1; AFNElJ+RUOMHsJ9+eEFNUMFvY9orGMUA2QzoUoq76e94mzhbOk0PXjXBnGLUmFdRkKsN9J34Pl4yFydvocdO@vger.kernel.org
X-Gm-Message-State: AOJu0YydGX0YiWt5B84f0rxs7MaF2/ofQrNVt0lIjvdVFbwE+f8rUiFw
	PO3oOlZGxkJ6gaihmFj3VU8SXEwMtZdg7MAakWqDKQbNg9qOMSQSwwiC
X-Gm-Gg: AeBDietKhntMCh9rxrcw8Z4+BIVpA1AvfuWyIXPa49ZQrKmo04/NeqFGIE6CtCAbn1q
	MWhnGAYRfcEPcD6JWOz2NS/C4WvalLJfCCK+NS/SP2tWCQah98r4yVUQAzueFbZViwrl2JHYDfI
	ZJ28xz+5YSkhpLFkxrSDcByVs3BjMhZwUO/yvWGtAe2jX1KnBAdRN5UDjlUZM8TeYs24PepfPaq
	bc7yEnRgSlRCNzROs6knYfFFz+9Lnq2VRb7j0QF+e5GcWhHiqzN9hqNEtELd1Eqkgib8MnB80RL
	wdj2Ka/JM6ZWuBp28ip2Gv2vlpKBj8xY7ZBl7kcR4Sr0FswkLb1NA5drsidLsn2lpdcWZ61KXx4
	3WvKyAVw999XfzgT6yxlHiiST/cQuZrCBTSsm9KZcgUvEkOdPeAjx4lajhQlV7J+CEGc+CpR+6j
	WgIHpM9bTVGi4XkhQJba+UdKMmcUFCmXAmK+CVXUL4iNvWJ7Jo
X-Received: by 2002:aa7:88c9:0:b0:82f:b519:a5cb with SMTP id d2e1a72fcca58-834ddc50c40mr6750211b3a.37.1777446022861;
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
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
Subject: [PATCH 10/11] loongarch: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:30 +0800
Message-ID: <20260429065831.1510858-11-chenwandun@lixiang.com>
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

Apply the same no-dump reserved memory filtering to LoongArch kdump as
was done for arm64. Use of_reserved_mem_exclude_no_dump() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..742fb9affcb9 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

