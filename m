Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371F380FC1
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852627; cv=none; b=s5FpnlPsQwhSxTZHkcJODQfqMs8uiNQOPyLRbGS6VmLGHe4AXx+UeIlR7UepfG7BzdnwJcn734eD357nE8cZ0WmntxDzVJd87XCHvzOGCNP2ti4Q2WL9kHngfuYX2XjhWh8OXDzpFV1rG+yBCKfMMVKQhgTcurCGSAX/pDj4f+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852627; c=relaxed/simple;
	bh=7kxqwwsFAI12NVUnaU7kq1LIiiUSTsB+7iEGWDm4OPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTzZ8SmtqHON9iQdwVb1xeDkxYpRPhWsgZH/Q0ttM1iedVO0AEdbxmvOePBAEnLFmqp2lbEGEeBAQVXOiDra7SFFXinM0LrF/FIOxIBWTHHgLoFEd2WprJ1sA6vl8LHinG30VKekhbTiSfG+A0S09dLWSB5GBIOM3Uu1lmwzuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCs43JIu; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCs43JIu"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso4790987a12.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852625; x=1780457425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=CCs43JIu/zzgWir7yga/+29+T9mgm7bHzC5JN8RCZp+jKgYRqPtE2Ew1VWaCKNb4mQ
         jNE+cxLLDZxxl44pkoNwdGuCd7q2hdGKIUffbo5lmaWdFeXSHXFKREZWZ6s/M5ppBzZT
         r+saj2cURBfPfz+wO+h84Fmvj8MnK5b0WaAkwb3FzHNpDaCGex2lc2jVQIe8XrErHqRy
         ha61Zm3nM1lczQT0wG20BK+JVakYkCktty2c3X3VsojSqO/Bi6yu1Baz9n7Hc5OuYwB1
         yv2iWlKFkQ0k9AOQp1nRK+m1u3kmC7+6lnJQkAQoB2tARviXsTlZE1ZTZP/+yuQ/VaUD
         msBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852625; x=1780457425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuujAuF8eXBWdShhG/kW229CX67XgkUB6V+YnX45VpI=;
        b=Qdlo+1IJMnwl+wU/348Qh8ZVwtJZVlqIBYcZaDq4L+Ho8ekLVVWVZu8Xh3uFlJKiMu
         TQ/AdaCxZIKkAG8G8DQaF+qd0DELw5LV8q+k+UQF0eDKWZ+EBwpzv/Yw6y8v3J3QuOhz
         5gFj15GMBMrdu757oNzfDvvmRkc6tlwkN80j5+h+LSwgo4OHI0LbvdTuq0nX0UGDZDv6
         5IGGJk82Oem7fV6B6Ba3sUIvtFBvbaoND7FpXusCwvcA5Lz6jDLNp1yyJKO4aBYw8mGR
         uKjhJLdyrLtZN9rvGcN86/0XT3wJR2EZ2LXurknv7Nv0rj4GgdjK4eh/Ab6LcJNTGpNC
         scbw==
X-Forwarded-Encrypted: i=1; AFNElJ/9kex+H0YqhqqKsh0BYGzjRwrWSVVYvhjswTNmTM/26G2uyPoMSEV8BiY70C+VWIOQEtLVgtXnRtY/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xz5tMWqJBZ7GI3pt9iy+wE+3VimDPoNxkhhIiAeTklsG1ytM
	mM0Khso1qr0K8usz5/4DM22NyIQbKC2Gm7Q1ilk6BAbMYJ9mm/22szSF
X-Gm-Gg: Acq92OHPInUQaHEczQspDaREWzssf+k4tneMg+iNcZsfDeBTq79U8NU9mz7FWX5G6ho
	dkZ5m1QmUtLalPhM9Fw/Fo7plr8iGfESRaUdUx6/YZBay/swq0qjyekDg4C+YASWgsZeD8B1LLd
	Wyen3o78iCMpVIZuq7q5Le5YmqTF9/MqHONdt+mCzBui5qJuzIq8WNmjeN7bOc8MR+8/YYNg6H3
	6x2R/WyQy9ZQsXgqKOBqROYiCSJNM9XG2OVyeVCLxUo7OzssIKH94fBJ89jCYkbGtYuawYNiIXV
	YwXyAoDsUsRr0vlh93DKmwPxp8l8esbVvGXOIrDuLCBI+yvwqOOOkWJGUlxG+IX41gCiibZ8UWD
	FO9SM6dPQZ5eNrjEOpK298Cr2PjmYB7rpI5NmtzbYjL4McC1iIg9oYGdQ1K8yrVJ7V1SIVbBHqn
	WEIa/JvXnszy25MYJXUMClnCGpFvKiZb1eed/N
X-Received: by 2002:a05:6a21:6d81:b0:3a3:17f8:bedd with SMTP id adf61e73a8af0-3b328cc257bmr21442620637.17.1779852624627;
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 05/11] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Wed, 27 May 2026 11:29:11 +0800
Message-ID: <20260527032917.3385849-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for storing /memreserve/ entries in the reserved_mem array.
alloc_reserved_mem_array is skipped if the device tree lacks a
/reserved-memory node, pointer 'reserved_mem' continues to reference
the reserved_mem_array which lives in __initdata, storing
/memreserve/ entries into reserved_mem_array would result in metadata
loss, and an out-of-bounds memory access will occur if the device
tree contains more than MAX_RESERVED_REGIONS /memreserve/ entries.

So split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late(),
and call alloc_reserved_mem_array() whether or not there is a
/reserved-memory node.

No functional change.
The actual /memreserve/ population is added in a follow-up patch.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/fdt.c             | 7 +++++--
 drivers/of/of_private.h      | 1 +
 drivers/of/of_reserved_mem.c | 6 +-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 82f7327c59ea..83a2a474831e 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1284,8 +1284,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (fdt && alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..50e5a533e059 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+bool __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 05defc91e901..888dcb6bdce5 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,7 +69,7 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static bool __init alloc_reserved_mem_array(void)
+bool __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
@@ -272,10 +272,6 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (!alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
-- 
2.43.0

