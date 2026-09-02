Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231A53E315F
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334425; cv=none; b=rD3cvEsbH5mf4zcRFsAnNy0eV0FQVBRsduGl+M2F+uSYim7Rw5uJqnLIvZaR1BgamaYPaQmB2AVrrz6Mlv+R/9yGjPeG8BZXkDEJ1kwsf1Pp6v/mlXNziVsTdW8okbJDNCrQuDbsfsJbrXr49E5NUFO8C9eZcvRrNXbQ/PM9/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334425; c=relaxed/simple;
	bh=6GXqlO1brxizpptoYGP5WQbPTfAaEuWm5XYjrZWlTlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB6NQQ8qYTkvs3QAB+gMxmZzw3/X/DyVCnxJ6bV54S/ixsyUFwJmzlY8MbQXcXV2Bf1aTKWwtZIctfrB2PLGo9Fbnop3N+p56NQNxAKKY6XO8adUk08P0JZdh8/bNnUqKfOOC9WFi8Rk/zzSuboksd+n31nbP5Z3+Z7O0EguFYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2cPHsO1; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2cPHsO1"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc2085ecd44so201092a12.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 00:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334423; x=1788939223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=r2cPHsO1+mAnuAdH0ZRXPUSAGsvppdextrVgS2DwqI5+EHhsoK9CfA7m4msvyzRmsG
         ebUept9LEKTJ/HkAI5mtkoCv/CBgcgP9hzbK4WSrIo+v6bTTXkZIRMayBRPjRu4BQFGY
         r5iVPtXjnMsjfMPCod//DO4J1gFj/8nl4QwMAc0ddu5zKAJPbBv6XQUlvjBTifZ1T7ST
         0BqAPJGMBmLxQRfwuWeX2pBCqF2GRTCYODSyuO1doyraVd9NdyrL35M4pl80lzNTn14d
         sCs3EUL0qhzbRxOvYqt58S7isjSS+c+AfkF1C8DfAN8ozcaSZ75G6HNkOoNoXMA7NR3u
         WVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334423; x=1788939223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nb5Q2Se78rLq0fXFEmBN2MgTVK3UgvxyIXmhlVfKh+w=;
        b=iN6nGVZgd4gd10anTCLxgzpswE1pIZSiO9xvC7xKtcDEpgt1gHwkiif0uydNOuSn3v
         62DhTikaFgE5P+k979Jji9kHRVz3+n/wYxH+ME8bkxcYGF1l4nAKxPXz2oNvqYzgRKLT
         FiLHjLGsH3eDXXEul8hYTTl5BSRtEtPjXFZWRFEvqIa40/9EhJ1G5a1f6qoF+omWF3gB
         11bGv0QU3uYyJecDWulKJLjrkbyVhCo9iA4QFxrNk7KiPK0z3tXQJjNaEBxmzdqdgHVq
         Y4ZLZsHAH87KFile/z/ylOEx7tjLZ4B7aSPl4DB2HDWuPE27ONNYvfoB1SLBYT5jUXMv
         xbhA==
X-Forwarded-Encrypted: i=1; AKwUvBzJDXQfZ4yPIsPpeB84M1/74cbTEtUKtCglddzAuLKkP4Ujup+xljppcDLoS0J+Oi+/qTiR8BviW9Mj@vger.kernel.org
X-Gm-Message-State: AFuF++l0tu/Oz8uCnvtv23pEzZzFhgbVD3FZ36TqxbUGOETewPC8F4Di
	Bo/3vc1YNGhFrqSE7dhket6goff1CCKHL+mpcnH8idQk644gORyek8al
X-Gm-Gg: AYBFou3DV0Fu/IfMkKLGLlEkUC8Ph9ZkihNEh48VnUWGErqPRgnNBCfz+kGY3Za8MwG
	x6Vy93MX80UxbRjH9g+scdeGB2VfNfmu9iri6VgMRx1aztz6rmosFHG1pPpqItedddGj+flfqYk
	cMqGeNgq5KTzMuDF0ygXx3ZEVrkhFnsuNQoIcYQAF0eXSMyhJPVsKJbrLGpH7k6blfxbGZ86vkH
	zvXi2KAFzKhsg0Jfstgv97S8mVQVL1Tz8FrNI2qMOK2CCW2UzgayjEaCunb7pjzrpLPTfg7sanF
	P9AEruIkpYPMiqjam9fjdDQa8i+94wtobxozFS36g3Fc5gQUQ3UEONK8rC2DWu5FxgxdP2TUvzM
	oM81SVqM7ObzP53Xjj/m8zpwi0b1wzJMCiyvp8sXFaeGkrO9Ap2bDUhOcT76x8EQc8pMt6gAOH3
	IFxRHqY7+vYj+rUVE91J7cR06n+ClCkouCtwPvZxGmava5UvX8EyhtI1ud+riBR2kZrQT1y0pw
X-Received: by 2002:a05:6a00:6ca9:b0:84f:77cc:63cd with SMTP id d2e1a72fcca58-85ed4449927mr5116039b3a.17.1788334423379;
        Wed, 02 Sep 2026 00:33:43 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:33:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 10/10] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed,  2 Sep 2026 15:31:16 +0800
Message-ID: <20260902073116.802752-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index bd64cf585795..b0e618e13588 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0

