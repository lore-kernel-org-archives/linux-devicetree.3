Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCC336EA8B;
	Mon, 11 May 2026 03:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468769; cv=none; b=WYw0XhMnS/QF1yrcM2M/d46/nDwNjA+yTlU6CE+Xu/HoH2MAHTPSkKaCO7zHCNS0g9LbdZZoBXdf9Oz8f78SUlXcr9+0G3grCrXiz7piJ2E1OPgLM0eurKvqrIRT+CvcdIAy8nVjgkLYg0/Szs8mdKCWtSfeZ7obSH8U/go56cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468769; c=relaxed/simple;
	bh=B8VdNt0AglD5efr5WJGnGaW0LpkFnbdj9ziT3bSso5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKyR9n785+C5TxJZhFA09ilDeCKd6jro4zHHKObFMTpGCP0/lo8hEI7Aax1MsIEWF5LMpsvCcFj7rKcLE6H5vY99c7depN7TBR4TMTORrZfI9PEb0Uj5djfqeQ2iHJYRlvFzBI7PFvZXmkRzHw4HzPK9b0uiA5v5cRT9W0w4Mq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DnGAxNcH; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DnGAxNcH; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DnGAxNcH";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DnGAxNcH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OMpx0rP6TP4siTzUazfzG9A9/94LTZ2prxevUaLVlYo=;
	b=DnGAxNcHgOI5tHs2j9fIzL0aQZL3Wom0nPA8aSUyi+nTpj773GBxMIKWBNWLMMXa+RtYjgJy/
	CU3pU+ljhPTLmRTPFkfjPtp9v9+DDAQSJtCGPLIkcKTuhj3Yfx1MvMc7z0pV2jPQYzJoPmrS4/9
	dd/PHiR2biekTTuRbWSUr/U=
Received: from canpmsgout06.his.huawei.com (unknown [172.19.92.157])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gDPjw40rtz1BGKH;
	Mon, 11 May 2026 11:05:40 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OMpx0rP6TP4siTzUazfzG9A9/94LTZ2prxevUaLVlYo=;
	b=DnGAxNcHgOI5tHs2j9fIzL0aQZL3Wom0nPA8aSUyi+nTpj773GBxMIKWBNWLMMXa+RtYjgJy/
	CU3pU+ljhPTLmRTPFkfjPtp9v9+DDAQSJtCGPLIkcKTuhj3Yfx1MvMc7z0pV2jPQYzJoPmrS4/9
	dd/PHiR2biekTTuRbWSUr/U=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gDPYT2crgzRhXR;
	Mon, 11 May 2026 10:58:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A866840572;
	Mon, 11 May 2026 11:05:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 11:05:53 +0800
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
Subject: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer overflow in prepare_elf_headers()
Date: Mon, 11 May 2026 11:04:43 +0800
Message-ID: <20260511030454.1730881-5-ruanjinjie@huawei.com>
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

There is a race condition between the kexec_load() system call
(crash kernel loading path) and memory hotplug operations that can
lead to buffer overflow and potential kernel crash.

During prepare_elf_headers(), the following steps occur:
1. The first for_each_mem_range() queries current System RAM memory ranges
2. Allocates buffer based on queried count
3. The 2st for_each_mem_range() populates ranges from memblock

If memory hotplug occurs between step 1 and step 3, the number of ranges
can increase, causing out-of-bounds write when populating cmem->ranges[].

This happens because kexec_load() uses kexec_trylock (atomic_t) while
memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
with each other.

Add the explicit bounds checking to prevent out-of-bounds access.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Breno Leitao <leitao@debian.org>
Cc: stable@vger.kernel.org
Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Closes: https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie%40huawei.com
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..a67e7b1abbab 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -59,6 +59,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
+		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
-- 
2.34.1

