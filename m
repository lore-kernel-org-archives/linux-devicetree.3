Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DC448B98
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045079; cv=none; b=OvRscU6BmxJcrtWzAqBc5q7nE1y/hmFLwVHFx5onWYCG/H3Wph7Knd0xWVlaM21rp796DHm6XLpNGkG4ofEHt98qRqR/26C78gnoSru4yiyB59tieavjvVxSQOjtPdTy7iid3104wzDWMQLDH635G8kERinCytQSnPFLpS/K500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045079; c=relaxed/simple;
	bh=6o3jag8MYPkjyjui0T+mJJonk+syY88nEjjzZbh4dYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRcj0dhsz+G0gDceBmo2kbS1XKkv2/NpzWwuOTvvxrXKCAKqW5ga2ZBnXTDA9b/HJ5c1tkGIcnHctkNJPGIHhfUjgWPQEY96ogPnbQqtofq2uHvSfH0XP7qId60rE64w+qpL0v5Qzz0yBfnWTSsKLMFB1PKyUdu8c7QbPx8gIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXvLdx3Y; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXvLdx3Y"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so1641509a12.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045078; x=1787649878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWMBqkj73rVQAMFA4LqK7WvxQ0Lo75WvfMJxyxluc60=;
        b=jXvLdx3Ygy3gGuZct/hiTQ/9F1MI3uDnGLb2UTvVw4Y0uC369O3rggyVlp8z770ckZ
         tITK6ThRpO3u5SHA23aItcyvgnUzH0qyCJc/HBfjErOxOkTPQ691almA3LIwUp+RDyny
         X1ZMNfIAV72JdwxqFsbp4ltfxldSK29HxRVIX4OxZJtZugwJCEjft58qUB8clMTI0LM+
         SnEUE6cxaScqxBHKQn5UWD06bIp106oa7oKNnt1hOd2cyvGwQkoD3gzsz1BVGUX7Zsqc
         sNJeIe2d3Z1eW+q1BcUw0SnpQ9wrS1XrRi/CIi4GKVpUPUnlXXyqtfXUkUC5JvIiIlxZ
         jW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045078; x=1787649878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWMBqkj73rVQAMFA4LqK7WvxQ0Lo75WvfMJxyxluc60=;
        b=lrJxIkaE1jHE9xxE6+USpWuNcUOvpzrvzmSnWNs1sG/cG0VfESglBXWJKuKFnJIzkk
         GzNMxJfda2DjNodLCu9Nu7LpmJ93X3ge3O5KlOyJUFU/kDE86U+cYSlTjE4LEf3goIwr
         z5sAu1kfpyq7SuO6WMAJg61dKcaHYyj2RuUXOR2ZKesCIWMtawHNlbtxlyaHrFBkdwGC
         gOU24kCF6GJ9xUNaFCORhQmSdxMJ4uBN2JQAvpDY73qDbXdlJsIjnjwhULbywLsBwSQf
         r4KzBLecRgBG8a+E4+rmYpp6B/qQcQmB/PJdcwclTHTfXXMwZVULlgLI/ljzAIAC1uRK
         gsTg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2hRzBszMAlRPqSeLTL8QNE+vrCJrveR4U0mdRmjSf/hv3LyVdAg/srCgF47Wi8hKc9pKRkuAsSOy4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UbSoFQuNrQvesiduZPlDd+Irw9PQGRF4qxBDbpOd9Y7506Tk
	t3PoiOh6i4iFBxxw1X2k63hyGXT3zbxM2pxUMvdQukUg0eAU2pqv6qCc
X-Gm-Gg: AR+sD12tbxF2iIPTFAzvZLwDHpe7gMZtbI+u5PupJFp8yRasKpSQE6SxdNcG1Z9aBoJ
	jbNY0kodUKWuzd3wiFXo0E0IZC9jSNOullBxa4Tnqyfm+qY6r6VZ9njiwYOvKozJqz6Kn05d/im
	Hcr4W9kl9qx8NQR5tH8021ql+qHV46RUDZ6M1rieTnsJfqWnknE4K5wWgANylBs3fDDhVIEJ+Eb
	Qn1asSodufvj+DAETbuFVLErlm8+MCi2Dlhw9D7+oxNnL2+xIVqax/9CD5oOyfHZOUGFssbZ7zX
	jqcJOL4ZSyEaz7o93hMgyPdXDLWspAyTzXpB9MKkeWgVFep9xP+qWDW/QyU8QAX7Kqe99IgwUWa
	K9fJ51DZo+oGdnxNkqzFrpPwxaUc+pBTlsHYXgTlvFDZZel7C+UDWiG5wb9AJNqoMKP3AWLzBgG
	mkvt2J9cRHssS2u/RXT1AFt/rEf5HqxNDk8KJ6ZvC8MlrKcxo5T7Ft3eTiZqRXCQTBpww0hnKd
X-Received: by 2002:a05:6a00:1149:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-851b87eaa83mr7838506b3a.8.1787045077737;
        Tue, 18 Aug 2026 02:24:37 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:37 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 2/5] of: reserved_mem: reject static regions overlapping no-map memory
Date: Tue, 18 Aug 2026 17:24:17 +0800
Message-ID: <20260818092420.2859026-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818092420.2859026-1-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Static no-map reserved-memory regions are marked in memblock.memory rather
than memblock.reserved. So the reservation overlap check does not reject
a static region that overlaps existing no-map memory.

Both regions can then be initialized and hand the same physical memory to
different reserved-memory drivers. So reject a static region that overlaps
existing no-map memory.

Sashiko found this issue in [1].

Fixes: 86588296acbf ("fdt: Properly handle "no-map" field in the memory region")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c |  3 ++-
 include/linux/memblock.h     |  1 +
 mm/memblock.c                | 14 ++++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index c6e73d710ee1..9fb2e4c29443 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -152,7 +152,8 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 		 * if the region isn't memory as it won't be mapped.
 		 */
 		if (memblock_overlaps_region(&memblock.memory, base, size) &&
-		    memblock_is_region_reserved(base, size))
+		    (memblock_is_region_reserved(base, size) ||
+		     memblock_overlaps_nomap(base, size)))
 			return -EBUSY;
 
 		return memblock_mark_nomap(base, size);
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d62db9e776cf..27d68fbb3157 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -148,6 +148,7 @@ int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
 				     phys_addr_t base2, phys_addr_t size2);
+bool memblock_overlaps_nomap(phys_addr_t base, phys_addr_t size);
 bool memblock_overlaps_region(struct memblock_type *type,
 			      phys_addr_t base, phys_addr_t size);
 bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..4cabfe365ac4 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -202,6 +202,20 @@ memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1, phys_addr_t base2,
 	return ((base1 < (base2 + size2)) && (base2 < (base1 + size1)));
 }
 
+bool __init memblock_overlaps_nomap(phys_addr_t base, phys_addr_t size)
+{
+	struct memblock_region *region;
+
+	memblock_cap_size(base, &size);
+	for_each_mem_region(region) {
+		if (memblock_is_nomap(region) &&
+		    memblock_addrs_overlap(base, size, region->base, region->size))
+			return true;
+	}
+
+	return false;
+}
+
 bool __init_memblock memblock_overlaps_region(struct memblock_type *type,
 					phys_addr_t base, phys_addr_t size)
 {
-- 
2.43.0

