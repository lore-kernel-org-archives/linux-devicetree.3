Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774201;
	b=ZSqvWyihlZclhr8gWg2ez8IA3L1tI/ktGeoioquDV+vIQDdhA1RNj+NF99vZ62Q7QExl
	 mhXw5Up5X+uXVJ8QtIe+4Q/QHmuQglFHstd/u25ylOMXqBfEVUjOBDYhReGKCGvfQYWZp
	 D0TFoIueb0hbbi7l48URk1PTzt6qthexOFna1TtS6rW4e6oi1OlKeEiYrGBpH3PB/gDgV
	 KDWeGt4VFmswd71LgASog19zhFIgJ1pnh7VF7+L4iy6InSeatVPWyflUbXRkzPOtchmXj
	 p1pYKDNoBbggEPpGr5D8nyDuMNh3GBvuXlL5+3oU6EoudWww+1HyZBK0fcKBS26lD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774201;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=j5utrnwiKYMPXhLTIGusrabxZitsD+sBaIfvDHphdLU=;
	b=jb9bHYooi/fICl5MSfA99KoQhHH6lgbGtmH0A4bBB2okVTO95zAmynev/iA5tiMu9h7X
	 EN8aYYZIHt8mLjlU+UQK3bU9jNojW6+g+RvO0W411nVcoaHgSZ3YWV6ts6pOKanf730nW
	 X9Rcg7g3zAxZ9hLUw4wyUAuOphGssrEJxnSZj7hH2WEQBIO2kJ1GfPi8kLbIOtU6YL/r9
	 B+cBAdoFpa+RD/QCBVw48PfjygxLim/Ik5OkDJd+RuNaz1KmhxGVZpjWpw6ygT445TKNW
	 6tBfUgfNZQxgwcy/68d9dw7AvaQgDt76bE3N5wO7IgBb8kA603sT0rl2hGBIqM4Tnvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=EH9gi59W;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EAC606A33D;
	Fri, 27 Nov 2026 10:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EAC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=EH9gi59W
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j5utrnwiKYMPXhLTIGusrabxZitsD+sBaIfvDHphdLU=;
	b=EH9gi59WRKCLGVPL7KzLlizykGbVtHwUkJ5qyJtTWeirYCS8rjK4vushHzcDqzzrFYov8fMSD
	EiYCC7qEx9YGHySFI8g2DBxNie8Nex06nbZD8lVGNaavrql7kNAij9tw5P+oulOnPSLNdol4QVy
	yUXOGvOhiTkFyhT+ngbz4UQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfj32NhzRhV7;
	Fri, 27 Nov 2026 18:09:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4210940575;
	Fri, 27 Nov 2026 18:09:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:51 +0800
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
Subject: [PATCH v9 06/11] x86: kexec_file: Use the common segment helpers
Date: Fri, 27 Nov 2026 18:09:20 +0800
Message-ID: <20261127100925.3019877-7-ruanjinjie@huawei.com>
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

crash_load_segments() open codes the elf core header loading: it builds
the header, accounts for crash hotplug and places the segment.

Use kexec_prepare_elf_core_header() and kexec_add_elf_core_header()
instead.  The crash hotplug reserved size is still computed and recorded
here, as the VMCOREINFO, kernel map, CPU and memory range accounting is
x86 specific.

bzImage64_load() also loads the initrd by hand, use kexec_add_initrd()
for it.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/x86/kernel/crash.c           | 34 ++++++++++++++-----------------
 arch/x86/kernel/kexec-bzimage64.c |  8 +-------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e6f23933a6df..94c0dde6070a 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -348,20 +348,20 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
 
 int crash_load_segments(struct kimage *image)
 {
-	int ret;
-	unsigned long pnum = 0;
 	struct kexec_buf kbuf = { .image = image, .buf_min = 0,
 				  .buf_max = ULONG_MAX, .top_down = false };
+	unsigned long hotplug_sz;
+	unsigned long pnum = 0;
+	int ret;
 
 	/* Prepare elf headers and add a segment */
-	ret = crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &kbuf.buffer,
-				    &kbuf.bufsz, &pnum);
+	ret = kexec_prepare_elf_core_header(image, IS_ENABLED(CONFIG_X86_64),
+					    &pnum);
 	if (ret)
 		return ret;
 
-	image->elf_headers	= kbuf.buffer;
-	image->elf_headers_sz	= kbuf.bufsz;
-	kbuf.memsz		= kbuf.bufsz;
+	hotplug_sz = image->elf_headers_sz;
+	kbuf.memsz = hotplug_sz;
 
 #ifdef CONFIG_CRASH_HOTPLUG
 	/*
@@ -374,28 +374,24 @@ int crash_load_segments(struct kimage *image)
 		pnum += 2 + CONFIG_NR_CPUS;
 
 	if (pnum < (unsigned long)PN_XNUM) {
-		kbuf.memsz = pnum * sizeof(Elf64_Phdr);
-		kbuf.memsz += sizeof(Elf64_Ehdr);
-
+		hotplug_sz = pnum * sizeof(Elf64_Phdr) + sizeof(Elf64_Ehdr);
+		kbuf.memsz = hotplug_sz;
 		image->elfcorehdr_index = image->nr_segments;
-
-		/* Mark as usable to crash kernel, else crash kernel fails on boot */
-		image->elf_headers_sz = kbuf.memsz;
 	} else {
 		pr_err("number of Phdrs %lu exceeds max\n", pnum);
 	}
 #endif
 
 	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	ret = kexec_add_buffer(&kbuf);
+
+	ret = kexec_add_elf_core_header(image, &kbuf);
 	if (ret)
 		return ret;
-	image->elf_load_addr = kbuf.mem;
-	kexec_dprintk("Loaded ELF headers at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-		      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 
-	return ret;
+	/* Mark as usable to crash kernel, else crash kernel fails on boot. */
+	image->elf_headers_sz = hotplug_sz;
+
+	return 0;
 }
 #endif /* CONFIG_KEXEC_FILE */
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 3aa77006adab..c8e285c9a4c6 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -626,19 +626,13 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 
 	/* Load initrd high */
 	if (initrd) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.buf_min = MIN_INITRD_LOAD_ADDR;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out_free_params;
 		initrd_load_addr = kbuf.mem;
 
-		kexec_dprintk("Loaded initrd at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      initrd_load_addr, initrd_len, initrd_len);
-
 		setup_initrd(params, initrd_load_addr, initrd_len);
 	}
 
-- 
2.34.1

