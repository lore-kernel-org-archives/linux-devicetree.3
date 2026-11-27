Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774210;
	b=zO0AIzZ/M4CbQijwhcesyTb7y6htwXSjWpwMNAL5eWv/NnowdmVrNwoXwvuNUXOK5p4b
	 mR6HN3TcDZedmOstAbOzZlWskMCIUZM1NTL+/KILLTWNtpwuUicc6lGcGIglWIXbJCQrm
	 Q1dCBJJts4czcUsXFB6BCIlgaSrKoMuYXd6KjZAVeYx4Ac8qnGAtIMjYEKQUhsdW6/udH
	 qa+/Gq3DE+GhvbwERsEsIptI6OIzHr4PSTE67u0/+dPel8n6+fSK5ZvCrlHdfVAbn2vCW
	 dEUedrRTWn66H3zk+dKZmgDnBKX2qBiwKR5kbmOZwTzmgrYNw2paHThX7D9RKa25xHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774210;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=RD+RhKHkx2ypFB5sfZGqGwGbb8y1IoqlO39za0vFLv4=;
	b=wOfS6IG0VXxsJrHpePO8ZW5KP2iCyJC8WSioV0SATB9GQPiJIH4WGQrInZ5eMaCzEdwf
	 exrK/Dpk+Aq3OHJriHKgeXKwMkLmMlSA57G31SXlXeUvQKMNH2fS4ujeIMHCRAVJ1lTio
	 zprGCsl66MA246KXZxvvMhdWWjHoAt+MPW4Wg2os1rFOVMFaUsvAFaIqCibqVVc5tefi8
	 Nh2yvuz1wjgLk8SUv1m9zSx6ic3GAxVA2esz1XFOX6v6lXo5u6pJBuhUEu2QNkn6AjbRJ
	 rBGOkwSUIYW+5y5lH3XdYxbbYojwl8vovy7EgsnIKDaSV/6yiwQ5sUcR8yT2Ni/VxbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LHau4pfz;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540C5606A693;
	Fri, 27 Nov 2026 10:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540C5606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LHau4pfz
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RD+RhKHkx2ypFB5sfZGqGwGbb8y1IoqlO39za0vFLv4=;
	b=LHau4pfz/sVP57FiK2UxBBLN/FUwWdlrRFdKQoAagxZjTMYkKP4CCFom+7r2gExa8cx+uTB6F
	wM2IgZjUr4H3DMTa89BmZIZ1XA7SPR269+mshFrZgpWGX6xVa85isQLow5DdpnoG5chTDwApz6d
	kC2XXILcZVAahBiMa/zjgkQ=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfn5JSWzmV6b;
	Fri, 27 Nov 2026 18:09:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B4DBB4058E;
	Fri, 27 Nov 2026 18:10:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:10:00 +0800
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
Subject: [PATCH v9 11/11] LoongArch: kexec_file: Fix CMA segment placement retries
Date: Fri, 27 Nov 2026 18:09:25 +0800
Message-ID: <20261127100925.3019877-12-ruanjinjie@huawei.com>
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

The file-based kexec system call places segments with kexec_add_buffer(),
which takes them from CMA when kexec_alloc_contig() succeeds, to avoid
copying the payload at kexec time.

When load_other_segments() cannot place the initrd, the segments of the
attempt are dropped but their CMA pages are leaked.  Release them with
kexec_rollback_segments() in the retry loop and in the error path of
load_other_segments().

The loop makes progress by advancing buf_min past a segment placed by the
walk.  kexec_alloc_contig() ignores buf_min, so once the pages of a CMA
segment are released, the next attempt can get the same region again and
the retry makes no progress.  Disable CMA for the retry.

A CMA segment can be anywhere in RAM, so moving buf_min to its end can
raise the walk's lower bound close to the top of memory and leave the
retry with too little space for the initrd, failing with -EADDRNOTAVAIL.
Only advance buf_min for segments found by the walk.

Tested with a non-crash kexec_file_load() on QEMU virt, 2 GiB RAM and
cma=64M@0xe8000000, which leaves only 64 MiB above the CMA area.

Before the fix:
	The retry leaks the CMA pages and kexec_file_load() returns
	-EADDRNOTAVAIL even though RAM below CMA is free.

After the fix:
	The kernel and initrd are placed below CMA and the second
	kernel boots.

Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%40huawei.com
---
 arch/loongarch/kernel/kexec_efi.c          | 12 ++++++++----
 arch/loongarch/kernel/machine_kexec_file.c |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
index 4824c47907ac..1fbd0ee1deb6 100644
--- a/arch/loongarch/kernel/kexec_efi.c
+++ b/arch/loongarch/kernel/kexec_efi.c
@@ -82,11 +82,15 @@ static void *efi_kexec_load(struct kimage *image,
 			break;
 
 		/*
-		 * We couldn't find space for the other segments; erase the
-		 * kernel segment and try the next available hole.
+		 * kexec_alloc_contig() ignores buf_min and always returns
+		 * CMA memory, so disable it and keep buf_min.
 		 */
-		image->nr_segments -= 1;
-		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+		if (image->segment_cma[kernel_segment_number])
+			image->no_cma = true;
+		else
+			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+
+		kexec_rollback_segments(image, kernel_segment_number);
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	}
 
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 00940f20b45e..adf7416ff49f 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -190,7 +190,7 @@ int load_other_segments(struct kimage *image,
 	return 0;
 
 out_err:
-	image->nr_segments = orig_segments;
+	kexec_rollback_segments(image, orig_segments);
 	kfree(modified_cmdline);
 	return ret;
 }
-- 
2.34.1

