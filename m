Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC3397943
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088458; cv=none; b=OGLOra0yZmMYcJzOEpG71hfs9OidrYB/3bx9PP5de9kUCQ1L+StoOz502oR4QNJb0dgQJbWWSNFLpI7DeZNNtl2EuTGX/T0x59w+G6DVfqf3cOezUwP1t7g2SPJR0zlTFF80GYgGk//wmjISzq/q2T9BUDERdXbZvQ/bbrPud3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088458; c=relaxed/simple;
	bh=RI1ztS0zrf7hxOtsfyFJq+LgY2SP3cAglteT/oakdkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O9SY9+rckFggERtLyZ4NI1n/Z3Jde4lf54KIIRNOvwPZk6Y7b9kDfYVPx5DfmIRFpuB+0mQXulAPEzmIG4+7z08NtdRgvWkzvBZ7uR7hw2JUOyw7cgrDwToa6sx6n2CwZP37MGV1mZkdEH/O7MkgjNFKd1WHhzpmHINbjX0QfS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=jZRpKU8v; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="jZRpKU8v"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1881413f8f.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088454; x=1786693254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TawWsmxD8SDGcsqSwYUOGoy90jC/5REKfiUF4xQzCg=;
        b=jZRpKU8vVVbUF31h21iMF8R0PaYfzDcv8VOG9wVLTfc/srV+f3X+ssjGCyfiHnxhhg
         tvV4kdcsb6qMHDJRoqAIGAHh/sVneccaaIp22HeNYtxDZG0OrWv9LPAfEn4GSq1mB/L/
         AmmnwwscKqUKf9vA0S89VMGcBTH9dvlhxnLm+E0wkRyY8/A472V4y+Wn1im0Gnyc3+J6
         VUQCn9AAo/+V7ot9kPd9V4XAsX4mP+Rril6fDU3pvnzfWoAGDgDHGMWn+52+tpRLWT9O
         960PoHqngapUcBB9qz5CrQVcv03/p/JNBYVJg4BPt9jhXnRRI+DMNE85GgRdW60sdqEq
         rq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088454; x=1786693254;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TawWsmxD8SDGcsqSwYUOGoy90jC/5REKfiUF4xQzCg=;
        b=UFRQpaDFZaiZ/UT093GCqEquD3pYy/HuT0heJbduJkZKilKJhkmV4D7LdVuYbNuMGQ
         3kqSjaVGg/oDS7qt9p4JxqWlsZKl+TyjW61t86q2+5Ov+zfFE+sCHfNBOfv+Iy/2jZr7
         CzPcFuWICUVt0CUZSuq0J5eYFAZD6FJOw+fjXk3bLFeKkozrG2CRu+l50FVAa72MI+j3
         PVUoXeLzcJXlZomtnMup+xbMJQLlzSRwU4D9XIndOy0zHdjDkDdrlflGpgHxzOOBtrGK
         9n5fH8mK4SVsQL8q+12FQtn9Cwsi4r341vxG/2Gi9lTrNQU5BuLIOZv+1bY+DIhSBCRI
         qW5A==
X-Forwarded-Encrypted: i=1; AHgh+RrYlOprxujIhc0k2epUUSR6D2aQuDeTjuU3nDDEe5yj2k+xT1a98GEZ/MmOMTXjwiHWoPQhnUD4iX3X@vger.kernel.org
X-Gm-Message-State: AOJu0YzEO9YGAMBTG6FxeuMTSbZdB3JL1qkRBo6JADUPQj+5LHjEV+kz
	7PDNNaXahmRWyvN0clS4mSjMvsvouqScvyBnXxkRU/sUOUADHFkIf59wUCdL3Bb8nzO0
X-Gm-Gg: AR+sD13A1XVFfw8RLKUSg9J7UvevyuqDL9xUcFaYCWoKYXxN/5tD5Ugf6X5PAuss+FW
	AhpOPhDsltcO3DZO1EHm3j14UcED9fsDPUNNycmgoiDMc4UpqcFz97pJooVzKl8axut7Fogjwuk
	98E/WIzO6FhD5prFzoeLFJRo5Z6wP2BJj9FxkT/Nh08eGzlehZRF4N0Q/Rwy0rFMEWjpN+qo1Zx
	9vRoMluzFgn0ICCS/m6gW+v6mZpOkMed5uU5A729Ndd6qjgIbBLLL9YbSJjMT8jXu9ks9DCqICD
	/Yv/AZlRzLJgVtLwKNZipZi99JA2Y59hFBxaf0ocAzPHoqzybUHBDGKimAg/j4CwOWbTJ/l+OqF
	9ACfnLFcIVHnWHFElE1/Oy/IIzipKCcBNq8WygQ66Bhi23tncy0r+5nI3FT+mSKw1TkwiT2fBii
	5JAui7qoKu7YJbYWMSx7sOhbXcvOt9sc2M+Ol14gwCUDg61uzboIh6VtIzGTFj2AE=
