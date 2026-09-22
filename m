Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF0415F17
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066712; cv=none; b=YoauTvewCvUmqEsvi74qb1H7bW2/WOO+q48ylPbc3qQQflGgv3qXfonY7zLVEguRqAdxSjJx3o5W/kNfRNWWZgsyY+npeZWIzkqqIi/qnaekLYIvFm2nUhs9o2s2rwqs5Ob0irHSKG1wOxjA9v4jVYIC4XejPFs+GHBrFZcs4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066712; c=relaxed/simple;
	bh=HSqynHYwWyM3/AIAzPlw2zR5ssM3zxj+P+TMMRPO3o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSASkYRg28UnapqAsJAkxwMuZGRqaw7lVN76hFuG1lv4q8RUiZUBF4r+PcW42AueSOT8ohN3OjsciErnzm8jb+RV6wrKN2uIZtmglXRVGAx3FUtXtS/mxkyTTi0yvvcLnKFaFuS9oksojkfgEykKFuYjcYroKkbcLlrmhChEzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeAk+kY3; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeAk+kY3"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so2419052a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066708; x=1790671508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=jeAk+kY34/NHF0TJAFB3cHIB9/7bcYALmdQlCmevs97L8iMep1wmGy8/WjE9AuKNja
         g0jd5TeXi7wh5DUdUOa5bfdl1EfTIdWznO8HHekcbYHmZjmTucYCprTCJZfSRUZs29CJ
         dPnayj/bYd+KkQMGTyx2WPG/3MZyLxuGAbNk1T59G/Z0xsfyfFpIdF+nDG2qCSUl8ZsX
         onsAk0Fr6hork9OwfWcaRquHhohu5XJSbLL0DZUnTm4bGFRPFlu5jWGIWRE+JemUvNTg
         tNoxOAR+njrSBmkjEehMkjvYjRAYzYQ0+VbHE3/yu8CI7APYpedo/kD0wZFkEfcbArdg
         3Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066708; x=1790671508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=MnFBjMTFc/uY81XFQJECovfo8F6viq8YGn8RDqdYyNoSyswebewKYK1T2UE2LK14op
         5OWb2PussfOkspzqjQVxAjJwvqbi4BXpltNzSlpsyPV4taXsmysp7F7yTS9HJgE6jQUh
         NhNfPPUAHjX9hyVJqfepQiDAg97cCDlL0f68mAdwuQ8Ui9M0HO4mMbWz8lCdp2eyvosG
         GsN79uUkxVXJmc5alGuHATBwtuQ8+AHhJgCfU1SQvCEVomj6CG7b2KzwaRHmwkKIbmiy
         5RkIcspy+VCnXX95xFQt4vrPWtxfsoIaE9QNjcIf/c573wC2HjSSRur1k/L9L/PvKMKQ
         L+Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzjPQBad9LsUxezCIOPyTUjwLgFVZguzWMwnqI3P/srm+jchGuQDDY0dclct/gYhqb9f/bD9IW6SdH4@vger.kernel.org
X-Gm-Message-State: AFuF++mZ+eUVGP3T3Yzcd4322ULxbGhp99lsiC4THM7xwRqvQa+ivwl+
	p/IozVNoHQanmBrh/deuPLdJ42TqsrhpJzWBeyL/Tsv3Olwlbd4X9AWz
X-Gm-Gg: AYBFou3xa5m7STF14dqj+9WMFLBw2TECH7KjeT12TzZniTOhpdIvRs95zLC+y3Q07vB
	n3u/ch1QUg+gHsbIJce0RjfeUGOb/i8yuoZGlhqoYNFqoqvduuVoPIYETcKQasz2a13jw9GBp1Z
	U3E36qdvyKU+stcJtxe0GyiGv66D3UcE6FGcmYrD7awhLrlTu3BPaXTyZ57/s8Yd5TUDKMz4an5
	3zwge9VtHd3512cHhGuMQZxO50kjAS3YxVqALzWAvvJBiLuGYyfISVpOuC64VQDFfPQckES4I02
	K6o7bS3D/cjrAS6OGObTphnl1az8/2U0s+UpqFqLKSat88yQuxG7qsEm6m2O4E0XJPJe+lD6g+G
	EinBWuxoMTFEQN6u91apEFBKwcWi0CcW2m+scuZg+k1GG5HlfNcyRJIbNWCSKTPAnZ1pOzktU6O
	OeAm8Zz+hgQBeGmhtKf54wtLv/jwdzKza44DCnQnJHxt8pjM1Tn+qkD30qqu6QaNIFkgdd/awJF
	HJZUMJTxpgZawP8YbN+qg==
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr486642a91.19.1790066708546;
        Tue, 22 Sep 2026 01:45:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:45:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Tue, 22 Sep 2026 16:42:56 +0800
Message-ID: <20260922084256.1515554-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
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
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c7acb2e449df..fdfeee5afa1a 100644
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

