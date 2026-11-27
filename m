Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774207;
	b=XveHK4KzJJeCdoKX25LP45Kp1EfiBaTj8sdMJ5dgFPsxpnYThxJwzNIgx1WLydHDI2+N
	 tjsZv8qfYQCMGh/7QKGNyBEgR3ExUqE+HQ9YJS44J6BR00T5hbbWBb5FwRFxRVTW5wqZ1
	 8IzY5VDwfndfClGkwsYr2MAwVRuQq7ojoAZTLZPKP0iSF9LbbYh8pCvI08FqwUy0wCcML
	 UdYiPl/13qzvcSG4LZLCzfsu31p8pzzIFMnzV4x8hSzH37meHQRI/s+ZrB4FOWR+EHMJK
	 b6TfTl2q+5C/gjPKuzK2UFn/wXfORkJboz9kgJRPfZzH845+HcNT/nfbZsrdxHbYCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774207;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=g2aQKnf0jkhqB/I9ZHGtic+nzES7sUc76+DfqqwSp3U=;
	b=0BMOizl/AalaaU4ugasuZ4bOvO9KNeDPh14Ahvb1c5b8c1rix8+HVXBj1f2K/r9V3AQ3
	 cVtn11A1hpDCkxIKlKHtg/goJM6ETNNAxs+dZb8mPX7vsOxFdb/TelQDUCKX2cxStyLty
	 Q16Yc8O3z0+Sn/g76nwD7MGIJ0MP4u2T4cl1tHGsv2AsBeBMEqx4gxftG9RIK9e6lCoEy
	 kM0B92T+zAol+YdSlGiBq6uglCSZIVa+97BB9swz1JUwdtPmhCW0g+GdYWOsQC+N9vzQx
	 IuTTuhTJJHrAFGvTKjSmBIS/r7JYWSKmMoODR28K876FHNmNyRkJqg3fETgzGiyEtbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=oyPM1LHY;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D7606A680;
	Fri, 27 Nov 2026 10:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734D7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=oyPM1LHY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=g2aQKnf0jkhqB/I9ZHGtic+nzES7sUc76+DfqqwSp3U=;
	b=oyPM1LHY89iXEB/3m8eV7j/JnAvgIAmIVdOB3B0IFDd3WF/qjOBWoPQKp5QuLXZhR6PVx6H/Y
	1dPu66Tj827doYjgQXafxjgCASuqLAY5JFDlN2FcJGp8tMdwFfK/b5JFqj8ZQSX6tXe2R8eYfbV
	Nn0Eonw/t6FYr3r3mWlR4F4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jbTfr69rTzRhV7;
	Fri, 27 Nov 2026 18:09:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B5B074057D;
	Fri, 27 Nov 2026 18:10:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 27 Nov
 2026 18:09:58 +0800
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
Subject: [PATCH v9 10/11] arm64: kexec_file: Fix CMA segment placement retries
Date: Fri, 27 Nov 2026 18:09:24 +0800
Message-ID: <20261127100925.3019877-11-ruanjinjie@huawei.com>
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

When load_other_segments() cannot place the initrd or the DTB, the
segments of the attempt are dropped but their CMA pages are leaked.
Release them with kexec_rollback_segments() in the retry loop and in the
error path of load_other_segments().

The loop makes progress by advancing buf_min past a segment placed by the
walk.  kexec_alloc_contig() ignores buf_min, so once the pages of a CMA
segment are released, the next attempt can get the same region again and
the retry makes no progress.  Disable CMA for the retry.

A CMA segment can be anywhere in RAM, so moving buf_min to its end can
raise the walk's lower bound close to the top of memory and leave the
retry with too little space for the initrd and DTB, failing with
-EADDRNOTAVAIL.  Only advance buf_min for segments found by the walk.

Tested with a non-crash kexec_file_load() on QEMU virt, 1 GiB RAM and
cma=64M, which places CMA at the top of RAM.

Before the fix:
	The retry leaks the CMA pages and kexec_file_load() returns
	-EADDRNOTAVAIL even though RAM below CMA is free.

After the fix:
	The kernel and initrd are placed below CMA and the second
	kernel boots.

Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/kexec_image.c        | 12 ++++++++----
 arch/arm64/kernel/machine_kexec_file.c |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index a2a7c283b331..1cbb3c73c6e9 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -109,11 +109,15 @@ static void *image_load(struct kimage *image,
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
 
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index dff2cd613f87..169d991488ff 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -132,7 +132,7 @@ int load_other_segments(struct kimage *image, unsigned long kernel_load_addr,
 	return 0;
 
 out_err:
-	image->nr_segments = orig_segments;
+	kexec_rollback_segments(image, orig_segments);
 	kvfree(dtb);
 	return ret;
 }
-- 
2.34.1

