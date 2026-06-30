Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7DC3E44E0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805675; cv=none; b=evg/nrM8lmsgYGlIiUBRZk25WogU9XhzeAPgMB1Iz7oRoM65+KYytbne3N3QXfrd3DBmN41GP5nRUh9vGvD5CBRgH4yNGrc1M1yK/y0oUKNvKJSlZ3OC2NVdLgjIc/uhlCjW6NfTRIeH/z+sgvk1icWt5V04RL9XvAAQAj07/Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805675; c=relaxed/simple;
	bh=8OujZebZaWz43d3tSXQeCWPkY+eLKrfLdaC8H8OV1pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZz8L7xFSVb0RD37f/NCLVcb+Ca9VKF8ynJqEX6tU4fOuwFnbEmCVqnVf/T6CXgXRDxCXi0y8BeVuquGr7/ByY+C8lyF1avHaFoje/Q5wtmEO5Wy3cf2q2/2YIVclwG95T6YKlIPmFZuEUc7niGc1eLf/nFuMk4LnzaGRbWfQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHxP3rdU; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHxP3rdU"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2c9cb97e178so22380075ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805670; x=1783410470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=JHxP3rdUeqtJkpQkA9WvJK944ZaYS8dpaC0aqj2cLBT4a1xtN+P1tfBLC4Hk/rStU+
         SAawxMXlBGp0D0eFi+dfcz+qFB6Bt18f1gayxX6ZajLvJZOyxsDDOYKJoRVz/aPwNU0s
         9HvkfvDTQDrqF3kBnoB84dDEa0jzKQN+QjJLXwwZcEupqYhBwOHh4g3esF3TfedfCHke
         DVu76h8KolfKr2iy35sK0f0mGzCQJ9fRObfyWBWSVBdHroaneaXCYb2iiVkI1tp+n1u0
         hNB0EFmk4r+yPnhWiVG5gpSpJRUln4kMaW7cXI1d665jz+3ArpRjA2yBpINJ8N8pRBRC
         0NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805670; x=1783410470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=j1/VoRWj+gCg5bHz6ntm/iCyLuQE21sF70B6ZITW/ikURNMk1C1LYQf4gMyQaaC+eZ
         AKLk23qNCSPnWZJOVkbfQ/CEjkQVtDPYmk4GAlBPEPq/6LKSHPvfGlwozki5f4BPr507
         En6E5xE9TTpWBcZJSuBcbos5+xh0aNzeWK2Ywg6BiBrHp5VreyQvsd69mAlUJeecbLra
         9HlKrfsOTTh7LkzyD87wNR+Xtt2lORfYSqwDM0BzbFufEtUHjUd5zXErmceNBtD2qsOZ
         Bk+ebRQw6JFYxbgbPVtpOdVrjQQb0LLysChvPervsCvdzTKH75FFFazwIuqK9msRdSmS
         JOoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/y9w5lLfFuYRfeB7m1KfevHmB1c1DSefnwXGQC9jxB2MpOzXvCKJ9kTVF0YnBSwi/hiJ7GiwGVVfE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1l8TfPVFFuDcPh8k9Zb2Puq159izlyIk8jGknYwKb3HUz2xE
	DSeJJfd4x+tsw7LxvfSu85nTVxMvh2YNKaciKoUNPzRjmGibFUXtzTwT
X-Gm-Gg: AfdE7cmpgitko8eF5yniGxleWLBtpOnekc7cC7IrtJiU/C0VYYbQAdNfLUIVzedOcwr
	jIqDltQmH02Xn/weuu0ioZ6kVEFygcPtokGNQ7yG6NAJaBsTzwapKYTELimUZK+Fe1Eu3Na69Le
	f/aJDVOFFnSxHYmIQ4ZYcLqqQAj9AqNat5GfG0eFqYc3Phwhz6nqlQazgZ4Gpl5V/Q00Qb1gfvI
	tla6W7Uw8f8Lu3KVvrjvh2hkDMXFMBSDv+uFxBD3TS4BT0vH3U8rU7HsdT1/PgMToBKbewmLq57
	x1Po/wb6p9OwutNaDfQQ7uYz9Ge6DaVx0slQ/kyk780+qXmFGgOkcBO2VnCopipPXy4NDuM4ntS
	I7bStBr53t63SqkufF5uOlQnv2EKruY7Di2yydh15KlSGJAhwbAnlxxyhpdNFMI0jiEojCXk6AW
	T30YccNTqecPp6Ge5lNyt8W/jUvA==
X-Received: by 2002:a17:903:41d1:b0:2c9:97a9:209b with SMTP id d9443c01a7336-2ca2ed32417mr20077795ad.47.1782805669781;
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
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
Subject: [PATCH v4 02/10] of: reserved_mem: dedup and relocate reserved-memory messages
Date: Tue, 30 Jun 2026 15:47:06 +0800
Message-ID: <20260630074715.4126796-3-chenwandun1@gmail.com>
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

In both fdt_scan_reserved_mem and fdt_scan_reserved_mem_late, there
are identical check-related print messages. Consolidate these messages
by moving them all into the fdt_scan_reserved_mem function.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..42649dc3613f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -270,19 +270,15 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
+	if (node < 0)
 		return;
-	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
 	if (alloc_reserved_mem_array())
 		return;
 
-	if (__reserved_mem_check_root(node)) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
+	if (__reserved_mem_check_root(node))
 		return;
-	}
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
@@ -337,6 +333,7 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
+		pr_info("Reserved memory: No reserved-memory node in the DT\n");
 		total_reserved_mem_cnt = 0;
 		return -ENODEV;
 	}
-- 
2.43.0

