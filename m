Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C8342B73F
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008974; cv=none; b=XZzB6OpN0mgR2NyDBrN1nUblW8p0JmuXq4FOWgUGgdXHSQD2TfO9TKyAQX5VHpqxyGzQryaixoNOtILR7dV8qht5q5A9ELTIw3/zP61G1iwpo9kRKRG6NWbj3KZWiJzzxRigkLCzMnPPDvR1uBHIOH3btCXwFkwekPsro3H9e0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008974; c=relaxed/simple;
	bh=/woMQBlsW3X8qxXLH9mBLMDq8jOPUBo5XVC406TKw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipqR33Fits8WH3uVBu6/IHHz0a1RF7VQIxnfCVEjYa3PatzWEEmAd8plliqHVmzEkpT33y22W6bzYrkgJa5L+aoUtLK+tjI5sttsz8NV4woBf9Pu9J6Rp6B5uB1/l4M1/XhbxQYL3rPsxCBprY2rrgTwxbj4thGm51AMCgjd2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A48VH6Zc; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A48VH6Zc"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso1071111a12.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008972; x=1786613772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=A48VH6ZcO/j07MTTeRJA2q/DDvqIufXVXX7xxcu70mSsrUDmSwU8kaMF7rksYS1O0V
         tjijOSmmZCG4PuQf6ZdiwZWdMYa9PzCNTOPmA50ZsbeWbQIHsGWCcFW303nR3SCfYhHq
         Q0QmfUItm1V0h+Sv9p6ERwx1vDqhmjCl7LooF3+Ta/VJNO6vAkN8+i6LR5GstKE6JOzg
         kpmCyT32GdEIWkXcSuT+dpkBYolimcKFq2zQAvGjSuKkV3Wq3DhwODm0oV393veAEQe6
         XaE1FD8s4q6puk4RJ6B78a/Tv/Bl1QuQcbu/n4P9QECiyCjLdXsFGJJJvNmUfuTTWFgI
         v58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008972; x=1786613772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxssx1F9jirIGuLt/jYdKLTnwp1BKr8qLnqrQJiF24Q=;
        b=Gk/lRjRIX/TkKNJi1k8+h7qIZHy4S1PtLgTAJ7rzFB6R30clmyUQNKOCHucTPprxHS
         HaTnVtl4D+xFOuu0/YzU/ZVPUbJxLb9dgZC0Vv90LsIAPlIZ9J+nWNRs1RDyoV6687TB
         XT8mtPdYnt2GYH6LBiICnLYqieBjs67K15OVMpT6f74v/quCr0lWpI9VfmhFiPNW0zn+
         4dRcvWOCLuh0RT/O4gFmkHDn0TBkFBeFV04rGVmPIMZvs3WLEQvKkHmsJdGeSBfWHy8l
         1zCXuTBvwgzHSTVQMUERpOwuqvwgFy2joCds0SXslaUdSC+WXqYYbrhbCPfkAN/bwyt4
         jzig==
X-Forwarded-Encrypted: i=1; AHgh+Rq23issNKkkpRqSMjqMwFhvgp8NDHhIrptCz3LXR/dYd3QgYYkKOs6FiyzHH3APNR8jzS+o9Es7Tza/@vger.kernel.org
X-Gm-Message-State: AOJu0YxegnwUglCLs4V19a+j4a+Sn41PN+MJAm3NKE5U02uhTlkjZCL8
	Vlph68nSewMGKluyKA+eqbAbApWZOemNk/ELQAmAcagry88NmnPilC1y
X-Gm-Gg: AR+sD10yyXvVbp0H80sj2Li9Ub41I2nwzSGnLjRfG8kGBFMuEuSKaYIcdkUP+lgPrnw
	xOZiBe01G0hmRjlUYVynah+4cYu0WUv2VJiOAWGJPi2RVHoQeo+B/NBZqQAQXDogYc/cBClXK0a
	XUZPHqTL+RwRC4L4K1Itjlh6edMdjSn5QPq59qISypmdseP8VPejLhVJcEJr8uO5qOHFKY7FqwD
	qzinoxAN+UyFLdiGICnl/+ohYLoGxMWo/zx33+Dj1t3oK+77IN2SXsmHqN2IdZhxGWD5Y4c3xyl
	43j6aFEohNUgtZ6JiriKx0oVIu4mdbbuPlXqiSPEHABkAHY6lXVAww+AUGoJy0/Q7RIzalMsDOC
	6iuTKpNuXBQ6EKJAgWtL3C8z4wUzqymKwvPJVd2NOtVdKvnlqmlgfKhGRMHtjG3yOsIb8uk2knv
	/dpZv3HtW/AROuN7+oDYN5Uto4LpV8SGxkr+4nVYsqN9VXnzBKZ1RFvtHnsgvK0NDTVNPTpNPDC
	A==
X-Received: by 2002:a05:6a00:80e:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84f2e0dc989mr14792962b3a.35.1786008972602;
        Thu, 06 Aug 2026 02:36:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453b0aeasm1043878b3a.13.2026.08.06.02.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:36:11 -0700 (PDT)
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
Subject: [PATCH v5 3/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Thu,  6 Aug 2026 17:35:14 +0800
Message-ID: <20260806093519.2907771-4-chenwandun1@gmail.com>
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7b1616b9c6c2..f38d11df6f15 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -674,6 +674,9 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 			rmem->name ? rmem->name : "unknown");
 	}
 
+	if (IS_ENABLED(CONFIG_CRASH_DUMP) && !rmem->dumpable)
+		memblock_mark_nodump(rmem->base, rmem->size);
+
 	reserved_mem_count++;
 }
 
-- 
2.43.0

