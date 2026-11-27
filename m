Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770500;
	b=jnkS8cg93oWbOelkj88WeBmLMam1iuYzYr3x3SYkfrB/r1kmtzMWVCs+eGcfX1w28Vud
	 mkLPUvn5GITzrqL23PsIhkXx1gaQA5Lo9PzZts1yYv+KrLoq4uKP8yba5lUWtAmU6OLpI
	 e3EEI6tw2r9fDY8twOyIZes6HMbKYftMcvI27a8SJ78t5/5NHw3dkmilfi1hGOW8I3wJ4
	 Olikn6IaCfv6BCDq1l216enir9zmhmXhUkpZ71mBkxNhm3YWi4IWOi5PUk84e9j5sqwF1
	 DaWEYBSamGh4P6Eh0+p2SG5KOqZ3J7kVhQLhUwMoj4KXluM7gp7mHbWEl59hxLV2dZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
	b=T6j/pPC3qGeGzAHQoIud0UgRT1OVognn4Ue8TLLycskAzpEtSisV11Hfva2aD2nptU7U
	 rdwkd1jVSrcV2VAKR6nck2y5w1g+wMMkBfE3Lxco8kB3Fsd1DBGtl66+hQNEEdDaCm44f
	 IyK5CnYyFCuy/5tiy+4UQ5MdDMG6gBfrjMCT3i/NZSbbiFT29iVQnN1evJEVoDPKca/gc
	 EizaXtt4+ulrhPcUPT+q6Z5f1USRTGXlahEJH7FjmSWzVkZ3PPR9jt/0YMXPZXdB9NtD9
	 Fa/kZuLsmMvSMsuCbZ49jgsGqPWu1SyGU1/nFazeUvmq7k0MikfQLu+foROhH0aCGKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrAdAAO9;
	arc=none smtp.remote-ip=74.125.227.196
Received: from mail-pi2-f4.google.com (mail-pi2-f4.google.com [74.125.227.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60031606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60031606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrAdAAO9
Received: by mail-pi2-f4.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso1489399a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770500; x=1796375300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=NrAdAAO95GuVWwgWHupz0abpXNWTQTBoooC99UjSqW4b6s7njQ0aA7uQ0uCA6JCcaO
         xlUYZRJiKZs7ZPesdC59Ua5nhWKwPAkHv0t+QOqPVuwM2g8LT4kstQ9eNjCAWna8uA4w
         f0zdY1VuRnqF4Xb1ap5qj6++a2pACQ54r72QxjmBV2vq7ZXSWJVSHWZk/0QcIhhf/oL0
         ruue9Vubk4z1ezUqyXasLJuld8VDB0d0SYVv7RsIER6FPvlYyWl60gvNsQWZYrSyx8r1
         6xe2GOq4ncgpkqI3cQVqyxE6ylYxeJpxOOnsBqgWrLboRDWLMfVSVY1jZmI1B29O5uC4
         1vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770500; x=1796375300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBwnwSvBiq0QxdeEz8EUNpHvBkXWdsPgrdZSvJG6u68=;
        b=tKWQC38LAfxz0FR6iEhgBHewIa365Hey14+ngxyk8bJm6hXkQI0qUt/HDNo6dempjY
         LXyuxVOwxlpQbknQMWrM5rNNEj5uwKXtmrOEDyKYvgx41i/wtR6jyv4FvGyCedB+NgqJ
         eNYDa4zClFOEZDa9LN5hwNhrkxmv9OK5CnfzOG5uEIOeQdXIIccL1Af4Ar9ek42QaHIr
         QB/d9hDsStyMjbH0r63PfSVXn6JKm6kpbqhqbz7e0VQ6JNgON7a57IVhT0Nfy0r1LwSy
         i7/HQdSBN89qhIxfFjUvzk+60WO4x84p9AFHJkKKCYqrx1S40bnDg2KU6tUlPG4Yowrw
         df8A==
X-Forwarded-Encrypted: i=1; AL+hErGZXXZKwnHWXW/OapmcQPZgZKHGN1lw+zWcWN6PXe1fV/vpZ0ei7dQugseiVqaQlh7PjK1CjoStQTAC@vger.kernel.org
X-Gm-Message-State: APuU4Z//ZTRUL69A2bOWQMSKN20Pij14pMF4GQrg51QlX/7OCsrsHaW1
	u50vUShSV12Ae/OVR0AbfFsnEVLdI0ViVFpIxxza1E5xyfixvEB3Olap
X-Gm-Gg: AZFdTZeg+HUysK7paaAGWyknGzAkkgKytW7RSYxHEhNpgFd9MH+E7Lo/3YcsIBpQ9gs
	G1dhverxQO8hKz6T1TGuL7nx2NTMgFVtZWiONBNjfRDA2MssHYj69jwOwQjZB4IKzOcPH5iOKtw
	avlzyS/01JdXO7VAxITaOFZlWAtCXMrtIyCIsdzc9ArQeiELa4GLMK1WtgyZMRY/k3IaviJ+/ZW
	pr6EiKNYOWSm1YoWm+WDrPAm4Uhdaog9C5YlEA337vosYIehj6wqQJKraItuQnYMsOyYbIaPBAt
	87x7KGBAZnkIbtBW6a2X8gFR6hAcCs2gKVzYg67aTPv6/AhG5nmFt0/l0WD36MyUX42Qlat3gFP
	ECaygUvQn7YU7uwm9Osi7GxDdg/VI3gtCENvclJaf/9vyCQ2TAisYezPrdsxFlG/0atP+FzcIM7
	m+9X7FttQyleS8miTorKpl9B72YvnS3bD/3sK+F1cUpQ4NoEdxeU3wPi+5vcxSGZfX/nn2Do/cN
	++6FLEo8lQBDaY3KHguGYif3ZEE68RloP68fywMEmEY7f5y5qtDSdkwm8k24uxQGkDyi/+o6qre
	DkzudCovF46Fh6MpS5tPL3WlRx0f7kYDnDOtcVVa+w==
X-Received: by 2002:a05:6300:6d93:20b0:400:77e2:eb03 with SMTP id adf61e73a8af0-4014d35f25cmr14065528637.48.1795770499535;
        Fri, 27 Nov 2026 01:08:19 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:18 -0800 (PST)
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
Subject: [PATCH v10 3/8] crash_core: serialize crash header preparation against hotplug
Date: Fri, 27 Nov 2026 17:07:18 +0800
Message-ID: <20261127090723.741253-4-chenwandun1@gmail.com>
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

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the
same two-pass operation over system RAM resources. Concurrent memory
hotplug can change range source between the two walks and make the
populate pass overflow cmem->ranges.

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

