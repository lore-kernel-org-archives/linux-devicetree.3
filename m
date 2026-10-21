Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571475;
	b=CNI8XULJtktibO+4/U4ML7Yh4XBFUtDeCpLPUGt3m/aSCdyqSvYairRwI8yB1CowEIO+
	 +tuNFtt6wiGJjjixxwIuarHXJv1bArmNzLFL7avgPyQTtCI+Mb1CZD8dqri6M3Nmf/GGo
	 QSqndG2ESymKGecbE80L/0Bl48ETULK4XUJ9gQI4NiUJrMY9NzMar1BX6XuBTrW0lMasu
	 As1ex/LtllIk+UqaC2PiXiUPA64mIkv8dyFNbj0VTltXbnB/UyV0ANPkKPbQsjkLrxiXm
	 FW3m77F3Q45m7BK2bvN0GBDffQ0OgkdAHKQuyh6UPsREAlpJEG71XlOcMBz+BszjuIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
	b=fBLSGLPDrip1HVRbl5iUxdCNkG6tHBWNoKxZdoxibaLlVHw+h1lvTsoCLOnnVGruza76
	 f4uuzgrcfH5/hwSdZOpr5FTJtOkSJmOBxfQJX75T74zf6wfMTblzfKy42hIixaEKPGrqM
	 MALLip5zMhZ9yIomdKxLndxKJ08UnG2dQwn1fuFNfkda0WNwH+Ox/bu1kWZR2egRUI9FT
	 ZaQQhlNfCqYzXIipBtvI6Y//Fh5bK1GCj4vPHWqtt1M3SfteJ4fJ1Rdl4qE95Poy4PBtK
	 65Jgz+4Vg3ixTJPE8vAymRzZiCWlvYCCbGBBb7VHhW0a3n/H8gTm7bSggvjY7dfrEpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="QlwZC/3B";
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F107606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F107606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QlwZC/3B
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd6b195dd0cso9025a12.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571473; x=1793176273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=QlwZC/3BMPPHjKgZxdOuYLu1yhKZcXcXje0BkflnZu9gTGvwVFz6piE6rK3+GZ7NOK
         Mu7r8bbRMFewBcAGUuu+fHisIkN+2FcKkJOq51oaji+QC05Gw5FyOca5Md7QI0F3VMp2
         OiH6vwCgOB7kCTQPKBzQqIHysx8btUZLtKc1BZ5VOuPr2KYURjlRALELj6RuOoVhOX0y
         icxId8BfyGDTFMpGV3iL6cP8enyhyW9THBcmZRddLuMWZOkvBqbHh+fUC1TYeMOYROg2
         75Uu1JyvaLLyKJ6d/vNHbFip+S6hgM1K2QT7Cx69pORqqyDuENgdaOw43/czAURZ3eFw
         yTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571473; x=1793176273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4koY4BOyWDff98SibzubYxzBLIkRmqVVsOccvbFql8c=;
        b=zVn0LcEup8xopC0P9hztj2DJf1c+i741fDrBU73f43YtEqxV7f3ULH2WHxSsyRz3kl
         9RIXPCHWJIWwRk/ckTUxy1F0FajmXXAED7DOTE7KIifUPbTuo+bRDbvxtikIDAXA8nqt
         sS8zB6u5hBOdfTEpGOMcz1gTBDAd0hwtAhPPQE51iU/Mvi1pgBHrMt7Ka6YUz5faisfc
         S3fdZdci3XSfAHAP8MbiXezrTAczr/UcVwTWB+wa7wOc9lg/RMwacdz7AWQVuI6IOGX7
         k9/37g+NeIS0MJ0JRIKzCYFsqlvy17PFFIqJ8LIojhct0UAWgWrGeiLd37d/68riicno
         IeCw==
X-Forwarded-Encrypted: i=1; AKwUvBwizzs+KKYGv4GOUQ+gEqfoq6SA4dHRhhYoXI8YuHP6J6enCT4oyZ66eEXpkoqnOlfWI7vzuKMdDnR6@vger.kernel.org
X-Gm-Message-State: AFq9FYJiGC7k7+y1JrYiLEJsS3QcevHqJDzbRJn0n9GiFrknsE2bXr2a
	RR6LacPlBhbcfB9XMq1TaMeng24ZZ4KjubUYO+b5gzoNOP+iWzfxkbHi
X-Gm-Gg: AYBFou0jCOG5Fa5PXFtnRY5Cb5m2PKFLbXxlUsKlqSY49GhNHONus6x7Xu2kmf0QHzS
	z1qF3mbZPMOWLg9cBERUPdqx9ZTiEfGDKE2i/6QMemadV+vJKCUCcQoZqQ6gFD90+V4zItBEiPA
	P0VBN35QIARXFpUr1r3KIQqDsF6W7ZSMivY5nC08G98dCWtYhKDpOVgB7mSJ7QYD2gryyyYl8MU
	uwnzJTqH2ydC/yyHnXHkPPA/ZJBxHxLlN4ttv4ZQnBLVdoT3LcIzUdF6bJoG3taSUvCSzcFCeX3
	T/svy9PtiVibI7zwP6Xy5L5IAtvDgKoZlSAcHbQRvnY9Z9ZBfasOS3fBs3ANRFl3TFSFdcvygpu
	bwAdLTQyAlFcBbw9HEttmIsaoSSjQ95Jj4xk5ikDwz5bKEa4kVDOTEWNw3WGcyRN/R7wseIJ9Xe
	Z+LhFr0CyxGGuTsAhEKbP77tnWh3Cd/zCtF6+t56IBqWyr0GIInlEsMlnQNSzEyXNZwkbM0yALO
	KIH7eorHq1c1YlY4IkFO+tUeM8bz9eTV74nEo3OWWBECZLBYVJ+qPjHwMGcsY+3SFbK
X-Received: by 2002:a05:6a00:4b04:b0:89e:8242:f35f with SMTP id d2e1a72fcca58-8a089cf006cmr1210490b3a.13.1792571473289;
        Wed, 21 Oct 2026 01:31:13 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:12 -0700 (PDT)
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
Subject: [PATCH v9 3/8] crash_core: serialize crash header preparation against hotplug
Date: Wed, 21 Oct 2026 16:30:06 +0800
Message-ID: <20261021083011.2170525-4-chenwandun1@gmail.com>
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

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86/riscv memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/kernel/crash.c  |  2 +-
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
index fe5a4b306aae..ac8df2edf2a7 100644
--- a/arch/riscv/kernel/crash.c
+++ b/arch/riscv/kernel/crash.c
@@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..bef008a0cb22 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index faa0f22dbb41..8a861a946e26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0