X-Received: by 2002:a5d:64c6:0:b0:47f:e742:91dc with SMTP id ffacd0b85a97d-47fec4f1448mr31780734f8f.7.1786088453591;
        Fri, 07 Aug 2026 00:40:53 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:52 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 2/6] virt: bao: add IPC shared-memory driver
Date: Fri,  7 Aug 2026 08:39:29 +0100
Message-ID: <33a72238392b1feb519d5721b5aacf693929e15c.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a driver that lets guests running on the Bao static-partitioning
hypervisor communicate through shared memory. Each guest is assigned a
read and a write region within a shared-memory area described in the
device tree.

Userspace accesses the regions through a misc character device using
read(), write() and mmap(). A write() notifies the peer guest through an
architecture-specific hypercall (HVC on arm/arm64, SBI ecall on RISC-V).

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Map the read and write regions from the two reg entries (by reg-name)
  instead of parsing read-channel/write-channel offsets; read the channel id
  from "bao,id"; mmap() now maps per region.
- Drop the noisy dev_info() on successful probe.
- Do the shared-memory range arithmetic in u64 to avoid a u32 overflow.
- Fix the Kconfig help-text indentation (Randy Dunlap).
- Add José's and David's Co-developed-by/Signed-off-by.

 arch/arm/include/asm/bao.h           |  31 ++++
 arch/arm64/include/asm/bao.h         |  31 ++++
 arch/riscv/include/asm/bao.h         |  31 ++++
 drivers/virt/Kconfig                 |   2 +
 drivers/virt/Makefile                |   1 +
 drivers/virt/bao/Kconfig             |   3 +
 drivers/virt/bao/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/Kconfig    |  10 ++
 drivers/virt/bao/ipcshmem/Makefile   |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c | 231 +++++++++++++++++++++++++++
 10 files changed, 346 insertions(+)
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
new file mode 100644
index 000000000000..ba64d1a18f91
--- /dev/null
+++ b/arch/arm/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_ARM_BAO_H
+#define __ASM_ARM_BAO_H
+
+#include <linux/arm-smccc.h>
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
+					 ARM_SMCCC_OWNER_VENDOR_HYP,
+					 hypercall_id),
+		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#endif /* __ASM_ARM_BAO_H */
diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
new file mode 100644
index 000000000000..ab9b283168e3
--- /dev/null
+++ b/arch/arm64/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_ARM64_BAO_H
+#define __ASM_ARM64_BAO_H
+
+#include <linux/arm-smccc.h>
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
+					 ARM_SMCCC_OWNER_VENDOR_HYP,
+					 hypercall_id),
+		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#endif /* __ASM_ARM64_BAO_H */
diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
new file mode 100644
index 000000000000..d2c79a6a4ade
--- /dev/null
+++ b/arch/riscv/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_RISCV_BAO_H
+#define __ASM_RISCV_BAO_H
+
+#include <asm/sbi.h>
+
+#define BAO_SBI_EXT_ID 0x08000ba0
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
+			0);
+
+	return ret.error;
+}
+
+#endif /* __ASM_RISCV_BAO_H */
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 52eb7e4ba71f..cb98c4c52fd1 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
+source "drivers/virt/bao/Kconfig"
+
 endif
 
 source "drivers/virt/coco/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..623a671f8711 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -10,3 +10,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-$(CONFIG_BAO_SHMEM)		+= bao/
diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
new file mode 100644
index 000000000000..4f7929d57475
--- /dev/null
+++ b/drivers/virt/bao/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source "drivers/virt/bao/ipcshmem/Kconfig"
diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
new file mode 100644
index 000000000000..68f5d3f282c4
--- /dev/null
+++ b/drivers/virt/bao/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_BAO_SHMEM) += ipcshmem/
diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
new file mode 100644
index 000000000000..b789e5ea1264
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_SHMEM
+	tristate "Bao hypervisor shared memory support"
+	help
+	  This enables support for Bao shared memory communication.
+	  It allows the kernel to interface with guests running under
+	  the Bao hypervisor, providing a character device interface
+	  for exchanging data through dedicated shared-memory regions.
+
+	  If unsure, say N.
diff --git a/drivers/virt/bao/ipcshmem/Makefile b/drivers/virt/bao/ipcshmem/Makefile
new file mode 100644
index 000000000000..e027dcdb06aa
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_SHMEM) += bao.o
+bao-objs += ipcshmem.o
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
new file mode 100644
index 000000000000..0d46d89ee788
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor IPC Through Shared-memory Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/miscdevice.h>
+#include <linux/of.h>
+#include <linux/mm.h>
+#include <linux/io.h>
+#include <asm/bao.h>
+
+#define BAO_IPCSHMEM_NAME_LEN 16
+
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
+struct bao_ipcshmem {
+	struct miscdevice miscdev;
+	u32 id;
+	char label[BAO_IPCSHMEM_NAME_LEN];
+	void *read_base;
+	phys_addr_t read_phys;
+	size_t read_size;
+	void *write_base;
+	phys_addr_t write_phys;
+	size_t write_size;
+};
+
+static int bao_ipcshmem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
+	phys_addr_t region_phys;
+	size_t region_size;
+
+	if (!vsize)
+		return -EINVAL;
+
+	/*
+	 * The read region is exposed at offset 0 and the write region right
+	 * after it. A single mapping cannot span both regions, since they are
+	 * not guaranteed to be physically contiguous.
+	 */
+	if (offset < bao->read_size) {
+		region_phys = bao->read_phys;
+		region_size = bao->read_size;
+	} else if (offset < bao->read_size + bao->write_size) {
+		offset -= bao->read_size;
+		region_phys = bao->write_phys;
+		region_size = bao->write_size;
+	} else {
+		return -EINVAL;
+	}
+
+	if (vsize > region_size - offset)
+		return -EINVAL;
+
+	region_phys += offset;
+	if (!PAGE_ALIGNED(region_phys))
+		return -EINVAL;
+
+	return remap_pfn_range(vma, vma->vm_start, region_phys >> PAGE_SHIFT,
+			       vsize, vma->vm_page_prot);
+}
+
+static ssize_t bao_ipcshmem_read(struct file *filp, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->read_size)
+		return 0;
+
+	available = bao->read_size - *ppos;
+	count = min(count, available);
+
+	if (copy_to_user(buf, bao->read_base + *ppos, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->write_size)
+		return 0;
+
+	available = bao->write_size - *ppos;
+	count = min(count, available);
+
+	if (copy_from_user(bao->write_base + *ppos, buf, count))
+		return -EFAULT;
+
+	*ppos += count;
+
+	/* Notify Bao hypervisor */
+	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
+
+	return count;
+}
+
+static int bao_ipcshmem_open(struct inode *inode, struct file *filp)
+{
+	struct bao_ipcshmem *bao;
+
+	bao = container_of(filp->private_data, struct bao_ipcshmem, miscdev);
+	filp->private_data = bao;
+
+	return 0;
+}
+
+static int bao_ipcshmem_release(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+	return 0;
+}
+
+static const struct file_operations bao_ipcshmem_fops = {
+	.owner = THIS_MODULE,
+	.read = bao_ipcshmem_read,
+	.write = bao_ipcshmem_write,
+	.mmap = bao_ipcshmem_mmap,
+	.open = bao_ipcshmem_open,
+	.release = bao_ipcshmem_release,
+};
+
+static int bao_ipcshmem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *read_res;
+	struct resource *write_res;
+	struct bao_ipcshmem *bao;
+	u32 id;
+	int ret;
+
+	read_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "read");
+	if (!read_res) {
+		dev_err(dev, "missing 'read' shared memory region\n");
+		return -ENODEV;
+	}
+
+	write_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "write");
+	if (!write_res) {
+		dev_err(dev, "missing 'write' shared memory region\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(np, "bao,id", &id);
+	if (ret) {
+		dev_err(dev, "missing or invalid 'bao,id' property\n");
+		return ret;
+	}
+
+	bao = devm_kzalloc(dev, sizeof(*bao), GFP_KERNEL);
+	if (!bao)
+		return -ENOMEM;
+
+	bao->read_base = devm_memremap(dev, read_res->start,
+				       resource_size(read_res), MEMREMAP_WB);
+	if (IS_ERR(bao->read_base))
+		return PTR_ERR(bao->read_base);
+
+	bao->write_base = devm_memremap(dev, write_res->start,
+					resource_size(write_res), MEMREMAP_WB);
+	if (IS_ERR(bao->write_base))
+		return PTR_ERR(bao->write_base);
+
+	bao->id = id;
+	bao->read_phys = read_res->start;
+	bao->read_size = resource_size(read_res);
+	bao->write_phys = write_res->start;
+	bao->write_size = resource_size(write_res);
+
+	scnprintf(bao->label, BAO_IPCSHMEM_NAME_LEN, "baoipc%u", id);
+
+	bao->miscdev.minor = MISC_DYNAMIC_MINOR;
+	bao->miscdev.name = bao->label;
+	bao->miscdev.fops = &bao_ipcshmem_fops;
+	bao->miscdev.parent = dev;
+
+	ret = misc_register(&bao->miscdev);
+	if (ret) {
+		dev_err(dev, "failed to register misc device: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bao);
+
+	return 0;
+}
+
+static void bao_ipcshmem_remove(struct platform_device *pdev)
+{
+	struct bao_ipcshmem *bao = platform_get_drvdata(pdev);
+
+	misc_deregister(&bao->miscdev);
+}
+
+static const struct of_device_id of_bao_ipcshmem_match[] = {
+	{ .compatible = "bao,ipcshmem" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_bao_ipcshmem_match);
+
+static struct platform_driver bao_ipcshmem_driver = {
+	.probe = bao_ipcshmem_probe,
+	.remove = bao_ipcshmem_remove,
+	.driver = {
+		.name = "baoipc",
+		.of_match_table = of_bao_ipcshmem_match,
+	},
+};
+
+module_platform_driver(bao_ipcshmem_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor IPC Through Shared-memory Driver");
-- 
2.43.0

