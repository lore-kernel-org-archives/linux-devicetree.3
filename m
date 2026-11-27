Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774199;
	b=obu1FXMCwKVvWr5/p+gZ5JgDIAduL/fwZ7RzjJHNOA7+s0sXX01lT6gdQiINUXKaSv6D
	 4VgyDmUEgFHtDmmL2qk+rLOoid8FkH4uaxWjLMD+IF5sBtIQ8CEtfA0UJYNRf48pGIBtb
	 9qA04qYNOY21/pJVQw7HV3SrrOkCNKfv+PUPSELgm7iwZnTbO5CvEyEj5lyTZOU5qaA/v
	 aXXU084rOSdyv+K6AfbKS2Tn8wqtbalTHR2+ejH4KNve/BL3SNEJsDpYvQXbzUd0DvXMU
	 A53jgK06HRSko0NnAYLTJJfcMmIC49i/GA/mQaqfoux9/OOql9me1yeWf54Qk90fDOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774199;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VAYr9WX92dg3SvFjZudKbj8hGUmjBf0kHQsMj3Huy2A=;
	b=YJQl32Opj7juy1avBNk4G8OzR/izV8hDPRU4HpsOLm9FyhbgqbacxBq2oc3SVFiHowfe
	 mNSgGUbzsk32OvrobcQQOKamWqtdjabZXqxQB56XuokK6qc8w9JaBlJkiQTjPA2hbhMOo
	 8Tt/VrXnfIi03aa0DxXsXiW3bTEnhk9hpBXVt9hOOa1V2VQ5ocH7uN3f1IahfLu59/wAv
	 rLKdhU1tpkQGJzpnaIE86+X7t8dUkoP0ECVO5bpccCyFUrFgE1B4CIu4g9lJMicMoKfJJ
	 BjaQV8fDnu5qGvoNZ46dfrEld6bHV5gDgUcXglyso0l9Fe8xnQ6cwCl9HWbTxwowcKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gxvGi8l5;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE4606A32F;
	Fri, 27 Nov 2026 10:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AE4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gxvGi8l5
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VAYr9WX92dg3SvFjZudKbj8hGUmjBf0kHQsMj3Huy2A=;
	b=gxvGi8l5GYdAixG1QRWsiSMLXXsHyOINqSPUArEqcmmeWhWDwV6nk3CkHtY7MDp+FMWYyzx6n
	HOBPUbx0XU/w94jHsTYt7dspTnSwdWfKEmGxB/qdyl9efuTCs2wvrwlVEjkDtbQfNn79EZnH2fE
	I8C2D6gS4O3csk5lTZtUg8E=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfl2Nl9zRhRf;
	Fri, 27 Nov 2026 18:09:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 303DF40575;
	Fri, 27 Nov 2026 18:09:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ben@cressey.dev>, <leitao@debian.org>, <mpilaniy@redhat.com>,
	<yeoreum.yun@arm.com>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<prudo@redhat.com>, <bradley.morgan@linux.dev>, <sourabhjain@linux.ibm.com>,
	<blum@kernel.org>, <hbathini@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<arnd@arndb.de>, <tzimmermann@suse.de>, <kas@kernel.org>,
	<rick.p.edgecombe@intel.com>, <mhklinux@outlook.com>, <piliu@redhat.com>,
	<shradhagupta@linux.microsoft.com>, <thuth@redhat.com>,
	<ebiggers@kernel.org>, <me@linux.beauty>, <mclapinski@google.com>,
	<graf@amazon.com>, <tangyouling@kylinos.cn>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v9 07/11] powerpc: kexec_file: Use the common segment helpers
Date: Fri, 27 Nov 2026 18:09:21 +0800
Message-ID: <20261127100925.3019877-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127100925.3019877-1-ruanjinjie@huawei.com>
References: <20261127100925.3019877-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

load_elfcorehdr_segment() builds the elf core header from the powerpc
crash memory ranges and places it as a segment.  The header needs
powerpc specific post processing, so keep building it here, but use
kexec_add_elf_core_header() to place it.

elf64_load() also loads the initrd by hand, use kexec_add_initrd()
for it.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/kexec/elf_64.c       |  9 ++-------
 arch/powerpc/kexec/file_load_64.c | 14 ++++----------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index d9a466cd602e..1ef444494641 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -96,18 +96,13 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	kexec_dprintk("Command line: %s", cmdline ? cmdline : "");
 
-	if (initrd != NULL) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
+	if (initrd) {
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.top_down = false;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out;
 		initrd_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
 	ret = get_reserved_memory_ranges(&rmem);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 0cf03cee35a7..77652db7d1ca 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -416,9 +416,8 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	/* Fix the offset for backup region in the ELF header */
 	sync_backup_region_phdr(image, headers, false);
 
-	kbuf->buffer = headers;
-	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf->bufsz = headers_sz;
+	image->elf_headers = headers;
+	image->elf_headers_sz = headers_sz;
 
 	/*
 	 * Account for extra space required to accommodate additional memory
@@ -427,13 +426,9 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
 	kbuf->top_down = false;
 
-	ret = kexec_add_buffer(kbuf);
-	if (ret) {
-		vfree(headers);
+	ret = kexec_add_elf_core_header(image, kbuf);
+	if (ret)
 		goto out;
-	}
-
-	image->elf_load_addr = kbuf->mem;
 
 	/*
 	 * If CONFIG_CRASH_HOTPLUG is enabled, the elfcorehdr kexec segment
@@ -442,7 +437,6 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	 * memory in the FDT prepared for kdump.
 	 */
 	image->elf_headers_sz = kbuf->memsz;
-	image->elf_headers = headers;
 out:
 	kfree(cmem);
 	return ret;
-- 
2.34.1

