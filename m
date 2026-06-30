Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0403E63BF
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805693; cv=none; b=DjDMHqApgxvPwFFJNWKZgJnAXMQ7XtQ8XktfYBSTOlLp6i0ajQ57yKNKRZ59fjsYiSMDu3ttiLzVn/UQFkj7g8yK9yWXhBwFD03Z2DYYcg+EYcmNxRmQ3dCof1VEleLCX2902/iE17/WuqV2X7OuI6O0zXy5uaguh5i7XpJobIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805693; c=relaxed/simple;
	bh=3fPONwE1yui7Ecp9kezKmvS/5X4RL/p2ogE97qcl8wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTEKNQeuT5QGyoSOYMctcvQA9SA9X12WdiOk+ETmgc3fXyBfXMlMdqlnTo0YYhLqcKlUNNY59/z4GD9h9jPnaVHeogbs+lWBejmYSWT1if1MJmYkVkwHljwwx9S8APaeW3RV0mu5YUM5MY3wRWZXtGZ5Hf0kWXqnb8OmMpicwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwQ4Sv/S; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwQ4Sv/S"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2c80ff1bbb1so3652255ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805689; x=1783410489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=RwQ4Sv/SvWDkSBghXLMQzdlNGGAiBAtUmnrSnu0jt0SRvlU4fIMDbwkxYtoZUGkWNQ
         DBFCs8CLwOwFMfRnBzEj2pltL7KUT1AFtKGhE9Dg0APFoq35Q3Bwd+roNTakhYeSXOMR
         s07r96kI+ZsQc7roJFuIs9ThVUgtbk9uE3I3RGjJN31XNTxll9nZC0dOV/muvZyDXSyB
         nQOW/M1YQ5u4l+oF/LMQ+4fpVBLQsgBry3ycXzEyONIsBrRQ8SKmTe9oZL/5/DWTxdY9
         fJw3VTWruHIm1FGxOygHAI6j4epivR5Yqym8fYu+HrsCpnud/dI9FDiBM43rgBIiPDEi
         J3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805689; x=1783410489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wN/H1G2k/2fwCg/1D3i4ik2O19md4fRGx2OQL5vrZCY=;
        b=QZ9OAeuWNN98Irdbys6qM1KCG8Jb3KRQQvxrQokQ/XpCPD/0qzfiQEZ7egC3nB7zHm
         JQI80tVUe7qs2XR7f/PaWHuJCgUZobA+Kenx0RNO3LNS/6uFW4+HHb04Zq/N+Al+oGB3
         hNtInHeQLQaD5YtlGDLcjM+YyPByV3Rv34uu7KFemxnbhFePxOVilxueJWCRs/Q2nFJg
         SLX3r7wzoUde1+URoTq0KlaHM7hx1ju41whnwKsA3YMNAHTvLIFm7e0U6S1ETlkZ5Hkd
         evw/anHxNunV5vNVUvbK015etAJZj84G0Vo04N/h7FhQqemRxZlgoyYmFmBk+m6PtwMK
         x+zg==
X-Forwarded-Encrypted: i=1; AHgh+RodvoRt956qfk8YKj+jtsgHA4sg3hIfXJWoFKR3/PkZoFleAMCinafrEh1He33MC3oA+rdjwSsnCw9a@vger.kernel.org
X-Gm-Message-State: AOJu0YxxGhdq48BH4IIiOusTidCA0SjGs03v4wBQtHZU+434vBMxJdIT
	esuAvnRzicaXBPjPZNwzY9Al4wrFN0kA11Vy+QaORlbHR3QJ2F4W2ich
X-Gm-Gg: AfdE7ck4UHfK45Rlle5ah+6cLhZ+OKuIJhqoKSMQSjArcdHH2Z2C68hfVwxJLftB6u9
	cV5StW+97nFINjcW7vS31ENZNUD02Rqau2vOmS0x5fh8QU1f6nAoLsrEDHgvvf3XxsfRrkYmGAK
	6ySg7fitn8vQ2QO1D7dxMWwJbhAoUVYHzpzGdH7cV4SwAQvty9CKycOqidoYZEQqXKtB7FkN7/Z
	WfIZC3XqUn14SKzf26eskbCoTttSiiDaVsxC+lmHpTTjgAhG/CASARaA9QxkjPiqw2TAqOh/o1L
	qrXOFPWY8vILUo7qQGP5qnwux7lLVB55wclRzRq2aJ6LNlxwJpIomR1mmN7FpuNiMMy8jM5rjwl
	2wCQiHR815Y3UdGaCeaK9oCjhT73YbP1F0+V5uK7fieX3cdQyQqZ3jvcuTJAqdeJt5kR0wjMvmz
	lfGtbwJ3m2SN2cr9Bb4K8ttHl7XA==
X-Received: by 2002:a17:902:ebc2:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca2ec34870mr20905945ad.47.1782805689451;
        Tue, 30 Jun 2026 00:48:09 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:48:08 -0700 (PDT)
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
Subject: [PATCH v4 04/10] of: reserved_mem: split alloc_reserved_mem_array() from fdt_scan_reserved_mem_late()
Date: Tue, 30 Jun 2026 15:47:08 +0800
Message-ID: <20260630074715.4126796-5-chenwandun1@gmail.com>
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

Prepare for storing /memreserve/ entries in the reserved_mem array.
alloc_reserved_mem_array was skipped if the device tree lacks a
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
 drivers/of/fdt.c             |  7 +++++--
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 11 ++---------
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 26f66046cc32..b97775f6c9d4 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1282,8 +1282,11 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
-	/* Save the statically-placed regions in the reserved_mem array */
-	fdt_scan_reserved_mem_late();
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	if (!alloc_reserved_mem_array()) {
+		/* Save the statically-placed regions in the reserved_mem array */
+		fdt_scan_reserved_mem_late();
+	}
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..81c8ec9378b9 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+int __init alloc_reserved_mem_array(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index e1bd35115cc1..f6c02b37deb7 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -69,13 +69,13 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  * the initial static array is copied over to this new array and
  * the new array is used from this point on.
  */
-static int __init alloc_reserved_mem_array(void)
+int __init alloc_reserved_mem_array(void)
 {
 	struct reserved_mem *new_array;
 	size_t alloc_size, copy_size, memset_size;
 	int ret;
 
-	if (!total_reserved_mem_cnt)
+	if (!initial_boot_params || !total_reserved_mem_cnt)
 		return -ENODEV;
 
 	alloc_size = array_size(total_reserved_mem_cnt, sizeof(*new_array));
@@ -266,17 +266,10 @@ void __init fdt_scan_reserved_mem_late(void)
 	phys_addr_t base, size;
 	int node, child;
 
-	if (!fdt)
-		return;
-
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
 		return;
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	if (alloc_reserved_mem_array())
-		return;
-
 	if (__reserved_mem_check_root(node))
 		return;
 
-- 
2.43.0

