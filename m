Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571488;
	b=BP/uHTJBSZhnWDdo2xGBYN8fb43h+CWeFE1HJWEcr8XAl5+doYid9fSmdvNJQm7uCa9y
	 1fWoCKauyMC8HbsDgiNrLVYrs7KnuiEiyMtcpYc7bXA5iEGMiMuOAZLUFPRig2hpd7N4A
	 55PrEfiJJVunUeBqiNy6abWXQ7iFcvNzn7jRX6IiK4cmFfGZ/p58VgDx1wlR4qTdrk4Va
	 fqMvsM6OIi5l56tHdOgQGob6wBXpktB3q6vAjKu6bqJEig212x09+UpdjO9ZiqsNLRudc
	 qCPbowvQJ73f4ySAmxFlXeVLaIanJ/A79pCYfXw7qyYzeb3nysm3FNgQkVVWA64vJLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=h3x4wwFsyfXcbk9+Ct4mUpD4QGlUzf2NHQvN4bKjyXen+JjAxclsGpaQHfq95kwCTZjw
	 DQ2oeEXk+DNTkZdEqVOxFTFhPfLx+Bl93/0dr+WC/3kdn1+oUhjIDvdC9vDoVLS3aWDHG
	 KXy8EmfdyMzGduRYhPfMcfU9rfBYmVZBOm4tLQcdjJIFJBpyW8mCfR1Zsbb7UUqY4I01x
	 X15UnP92SkA639N3jvvNbtPgNZHTBJ8aPTmoEZfivi5pecny/pnKePQvH6kz5F/q8iVRp
	 OthUR9K+QpGA3RUIaTdke7baLvPb2huxI6L3wN84FvVpoKxZA6oU0+914L3CBVNyJwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFEqDUr+;
	arc=none smtp.remote-ip=209.85.210.193
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA260606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA260606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFEqDUr+
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so260414b3a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571487; x=1793176287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=lFEqDUr+j6HoSBgzxTP1iXUMQ3z3VuCnpKIM7RVCnr+RCvjBHwR3ZHqM4l20d0DJHb
         dItVVtFeiZpKk+xPNUtBgEklIk3QSl6/qkJqK3MGuVwTxJcE5K9WadyI7oGDwKyESK+8
         x7BKua2EXOiQ/mGvwfY7VwWgKMCTODMo1UkY/Hthow1ZTVPd7+sC+pp2lwAjZOcDearI
         oaMaW2hq3Kzka04/FogkjQ0u2FzxTbCZ6iR3NC/joOICsL11Jcj/7xFvT1xWgTbFS3P7
         69ryY26xT889xF8LCyXmtY+ptFtOxJwtJxdpdGhlbl8CRN3Ftyi5d5eyEjLGgBnbnVgu
         umDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571487; x=1793176287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=e6+e9LhblRJPOV/vj4lv0R9gCaZNlcOIBWqMFgmeBWloa3fJzdil1qlUlH/yTNWdOn
         O+d697DSKU8VZRx5lJwQGGw8vYtN7TlfVRk5y46A9KoywZF20NOhqPc1/AsKioBhLh1f
         AAcD9FimIX0yKCyJsG/9HjmVmH1M47BSMerO/hSS6Qx5ieCLzAaXxlit2qf5WsHeA3EU
         l4MEo8vecradchWo5HR4+1lSXfXL0F02JmJ2nzfbQnDSYCplGG4e8W2AT3YTtF32FN60
         vw32Dx6bc+VTcIyg5giTAsAXgSg/QvPAAuy0x+llHQXFXGeBjcPkPY+f4LoyC320hgc6
         JGqA==
X-Forwarded-Encrypted: i=1; AKwUvBwUyefCszqkTX21xxXiXh8Vl3qr6ukXDZomjbAx5Kc5zbc1NZRi98llAwE8DUyETIb21Q4MKMB8/3zy@vger.kernel.org
X-Gm-Message-State: AFq9FYI9CLYY+0ydyeI0sSy74bUxUQ3PqPJL+8n7KGfXnmG8hzC9izdM
	VgXkRwmc4xz6uwZXq4ulXBZvE27RDeQF0xX/dHy48qi8g4V4F5Ipykw7
X-Gm-Gg: AYBFou3hoTBqvhtgzQcX+4dMWDKpaxiTPf0+xOtUiNYFu+M9fyy4WAAFgWRIrQnjcbV
	gd3yOsZ8eFbbcN8sAXXn7RworiabPpJbY/DWU3ri5JDlme57cUn055g1b9iPoD0OJt+fc4IS0GR
	qo94V2x34mhtKlI39w5HboNefzUQfAWL+q5Gc4HjtLXCEXNanUJ83sMliDWeJqM7nExBgTAkD52
	40/WxcmSAIeZhGZZ+Ud87026LfArp0unNCY2msso+dcCMSA+JG5sqOWRXS74KhG+sT98srFGfBL
	Clo9Fy5ON17DQZiGhEfSY5q0xJRCpLQVBtvbZHx09bo2noYq76fJYUlqZgTB+LlEMUsraDz9gqH
	ViQ8TariNK+Y/8AQV7o3Yd/4s6SuCX2ogjbTpw1Ak86D/z6VHWdwfbkxU//LaXZCKzAkEzxqyyM
	Icb7nSu+zBIJjod3WIfcL+GGdfwBzCrguyfHWu7Csc8u97ZP7MLsr+lJyRK9IqYTl+o+XoHIvKa
	FGdRAzeL5yzxBB7DTb9JRTl3agSglifSnuY8iXtMnpHml+n2bQDxbxPVewE9VQysA68ICvK1GbU
	Sz5H70GPV/fVBw==
X-Received: by 2002:a05:6a00:2e1e:b0:8a0:4d37:660d with SMTP id d2e1a72fcca58-8a07bf67824mr2764848b3a.2.1792571486193;
        Wed, 21 Oct 2026 01:31:26 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:25 -0700 (PDT)
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
Subject: [PATCH v9 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Wed, 21 Oct 2026 16:30:07 +0800
Message-ID: <20261021083011.2170525-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

