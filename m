Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F73E3DAF;
	Mon, 25 May 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699046; cv=none; b=Bm75Le7sgH+STm3eGBceZUC4cO9ufTmLlS2j3tYyYZIPFui0Qv7oncGP+2VN3EUpJjZNbJeE8pstc3fGjf3PNQscfuO6pI7vl2gcHSHoj9k+YmCUjF1uZdftko9RNgtaLW2WEztNK9LBG1MXgSlhzOISFm0BUfg3M6/VrHeLU94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699046; c=relaxed/simple;
	bh=lU/xtGeOlMOT0/jB1WnUEezZ3xst4uUBGw2TMALQ7OU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uK2VPPUw/y6CqHWcLkUKg5AproGRUepx+4wrJz/uzJJonUmrw3eKWv+EzueZBN0XnJcHTaDn1fcERTh7hbJfwNhdQJzLqzhkdgJqy26t59zv5RMF4yT6yky/gSDxcR38lm2nvAe1wtGtnVeGkR+2SOiKZNBejmjUEo/qHoakQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=isbuAmGN; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="isbuAmGN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j3PJUzj96ZS5dWKXwlgFG1d8kJSCnZuYsDxIEYeopI0=;
	b=isbuAmGNg2O3W0u52hS/fSaiucVNDUOxwZ8sVqcigttUSPYLegIvhabkTPOrlXnl64WhE7h2B
	8d3oGFo4Wq78I8sROnCShtwag7c6lREpDYuzswGzS7PeKzDYu8x0FKbhd6KUS/VTCtm2dMjh75L
	iF9fHGgllxkTuMzRN1EHFmE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gP8Y40CyrzpSx1;
	Mon, 25 May 2026 16:43:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 89878202E6;
	Mon, 25 May 2026 16:50:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 May
 2026 16:50:38 +0800
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
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <ardb@kernel.org>,
	<masahiroy@kernel.org>, <mark.rutland@arm.com>, <maz@kernel.org>,
	<james.morse@arm.com>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <kas@kernel.org>,
	<debug@rivosinc.com>, <namcao@linutronix.de>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <seanjc@google.com>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v14 08/17] LoongArch: kexec: Fix potential buffer overflow in prepare_elf_headers()
Date: Mon, 25 May 2026 16:49:23 +0800
Message-ID: <20260525084932.934910-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525084932.934910-1-ruanjinjie@huawei.com>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Sashiko AI code review pointed out there is a TOCTOU (Time-of-Check to
Time-of-Use) race condition in prepare_elf_headers() between the initial
pass that counts System RAM ranges and the second pass that populates them.
If a memory hotplug event occurs between these two steps, the number of
memory regions may increase, causing an out-of-bounds write to
the cmem->ranges[] array.

Directly introducing get_online_mems() inside prepare_elf_headers() would
trigger an immediate recursive read-after-write deadlock when invoked by
the runtime hotplug notification path (which already holds the hotplug
write lock).

To eliminate the TOCTOU window safely without deadlock risks, move the
get_online_mems() read lock to the top-level architecture image loaders.
Since these top-level loaders are strictly executed on the initial system
call path and are never re-entered by the runtime hotplug notifier, this
approach physically isolates the locking contexts. The system memory ranges
are forced to be statically frozen during the entire layout generation,
eradicating the buffer overflow vulnerability.

Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: stable@vger.kernel.org
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..2a1a6124f043 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/memory_hotplug.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -75,6 +76,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
+		if (WARN_ON_ONCE(cmem->nr_ranges >= cmem->max_nr_ranges)) {
+			ret = -EAGAIN;
+			goto out;
+		}
+
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
@@ -163,12 +169,15 @@ int load_other_segments(struct kimage *image,
 		void *headers;
 		unsigned long headers_sz;
 
+		get_online_mems();
 		ret = prepare_elf_headers(&headers, &headers_sz);
 		if (ret < 0) {
+			put_online_mems();
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
 		}
 
+		put_online_mems();
 		kbuf.buffer = headers;
 		kbuf.bufsz = headers_sz;
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-- 
2.34.1

