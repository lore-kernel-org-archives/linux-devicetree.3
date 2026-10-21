Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571556;
	b=eFndnnkV8GJKWoDNSjGD0Vyyi/WNjxdzGQMalyeLj5GpwYTHqoMLjGLkY7SWWEWjqBh/
	 VwQAYnXzXE2JlJekzQq00Ua9rw3EntxX7q+ik4YUNiZojBx+IuvvGcQwGjmK2jWwRdMtD
	 1J2CtfbXm8tk1rkMn/pAPA/gWI0kQwmReFSJz7e07SxgVRIi6+mPhSuY8t932+F82V76r
	 1pppGC/MhSJPhB7MVJmRasFp1CVvD4DhZR/CsHc4RATQdjbUMQopoKmwfagNFox28PIIq
	 kFquOd1xJ5uIb5yrrYtONBJEzBjXIxBVzYxdhjFgWXBH1bKZPiGnl3+Wic9TTxGLk6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=sSvzP+bnG+ShSSnATd1Ttdbg1Ax2VxKf7zOm4HEKDU2jdtwOGA9Jgtyw1O8FJQtnKDwt
	 W/9iPylR8v3u0Xb/RCDnKcV7UOLEeXDEKR+26XVNT6jUlQlVjsC7vUrDPeSlHYBeYFodz
	 /aDy1bRazMTqUNGD513PRWYcqcniVOXNvdGGg7y5ye7IZpRq0GXNB1h8Sy0bMzMTMIT2O
	 wz19K1iv3/l+akqb/D/gGHaAjFRG/hMIna7nzC9d54xFAi25WtsiWTSbeVGGgkLFuawgV
	 5TVn8iIiHIn0Y/uTfpWrQcgngo5j2Trn4Ylk4CilfD9olCepsXWRzQcvl8C6BdTN+gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMLCbD70;
	arc=none smtp.remote-ip=74.125.228.1
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FE3606A31C
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMLCbD70
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cd63952c9f2so54639a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571555; x=1793176355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=aMLCbD70lG2ra3PGM1SfOYbsuDFFUA58jMOpAvv25NRBiRMGxCaO9ab6VhoFgaIWBH
         n3dls44ov13VzzSkVpYwfSCmJqh18lm8IQsFBeezJ4nk98NOb1k0ZXToS0rKw19wZmIJ
         iG3eoosAGPuqmaD9NVmRPnnlmtHFFL5qz33edz2NzT+OR7BcQCkKMUbQjIzhu5SI9X1P
         Osy2vdTLQXhNQX8536/ZN5mv3zxilwkru2olvDceDOfIKqushzeVRNmq0/qDzMGj9gby
         DNO4wUJdN3HjKg/0UG07fFW42eBLVD480NA8XXjqPRSoubDv2TAoP8/fVyDLiPOjVA81
         0NxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571555; x=1793176355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=JAePVGIvFKChu7lmtrCeZHERykVBvfWzhmNQOM1hRnOb3ObNY1uficzpSdPigCeWTh
         hlt3D01winG2MdMW7oB/pLqVbxSI0L/zMP7DPWXR3N4FGbCdFiBB2qMgdvD6vZJTKVNG
         GKMBPXuR9keQ1nlMDA/6OTZ4lupGNUPj9jIx4TzTQU/vQykMQcUqnxllxxlE2lCEtaZV
         /imXC5EjUTJ3WhsoLipBWnZqwo7Yv47E/Na1VNRkjzC0IEmGbwAg6P1vSxVExogC/MYc
         77v2PRDzc5BK+K7KTIi4DOLOqkc/aBWEfqito3lESIOoq3LiG0yEQRKwD8TMjtOGpIn5
         s9NA==
X-Forwarded-Encrypted: i=1; AKwUvBxbAC2xpcIgYZ6rfSUdnxcneLjQfxGXBE63idwaKPgPQ7uFCgUKiIl9LXgYFLlt0wNewccsX/ulsDWQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4z/DP6QKQtImmjF0Jws1r+XE6osYAtBuKnDWj17A2bn9WIeri
	B97Dx3oOn74mfwl92NqCzePNF6DAP8QtNqecw0mtt9FeRjqDRm+BORXl
X-Gm-Gg: AYBFou1sNcvB7JXlTycmYqa1yQ5AtwNQzEZxiTj9051bW7JzChYltwrRpeYikOHokMC
	0dIuTlIdvQzUV6k+n7ZWWjjFrLWzs0CFKzEbdc3n+bLfDyKR35Blj/ZQQaXPSzqVBttrXdqK3Zw
	CK/wh6fewdlzNJ6KCQ2OzU+WcdP3Na0AhsFRwlG+Kdx0kBjCE1+u9a0RRfIZhON6tZ5+PLxCMwR
	j+c0koeWZ1P0OQAwrUqB4ktvp7kfs9vUosDtN7alss4NYDvN276vAsAiGwPFNzaHtPbJGJKz8Ic
	hhePkdD7gFsx9C6SPCTA/tJ0VIbqU6wpNJVpqCSA64l51XMYRK3Yo7Vn7ZLXAKDv0Fdpat0IMIZ
	AhN6J/wtYAxOnPtLCB1lQs6wFs0Ae/167q/VH8Dz2TmQ5R4zqpTdlfcx/30UIDbdtvT4K+ah4qy
	jweN0w3/41mrLIT0A0/DQVM4lG/pT4cb5TnNHSOxaMA7OPXzw+4C7Rx5nSfDYmFo1SbPshUiDtR
	oTAVjuyHjDMTKrvKhyzpovB1P7mENSlqULu/5CewYglmrYH0L6JXXrzVUdiHuWYa2Qj
X-Received: by 2002:a05:6a00:1786:b0:89f:3f60:cd81 with SMTP id d2e1a72fcca58-8a089d539cdmr1130152b3a.51.1792571555108;
        Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:33 -0700 (PDT)
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
Subject: [PATCH v9 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed, 21 Oct 2026 16:30:11 +0800
Message-ID: <20261021083011.2170525-9-chenwandun1@gmail.com>
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

