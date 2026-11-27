Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770566;
	b=yeE0O1zfPPnKd9lJtm3lIxEvM+Df0d2bQIKZjjFXoW2WuYnMq/Ta2mGt/wfZiL7e63J0
	 YCmlf2BM1/CxV1Lm9K10cVLrlZrjlS6LVSYV4ohKH1aq4LuVyKUCQCNKXsM0xSymaV4iD
	 X15F5HaFVZMKzT0lKpNW9VqwQfPGsskB9RG8xUSbCF6LlU96vLOWz0HKG1lMZZo8Vwl0W
	 sb09FI2My2abR79jr4hWQ1nqanalhCg/eBvncHu5v/DbXHF21hqG9McD5gJU6hM8tI7GQ
	 bVGdx2Ev30dXLCwfKpG2E30cjpPqaLfNqM9QXwFzDquL62f7/iqhs/vtFDFPnmVGLwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=yN1HyMhA1oQ4Idhft9c9dFIDo36gXo29ErsTkcPnxqVoRsZO0ul2I2bT9GP37XivCKdU
	 pQNN8SYl4D7jSBaCE9jdlQXCxXr9gJGkCpD87XpGoCXdlpGUe9Cuw1GZj2ql0kpLaxI4O
	 n9nlbHnfEArM2yDlQ5GALtDWhin8TLAR+YCBIyYpwTawZp1PGw73uYxVBii2K0vP4QSgd
	 pQK69qR4nqAEhiMnrxv1c0gwVfAYQxMZp6Q7tN+z02SzR/VIQt5o9qxGKFH3bLou0CpkJ
	 BHc7QRevt/QkpY0fa7dIcjwuScWtx/zaZ2VQYGweNtF/kFaLmDFkrQrhenWSKZXz7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsE6b10;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EDA606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EDA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsE6b10
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso31000765ad.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770565; x=1796375365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=wgsE6b10W/5lEmbl3ug+kzBc6JE3d4Lt9SVY1osWfzLDys/F6aq2sEE0Ei1zsbm2uC
         o1pqOyBuaYIvcYu7aZETSAaXGm1X6XNUIkzCwzC2WGshp181qMG4RqTxv65eq2pBcL+P
         SRBUDtCYhXAyEiPB4dhZC6aJ5Qr0XeoKXGqUd8vIB00h/6AtSZgtWRl7g4+cB+Jccuqt
         +woEjmqw2gEk/fhYmKtqTdEQKXK92n+gSAd6SNILiTHSnl2q1E53ZT6knU8aBcpScFSr
         MWLlQ7giIGUBHkRs6iySHAGGqvcqgzvbj8LsoWWhpPZss7Dh+mJD9tiQJpLqX1TPMHWO
         vCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770565; x=1796375365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=IJBv6XykoZNa/m4aH6AK5IUS0QN+3sYoHZCA4LXgKmGtt0j30UnXQ5xHiEiJWUAN6a
         W+9i1fNiCoQaj10WJBwwhsD5m8yUTn967M4UkutAE9qi/CEs0RXefRnGA7yxpVGfOTI2
         gH3O5XFBYYbD3lE28I2oxn1eJ5Cyf9aVJAIYWH3xga3jWUFLSu+gCQCEIrkIijetHkrs
         dFcJmHuwjP2B1N0EThbEBcml1M0ypTmFiq2jgbeyBA+14saEeLHjeu8+5xPIJ5wqYy6y
         MvYcRzkcThRq4V9ApSeTni+MT7HbT7nf2m+04WsBqc033wuJt7+evcLEgrrNaioAv51a
         GWvg==
X-Forwarded-Encrypted: i=1; AL+hErGcwyAr+j1tnlzMQ1M3evhsoja/bPVDsqb4Npxa4Oke4jJqnurX30fw7A49IscgJ23Fw7E8+O0PcixI@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oi+LzbntYjq6sVwA9f5XXD81qD3lW5iXavacKgmif+7m9EVnY
	ZVSQJusDwWVPq+CgxLfC0oORwCLVxv8DhcP7JS8L+xKQb1+QpUMSkHic
X-Gm-Gg: AZFdTZc7rb2n5T9IBzvsBg7gcBz+DZkdehh/89FGRZSLg4G/NB7NOUKxWXYN3nLZWOw
	yM09JuycGC9dvYrxRaC2QgHE3I4I0d9j8QgT1cf5DWkMuuQ3s1xiuMCPLlzVcgaY+1mOKJi6k9V
	fBpBVExbv823YDrMUi77GAYcz8GbpalWOhbiUgDpl7pjlDvr/iEQv5stUlB0jcaKw7uPbdOmkQ6
	Mtlq00gVF64MewTX0mxGHAyac0RRqmEiG2VrKvOLyMXCBaVu8pElKf8wqzglbYLQUqQK6THVg1v
	o/zwLt1ezdOUiQGmj2wls2Weq9UgVDqHf/nDC0bgeKPr543ubQ1zDuD0XV6xpv3oNffVfo6dQwM
	4eH7qdqdskwqsEoDBB6dT5REmcZXauaQefqbMuvJ/zNkQmLbS8w+PXS+sWwvh97JOlWo9NjxKyY
	WTMdk7NQa+HcJtsVYfaPb7qcLOw0OIHj4WH+jFZyF6/1MMOtsjKx0RW3bOAJ/R+uTpIy7dWUKh9
	xk/fviMtg3/yNVI6+36EARJVsiNg9wfFp613QMOnR+P3EYdpYOXNe+tcyUjOakWTbxWpd8+0/Z1
	dO+AumXpWHoWFZyc5HBAD/fjWaFLm9ZGVZtrefn15A==
X-Received: by 2002:a05:6a21:3a41:b0:3e2:30c1:fdf6 with SMTP id adf61e73a8af0-4014e5562aamr21306213637.89.1795770564971;
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Fri, 27 Nov 2026 17:07:23 +0800
Message-ID: <20261127090723.741253-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0

