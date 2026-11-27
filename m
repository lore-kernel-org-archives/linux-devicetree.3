Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774193;
	b=SKyYFt0PO3Nos6smbQextdTZYvqeF9C+f0pZP+0FNx94tOLOaqVYGIDeQ3Aiw+7xmX6t
	 tl4zxz6I3MqpBemqBlNC+/4MaSvGDhVmnI5WVRN9u0Q0VsY/XNbffNV6HDCEIvsN9tHdo
	 6PI4euJ4CG49EoA9RgNbDy4qY8rJvMdouqHy+gp41R+5xuLNarMsT/tfUemsC2PVU3Nhq
	 gOIrxPWcHxv8TMs7RLsSIm/WB8X7rKtl99S0RdMBlmk5v+CbHZd803VWd/Hbh4+Y4MmLW
	 OS49qdXC4a3Cy/9CmG191ro3i7ZCrhqUqe/ikg7P2TRnmE/v1+8ZCEXWHHCmopDj8+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774193;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XQb1skFCjLphQHWfA2YEBdV+jAhH6kVOU72rY/VpDtA=;
	b=tnLicYvpHYLW6MDPYBeTKVkNPWRndpSnZdmcGlXh9J3/lBgaDIz+nIC8PXPRTeHwP2Fm
	 cYOC6lrzH6UPTq6wdW92aPJZTPsA31Qodq2zaCZFOT6oJPVWYDMBKkbN8zaT/WFIWzrEC
	 Ka8gOzuWmpgZnH5QUX8ZJ5OT7P18l/ICTaDi+qmasqZI5HfXL8S11nkW7sTcsvCuubAb6
	 0Igeek76GKgbiEY7eu3KDOw0QIJYAsStwboZ6BoVYjLnr/zbVvU1PV7vr7vMdc9zAzSNw
	 TpAXZIhTZmfzmcBXjo9cYS31DQLaWuuf2hfAiZrTt+/Scb15+QAyE7oPJj+6d6ovi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=I1MJXjfc;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E1606A326;
	Fri, 27 Nov 2026 10:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=I1MJXjfc
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XQb1skFCjLphQHWfA2YEBdV+jAhH6kVOU72rY/VpDtA=;
	b=I1MJXjfcizOvg7LgeufidGKqECOwTqHeXQmh59XulFZAjVQYFbjwfTn2PmpsihH6pNQ/vgJWd
	VYBXso2Wx9GFNmSXc7OPAh8+FJw69cRBa5Ez4rAhFIb7GwKrcBY9pWFzXe24Rc9uCkowL0bCk0d
	CM3pJcKDNVCbVT7BvBcetEk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfg40LhzRhXK;
	Fri, 27 Nov 2026 18:09:31 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 69A3E4057F;
	Fri, 27 Nov 2026 18:09:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:49 +0800
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
Subject: [PATCH v9 05/11] riscv: kexec_file: Load the extra segments with common helpers
Date: Fri, 27 Nov 2026 18:09:19 +0800
Message-ID: <20261127100925.3019877-6-ruanjinjie@huawei.com>
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

Use the common segment helpers to load the elf core header, the initrd
and the DTB instead of open coding them.  The initrd and the command line
come from the image.

Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/include/asm/kexec.h         |  4 +-
 arch/riscv/kernel/kexec_elf.c          |  3 +-
 arch/riscv/kernel/kexec_image.c        |  3 +-
 arch/riscv/kernel/machine_kexec_file.c | 79 +++++++-------------------
 4 files changed, 24 insertions(+), 65 deletions(-)

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index e218835eb10c..34da4d0e2cdc 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -70,9 +70,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
 #define arch_kimage_file_post_load_cleanup arch_kimage_file_post_load_cleanup
 
 int load_extra_segments(struct kimage *image, unsigned long kernel_start,
-			unsigned long kernel_len, char *initrd,
-			unsigned long initrd_len, char *cmdline,
-			unsigned long cmdline_len);
+			unsigned long kernel_len);
 #endif
 
 #ifdef CONFIG_CRASH_HOTPLUG
diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index ca5abbad59e5..2071a22b846c 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -126,8 +126,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
-	ret = load_extra_segments(image, image->start, kernel_len,
-				  initrd, initrd_len, cmdline, cmdline_len);
+	ret = load_extra_segments(image, image->start, kernel_len);
 out:
 	kexec_free_elf_info(&elf_info);
 	return ret ? ERR_PTR(ret) : NULL;
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 963a25f5b55b..010a84085cf8 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -83,8 +83,7 @@ static void *image_load(struct kimage *image,
 	pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
 		kbuf.mem, kbuf.bufsz, kbuf.memsz);
 
-	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
-				  initrd, initrd_len, cmdline, cmdline_len);
+	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz);
 
 out:
 	return ret ? ERR_PTR(ret) : NULL;
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 1d67fb42617a..a8b6767cbf6a 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -236,53 +236,37 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 
 
 int load_extra_segments(struct kimage *image, unsigned long kernel_start,
-			    unsigned long kernel_len, char *initrd,
-			    unsigned long initrd_len, char *cmdline,
-			    unsigned long cmdline_len)
+			unsigned long kernel_len)
 {
-	int ret;
-	void *fdt;
+	struct kexec_buf kbuf = {
+		.image = image,
+		.buf_min = kernel_start + kernel_len,
+		.buf_max = PFN_PHYS(max_low_pfn),
+	};
+	char *cmdline = image->cmdline_buf;
 	unsigned long initrd_pbase = 0UL;
-	struct kexec_buf kbuf = {};
 	char *modified_cmdline = NULL;
-
-	kbuf.image = image;
-	kbuf.buf_min = kernel_start + kernel_len;
-	kbuf.buf_max = PFN_PHYS(max_low_pfn);
+	void *fdt = NULL;
+	int ret = 0;
 
 #ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
 	if (image->type == KEXEC_TYPE_CRASH) {
-		void *headers;
-		unsigned long headers_sz;
-		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
-		if (ret) {
-			pr_err("Preparing elf core header failed\n");
+		ret = kexec_prepare_elf_core_header(image, true, NULL);
+		if (ret)
 			goto out;
-		}
 
-		kbuf.buffer = headers;
-		kbuf.bufsz = headers_sz;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		kbuf.memsz = headers_sz;
 		kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
 		kbuf.top_down = true;
+		kbuf.memsz = image->elf_headers_sz;
 
-		ret = kexec_add_buffer(&kbuf);
-		if (ret) {
-			vfree(headers);
+		ret = kexec_add_elf_core_header(image, &kbuf);
+		if (ret)
 			goto out;
-		}
-		image->elf_headers = headers;
-		image->elf_load_addr = kbuf.mem;
-		image->elf_headers_sz = headers_sz;
-
-		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
 
 		/* Setup cmdline for kdump kernel case */
 		modified_cmdline = setup_kdump_cmdline(image, cmdline,
-						       cmdline_len);
+						       image->cmdline_buf_len);
 		if (!modified_cmdline) {
 			pr_err("Setting up cmdline for kdump kernel failed\n");
 			ret = -EINVAL;
@@ -311,46 +295,25 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 #endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
 
 	/* Add the initrd to the image */
-	if (initrd != NULL) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
+	if (image->initrd_buf) {
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.top_down = true;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out;
 		initrd_pbase = kbuf.mem;
-		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
 	}
 
 	/* Add the DTB to the image */
-	fdt = of_kexec_alloc_and_setup_fdt(image, initrd_pbase,
-					   initrd_len, cmdline, 0);
-	if (!fdt) {
-		pr_err("Error setting up the new device tree.\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	fdt_pack(fdt);
-	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
 	kbuf.buf_align = PAGE_SIZE;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.top_down = true;
-	ret = kexec_add_buffer(&kbuf);
-	if (ret) {
-		pr_err("Error add DTB kbuf ret=%d\n", ret);
-		goto out_free_fdt;
-	}
+	ret = of_kexec_add_fdt(image, &kbuf, initrd_pbase, cmdline, &fdt);
+	if (ret)
+		goto out;
+
 	/* Cache the fdt buffer address for memory cleanup */
 	image->arch.fdt = fdt;
-	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
-	goto out;
 
-out_free_fdt:
-	kvfree(fdt);
 out:
 	kfree(modified_cmdline);
 	return ret;
-- 
2.34.1

