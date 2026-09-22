Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70EC52E054
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066629; cv=none; b=MX2OCDwbHtryrigN88RWgSkIYVpm0UdaELbQLZjFUPSO2rXff67PUit9Yc5c1tt852T4Dt4u8hNK8ARUba/O+BiVRnKBJ/CnrO5dtSyMuYxSSG2v/QKn5K8E6e5tQsOADdMu/mE3rQe0yUKmy8aLhlNnYmxKru3lH7xgw1+xLRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066629; c=relaxed/simple;
	bh=DYgu14ldWLDawZXAo/7e6ZGTkYuIhCDmacFGgdEgG38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqAA8yJFlQ7G+IeFYv4pzMZr7rnqYox8AExY0L4aqysVAQe/Hu0toPtLO07BNHFbrPkQobgWeE8BvO53+UyTuhPu25c66OVvV/YEhN8nXKJQa83emYT3U7BjjJlE3hp33Bh/XQ9IEKfNp4FCRc1qmToUU1REtZhGPMmaugva7Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBsStbe3; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBsStbe3"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so5078368a91.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066627; x=1790671427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=IBsStbe3nFPDfYMfzNKMQlR5KHLTJrK1lRZe4Oeca+tozhH/OL38DZTRhoGLBeJuCG
         cuv46b+9laHz1CzLyD3YUo89HWlOAdwY2nfaXj3U0dhhyE5CXUYqmYngGY+6ydhhlczV
         2koF3vDNhHwyRgnPRnx6FLxltoWMLQPGZxq0QU+MiYAPAdLWbIrqYK9gaycOZZ18dYrP
         1hIYT2YWmf9lLHerP3cyPJvUqNqybSfZ8S5Tl/nx6rr0TQhnRlP2Fyv6sKyHCHDkvpbe
         FXlEsbvCuKEZjWnPh7EVzHfRG4tbE4nGaNrSscg5NLv4isYu1r777taGUYhXdiHA8Hm1
         WCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066627; x=1790671427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1DOWyR/dLH3AEbWE3m8aVGig/7kxpUIrM7nXUawY8c=;
        b=k0gTv7TCO3zdYIpcjYVm5sjhWbEZWOGNdHLtYbY/yraWSmtrdEeaMWDmK4Smn7UQBc
         F6VdaW3WjXHWroMh9TKMHmAGTCjMBhtqbmbDbQdRP8mgb3Vsp8imROOJOuZ89M2Nwtc/
         U/bVV1Kjm2vISfrsjVSJNR6dhAXGRfv0oRFb978r6BIzj3j/0rZVLyw3kQFqengd3x5i
         Qt6QhjMkp6JXkdU7mrBY7BgTuP3a+h18ghRo4KE99fn8FRTuW3qeGcHcH01b1tkADQQJ
         XwTVMlHmd8c1z7FGk30kUZyMw0LOo8GDYGvZXkXFKUK63yIDsVaAZ0qyesuzO1l/oeWA
         KymA==
X-Forwarded-Encrypted: i=1; AKwUvBxYfGEBzQ7OUXIQETQ/otGyT8MSs6Jb4Ea4boPzjDwgYDqaB9KhbVnQ6AIn9KwzRa+FqexMWIHVjZ+T@vger.kernel.org
X-Gm-Message-State: AFuF++ldtVqe0rjPAsuyzVAnS9+0kAxvs3ck5pDL4h4DlRPWwvUFivcM
	YcFj3jPE46pvbzmizCyPwi2K7orGUeNRiC7y97CA+RGRnaSvj/5u/4mX
X-Gm-Gg: AYBFou3UTFlpSBmaGxGKiEoHfs33xpwdUp9YV5hqXnvrD16Nj/jTmGJeQnxdG9ziu+L
	nMF7XsTfczBtl34wkVLxAg4TLi6xOhGzafB5C9mc9OJQvt3vWVg7gK1YTt6MAPn91ZgCej2aZFI
	Pmtz8ht7jkHDesWzLP6cxoI89TBFRjse/qwgTbw9DErBRb8xqnIwgyl5MuvhXT9Atplg6/rrcu6
	yV4M9hOe0WmincQInsXk6crgcCml1mgMyMuKVm7CHTF5nC+jOb9WHsbZQPwIboOBbh4DTqOP1Ux
	UxtwGHlfrX46MjlfMnjNTpEwO4dxy042/5NJ+P3Jbz+oDFvDWhwtUyOWJIM/1vGDpxulZmH4/EL
	5CH+mDtSafWEK1B0K2vKaQxY2Oi8KtNumQZjYVN2YELyYYygAZzgeIkuPU6PzLS6P1e7dO4ujN7
	7T8s6Rsi6wqwcDGL5AxhKn3L8npkm4cMiIYd1iKIlywrjfLBgrVlO0XJgztv15zecKEoNX8ceOB
	ZbZT50zx4w=
X-Received: by 2002:a17:90b:5546:b0:39e:14db:437c with SMTP id 98e67ed59e1d1-3a07309c886mr542158a91.4.1790066626997;
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:43:46 -0700 (PDT)
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
Subject: [PATCH v7 3/9] crash_core: serialize crash header preparation against hotplug
Date: Tue, 22 Sep 2026 16:42:50 +0800
Message-ID: <20260922084256.1515554-4-chenwandun1@gmail.com>
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

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86 memory hotplug path already takes
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
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

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
index d201638d11f3..d0cc2496dc09 100644
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
@@ -338,8 +339,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -376,6 +377,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
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

