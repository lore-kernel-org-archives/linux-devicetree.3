Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54243712B
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008986; cv=none; b=agaP89EPQNccBI5xQ0KDr1umz39idWkN1PYRzxkEKI2JVLWBqwKvn6M33SrnUUWmL7HgdpjGP++Bf9BBQZt8ol9BN8ylttT22ONFJ3mTCgYsTQI8yvQahnRrDtpNate+coUmfRDJbT4LssT30gyGzLcMP/lFuOVOP6JgUkxjobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008986; c=relaxed/simple;
	bh=EUNr4WhuIYQkkKj8MSIpKNUa/1/RumTAD0mx3DUcTaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fL7YzeJyzawdfyIQ2z53c0pVAuaB36AdZlpnXNgKEAA7TiHlB31Pp1eYe7QvXD0dOdeYLXuxmBHIjAvMEES5uchZpHJEIYcib6rvbMZ2UbRHuoUN4CNhyxunWLG+sQRfrUhKi939Bs7kMJitztiHn4hD/+K2P5OOv8zckD/Bdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMiAZn4g; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMiAZn4g"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8486ac3f347so818740b3a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008984; x=1786613784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=EMiAZn4gS3LT3bepYS+m6BPV0wEjth3aqnhY2i02TpeD/aOg8SsJbf74Os1EGZXbRm
         Kiak5lgONOImU3wPQGgp3/7cjo1a/pUj5aF+Rb96BJreyF0KshkJbXqZnK4mb1WWBMQt
         oJt+1/yqVddd8GpVAnJ32OEgHyH8QYRCR4iCQ+C1mTdfrfe0hjFZT77k6akkP2MgWr5Z
         lVWaUfj764udF7NJdW5VWDepqpTEkY/uungvEKUTQ11YJ3y6S7uhbL5efxWRAGWIQoqp
         mZaxtmTClt4Hy5lcpq+Lf505cThqbk3WTDqwatbh0h7KBvyDb19yUlHPIZzZexw0+LpF
         5E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008984; x=1786613784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoRhdZOCeEiS1VMpBUeU4kVAqK2jVYvx0TEggrSzApM=;
        b=TatAzqnBfVM7IWPFTTW/ZY8Vbc3nSxL5liDO2TsUD2Wd7HXywB+bqT0qYWJ71nH5fB
         mtIlAIsLUkCuHWRoGUCg6uCPbQedaRn7w7q/QtqqSZBgoys4dw0EjCFEvDpFGAXzLTzo
         K9epYiku93PiFSx+WxnJbk4O38bhk+tTuz1EYH0PI9Tx5fbE9AVeqnDH/jga6+eJLHSK
         Lx3r27wuns+4r5NU3aRJnaEGoewllPhuk8MH9e/KtiovSEsQO92gOMyVYjQQL8J4RATk
         LGutP8i52jVKdMrmNzPZH8BUZfrdZQD2ODHDilZZdYMdE33uv2h6BO1ZWNn4dhorrkJf
         auWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZwZubfN5gsblZl/LZ7jHj4XZHFvbKOyMKIKIeEUQr1BQojux8Fcfdda7Z2C++GnAZfY2ONPudwu53@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bz2XXfo+exaw8es5q8O+NnhWVKgTL8Wk6StBgUmBhb5fl8wd
	lEC13fY3C8J/Crse0x5pP/XxOVZbVxC3/NmdEwU3dvvvdRAnn0/jGcRz
X-Gm-Gg: AR+sD12GDfUdI0LBlyQqLjS0UZitYXF74boXs8vDmsyWqWxcgbKf/xaGwGvklJ0HkIJ
	USm08vPw7O/R8h03FvntpOICnHeepfsXHP4l9/eXLU8uUkqFzkziKTanzommyLoMB3CxvVVEZdt
	G/RrjiG8Y8O/QkexGPyTaJ8q3AJhd4m/NWjQJCbEeONAezNUF5edxytVfWttRowkGi8x+RZYUuH
	VjxzqIdpzeLSAaxFEDg1lVas6C/NfM0GUO91D/CimsJUvOEtrVzzv85NI+ZHXB80aGZbD+9d2mE
	7gAAj2SxxKgpRSh7C8BqbNibhFl8J1TRum+CdnpzNZAjXHEons1aXxxVQZKOthxEeEzyfze2OXj
	kA+hbeKOGk+4dBYKsELhkNTsiXsLd/MoH3V7xNBDbJH5KuOT/MfEtmDaICzuqI1dy8Z9oBIWF90
	t2/tUqDm7LjJOchqW4kfHNDm3FPj2GrDrpdSvDUtvEg7i/KRAkAZVXI/k/00Ie1KmzyN6zMwPDP
	A==
X-Received: by 2002:a05:6a00:f8a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f41df42ccmr6551184b3a.9.1786008984000;
        Thu, 06 Aug 2026 02:36:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:23 -0700 (PDT)
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
Subject: [PATCH v5 4/8] of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:15 +0800
Message-ID: <20260806093519.2907771-5-chenwandun1@gmail.com>
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

The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/fdt.c             |  2 ++
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..2aa888997e9b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1286,6 +1286,8 @@ void __init unflatten_device_tree(void)
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
 
+	fdt_mark_memreserve_nodump();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..667ce9e46aab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_memreserve_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f38d11df6f15..f0683b5d77b3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -251,6 +251,38 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+void __init fdt_mark_memreserve_nodump(void)
+{
+	u64 base, size;
+	int n;
+	const void *fdt = initial_boot_params;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!fdt)
+		return;
+
+	for (n = 0; ; n++) {
+		int i;
+
+		if (fdt_get_mem_rsv(fdt, n, &base, &size))
+			break;
+		if (!size)
+			break;
+
+		for (i = 0; i < reserved_mem_count; i++) {
+			struct reserved_mem *rmem = &reserved_mem[i];
+
+			if (rmem->dumpable && base < rmem->base + rmem->size &&
+			    rmem->base < base + size)
+				break;
+		}
+		if (i == reserved_mem_count)
+			memblock_mark_nodump(base, size);
+	}
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
-- 
2.43.0

