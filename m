Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14EB3E5EF3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805725; cv=none; b=n1dpLKs+NiQlork7vG9yFVhp4Ud+PvmJYHzFhh0mnvfbZlbjgnAnt6cFV72qUbwMMyFs2rXM8UlHK5ZUONUqRJeE2goVqP/FmznH2JKVoaDNyQ19RqmymfRd5XHegXy6/kiP9wx5kTDOQ9NtMO7TM7x4xhcMsloZ0Cbt7h8igqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805725; c=relaxed/simple;
	bh=R4rDGKMYp0Cv11TJSWOHxXf+D6RfXuYF4yaNoTScwQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saJqnkdaXr78T2sqotHuuMfuQxwEtzOHAb1iQh/due9cgkdH4QIlQ+TVzcygcEp0KS9aWU28qpdl18iOo+RdRu/qumOjss4DZiHrmIM+FyHMSL6EPDgKTrk5HFNHR65z1cZ5JZkZyOnwOTsfW4gEs7VtnDIsHMHaBk//esBFYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLESRwif; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLESRwif"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2c979d03538so13168705ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805720; x=1783410520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=VLESRwifj0aBDzHUAbzl7dVNcolf25tm5MVityMN6T8aurdTmVibYVCn1sJC40hM1k
         PdGZLZxhW/ZOsnD+6eg6Dt8UXdIs/AcGq0FcZipvuk5h+2SRoPc1USfww/wF3sx2x2DP
         TBPg0wI94t46DSvKvhrRujbSoLDfHzPRWYwjbFVtFeYvIQ1GFjWlGMLb9jKk8Beh/IvM
         N5DqRfgzP9uJUur1hosJZG0mExAPux6Yly0tsqZMWFny9uADxbsPqEGF22bZrFg+OZVB
         jQKOhBQUzko69X3BUNBfrouHnVHLCaFF10h4etN1Fabu613GlTRAp4aibtd97kIL1nq1
         XMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805720; x=1783410520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nur8Ymdh1FRAljY2SkKXlWeVVD/O0p+FPkDXgbutnT4=;
        b=EyLYgYhInoHA5fZj9Strp6AfENIEMrTd8rddY0nTyqIBvNTFnFW8QnPjkw6jT3MOcl
         qvl7HlcYBa6FQJUT+FjMXSKXBDLF6+SZieZV42RhE3EQILBYYMncDR46tVAcPTHI2kDb
         cof0icvWwrZAgWiEgGDlxSK+z4qkmkn27n/RsKh3nUPsI90UYMUNkyuOSYg3GemIUwM/
         aibr5bW/hoAZOurPfljrzLeiiWFckRiHEBdBFuC+BrRm7vd2N/PTl7hJ/378g5j0zPCU
         0lhuYscMNCEUgIdF1VvAB5HKcOEsA5GtvRivsL6qtd8R2P02Ok6KnWMZ723cq8tQhSBT
         GL/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqsZBcRvlQ5OM8SKzpP/vbnBqEL3s36BfXn8j8Z8WmcQxfFW9T3xzMrxgj0YRdQQrHqIiJz1GKkGpf0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5V9pIePwWROOv/vOnXcHB5PIrRIZH272sk01R/hkFzlhYoWz+
	jNiyLNGBCYt6M4R7zBYztLSC8kG5Q0gn9N482KSrX9Izk9JInlgB34in
X-Gm-Gg: AfdE7cnSqmlLTdlzTZ02l+iCh1rxb9zedL0y9Tp4Y1i/+PfeYe9euP46Zctkssnd+Ea
	GMjI8XBSMs6Qeds8OFf9q8CECnfThJRCYGXaoRAYt0DX5US/uBqDs5mujhuHS5MOKJr9+KnTBOD
	DpjGvnAFGJLz8ejFimwvh48UFixikaQZ+YMsdTqr/gSKeyV9/n9E2ymAjx5zLICYbNWPlDOHmDe
	x7Ai8azgxU7S3QjCNNR8nPRCJk4ci3ZK3QBJ3uk/2zhnlqfKDc7sPQxHJEyjYqjhRfDhsC5UYDU
	SttF4DZV/ASTQhsDpLMblBqR8RGOky6DqeDbEela6zHgrudMpgRXxCzaClZ8QNOQrvrOJ3+M51x
	wHxFOgEIoeCMgA/oIi5oxd8e1B0O/U+xdguLlTRMZmDrzVfb7lhWRsi2AW9Lz46OC44VBqyT0Ih
	5UWIvz7cYym5vhETjwR5KYr4MeIg==
X-Received: by 2002:a17:902:ecc1:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2ca2d52aa74mr18805135ad.4.1782805719998;
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:39 -0700 (PDT)
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
Subject: [PATCH v4 07/10] of: reserved_mem: add kdump helpers to exclude non-dumpable regions
Date: Tue, 30 Jun 2026 15:47:11 +0800
Message-ID: <20260630074715.4126796-8-chenwandun1@gmail.com>
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

Add two helpers to exclude non-dumpable regions for arch-specific
code.

 - of_reserved_mem_kdump_nr_ranges() returns the count of regions
   that are not dumpable. Each excluded region may split an existing
   crash_mem range into two, so callers use this to calculate
   crash_mem allocation size.

 - of_reserved_mem_kdump_exclude() walks reserved_mem[] and calls
   crash_exclude_mem_range() for every non-dumpable region.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c    | 34 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9db0502989c3..c83ef88dffe2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/crash_core.h>
 
 #include "of_private.h"
 
@@ -856,6 +857,39 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/*
+ * Count non-dumpable reserved regions. Excluding each one may split a
+ * crash_mem range in two, callers use this to size the allocation.
+ */
+unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	unsigned int i, n = 0;
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (reserved_mem[i].size && !reserved_mem[i].dumpable)
+			n++;
+	return n;
+}
+
+/* Exclude non-dumpable reserved regions from @cmem. */
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		struct reserved_mem *r = &reserved_mem[i];
+
+		if (!r->size || r->dumpable)
+			continue;
+		ret = crash_exclude_mem_range(cmem, r->base,
+					      r->base + r->size - 1);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 55a67cee41ea..70db99f1fbff 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -8,6 +8,7 @@
 struct of_phandle_args;
 struct reserved_mem_ops;
 struct resource;
+struct crash_mem;
 
 struct reserved_mem {
 	const char			*name;
@@ -48,6 +49,9 @@ int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
 
+unsigned int of_reserved_mem_kdump_nr_ranges(void);
+int of_reserved_mem_kdump_exclude(struct crash_mem *cmem);
+
 #else
 
 #define RESERVEDMEM_OF_DECLARE(name, compat, ops)			\
@@ -92,6 +96,16 @@ static inline int of_reserved_mem_region_count(const struct device_node *np)
 {
 	return 0;
 }
+
+static inline unsigned int of_reserved_mem_kdump_nr_ranges(void)
+{
+	return 0;
+}
+
+static inline int of_reserved_mem_kdump_exclude(struct crash_mem *cmem)
+{
+	return 0;
+}
 #endif
 
 /**
-- 
2.43.0

