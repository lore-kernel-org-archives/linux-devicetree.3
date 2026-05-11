Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28237BE71;
	Mon, 11 May 2026 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468789; cv=none; b=S2XPFXzUsWB1ue2ql+CofxxCAxgj820+EJHacV6fmsFlR4Ta0JqqzhyG2TtPz6sK0OJ3GEt80p5oy/D5frdsQ9Q2NoB/7f6U4hX/Hn2mxgxuGSAHKHc7RaXVuiZomYbfciymLNTo1JURI5er46/glY409lGqjF3AIblIDUyY+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468789; c=relaxed/simple;
	bh=2eSj4skdbGmSvCoXolkESK+QdI4gUWxosGBWUDNVGXw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMJ7uOEYKfCLkXAf+ud2+wAWVJ1rHBY9X/jGcANHWF/07Gn9FBixdoIMvI7ou2UmkoRviv/LN6lRI/GR/uhjh2Pvpt2wj9Y9iQq2sArwxZSWb7uTkxIP5WPHij34U0ZLmYWruSEQCfoPw9P6tE0oh3CSBNliXcZQ7YjahW1ntR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tHQP0t7g; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tHQP0t7g; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="tHQP0t7g";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="tHQP0t7g"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U4jtzDZtWo7cF+gZeuLHaS2l2XtHZ+YGddqo2ESPw+M=;
	b=tHQP0t7gIMX2cCSqAt+i2/k7s2vZpFgrRW6gmUB/xrxQ+G1ZN3SNp1MHpsFC5ZCK1662fqsis
	pH5Kc/U1PA5tkbhCRfVpLmW77m4JEH1YxiMIvRkqDeQP9VGzwOC6RETd/mxpnUG53u6qOt+dh+n
	i2PWzMn7sFPkx7CpWmohKAs=
Received: from canpmsgout12.his.huawei.com (unknown [172.19.92.144])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gDPkC3x5Fz1BGKY;
	Mon, 11 May 2026 11:05:55 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U4jtzDZtWo7cF+gZeuLHaS2l2XtHZ+YGddqo2ESPw+M=;
	b=tHQP0t7gIMX2cCSqAt+i2/k7s2vZpFgrRW6gmUB/xrxQ+G1ZN3SNp1MHpsFC5ZCK1662fqsis
	pH5Kc/U1PA5tkbhCRfVpLmW77m4JEH1YxiMIvRkqDeQP9VGzwOC6RETd/mxpnUG53u6qOt+dh+n
	i2PWzMn7sFPkx7CpWmohKAs=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gDPZM5MRVznV6Z;
	Mon, 11 May 2026 10:59:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C3BF24055B;
	Mon, 11 May 2026 11:06:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 11:06:08 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <paulmck@kernel.org>,
	<ruanjinjie@huawei.com>, <sourabhjain@linux.ibm.com>, <coxu@redhat.com>,
	<leitao@debian.org>, <jbohac@suse.cz>, <ryan.roberts@arm.com>,
	<osandov@fb.com>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <adityag@linux.ibm.com>, <guoren@kernel.org>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>,
	<wangruikang@iscas.ac.cn>, <namcao@linutronix.de>, <chao.gao@intel.com>,
	<seanjc@google.com>, <fuqiang.wang@easystack.cn>, <ardb@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v13 09/15] arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
Date: Mon, 11 May 2026 11:04:48 +0800
Message-ID: <20260511030454.1730881-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511030454.1730881-1-ruanjinjie@huawei.com>
References: <20260511030454.1730881-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Use the newly introduced crash_prepare_headers() function to replace
the existing prepare_elf_headers(), allocate cmem and exclude crash
kernel memory in the crash core, which reduce code duplication.

Only the following two architecture functions need to be implemented:
- arch_get_system_nr_ranges(). Use for_each_mem_range() to traverse
  and pre-count the max number of memory ranges.

- arch_crash_populate_cmem(). Use for_each_mem_range to traverse
  and collect the memory ranges and fills them into cmem.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 46 ++++++++------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index a67e7b1abbab..8d72038f206d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -40,51 +40,33 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+unsigned int arch_get_system_nr_ranges(void)
 {
-	struct crash_mem *cmem;
-	unsigned int nr_ranges;
-	int ret;
-	u64 i;
+	unsigned int nr_ranges = 2; /* for exclusion of crashkernel region */
 	phys_addr_t start, end;
+	u64 i;
 
-	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
 
-	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
-	if (!cmem)
-		return -ENOMEM;
+	return nr_ranges;
+}
+
+int arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
 
-	cmem->max_nr_ranges = nr_ranges;
-	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
-		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
-			ret = -ENOMEM;
-			goto out;
-		}
+		if (cmem->nr_ranges >= cmem->max_nr_ranges)
+			return -ENOMEM;
 
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (ret)
-		goto out;
-
-	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
-		if (ret)
-			goto out;
-	}
-
-	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
-
-out:
-	kfree(cmem);
-	return ret;
+	return 0;
 }
 #endif
 
@@ -114,7 +96,7 @@ int load_other_segments(struct kimage *image,
 	void *headers;
 	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
-- 
2.34.1

