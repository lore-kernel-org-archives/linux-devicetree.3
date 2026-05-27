Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D3C383C95
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 03:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852698; cv=none; b=aoc6FhkVkokkkGkYwj0gI2OaL+GeNY+1DvLP9GfLhmHmy2FuklTFWfdmdE1xawt1KxtACkd7sL57Rt9qzF1XsaaHElPf5XgpYN0/qfDJlFFwh74dWt+NVw4IiRAyalSsFoNnu57dlpwFx3Z7tibgoKt0+S/dPYqqJjbcm9HSsGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852698; c=relaxed/simple;
	bh=uLOeasSEYWAvpT8ERSE9h3DlJwiheu4obyaLXpGYn9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScOD5/iVhuQjpSo7a9EnPawNN1hkKARyp7vgN0BPNoTUchMl/vgRXLuyRMQ+WkKJQmLUckdo/qZN2mGs/PXh+fqRTQm8uLOL9n0bMdI6jdZ/GxgT+qxJ1nR64TW8ZinB2zsM6N5qI+jIH1GSxStKecL5w4M6KNqQX8PF7TgKVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjNjs3GJ; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjNjs3GJ"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8419ab3a297so1122871b3a.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852696; x=1780457496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=fjNjs3GJAwN+lm0g8UqZB2nwneR2WiW9IpCRJYzVJIro/LNpvfEInu3+Mh3DGGEEUD
         iw8qodwRymampC4PR2mp3rAeLLFVZT7g6jmQVhI+4RipFPJaPAdNSJfAJkHAWIyw36kn
         GjG5gA3j2XprMK2vWCYbl0ObB11FcnWwyqqgYBHdJG4jfEFofEWVD76S3fkm8yyKgPCd
         2VWy3vvrepSgJO49t7t05QfH7zNp/4KtzlFfFHSYp1zD+7tz4fwZhdmOZRsFIpPiO2Bw
         ACSVM29XXtYxunb13iTkpeSE9OUslqJGhRmWRMsPjKt+5MaAJSMLPfcSqsg/RScHsfEX
         oL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852696; x=1780457496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcszoUDc7316A03Dx3QXGOd8FcU7DWvjuNUEWPnVcI4=;
        b=SJXXHoPhU27B2+dDHsarTKxI4oj9zsbnrNSjJaceOf/4B/tVo8uHdAB60BMhO4ad+K
         op0cX/UZYmcTs4ZXdQZlUC678Qn6SHMgOLa+wgwPtKlx4YVNlFSX2hKOwnpwsxN/9nZi
         vxPc8nURXLGNW2wirwoqbguPiFyQyv3HKsDAJGoOW/RInJ6O+Es8zdO0JaDIfoa8NGbi
         3Er65Bgf0ZIb+6tucSkgoVOAcT/4vE0igDNkcKiw7/ff2wFzOcPDTDSIv01jRnMBE3xL
         zJFZigZhKh67jzg4JnWCKgw0RWLTu0gehtmq/4jiX4ghXWFBdbXf6rm1FG2jmVrxLAqs
         7qDw==
X-Forwarded-Encrypted: i=1; AFNElJ/Ir9OHo96XQRyuC6fBkE4u7/TtO16dGxxxHvqA5hxbSktpPLaSmtU+OgZJ7GrYTUXjdS/NTw9k3zQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDm0c39Er7sn2qBF4l7fRHdqGys+SONNop3VlXUQi0q10WGMw
	LK9L01w1V43d4SHtUgIkTMOKG9oeqQOJpGRD4CU+tM4vaPCwCXhl4nRa
X-Gm-Gg: Acq92OGePs0s/58MPUzyctrOZeM1nP71lJ3VT0020xFzeGci2PU/1k8I+n8mrVvqd1g
	WXAqmG8eydXagtHrldVF7i/9BT+1PLKOJf/Ex0lHKpICznG3uZ+D3VP0fuih07vzZkHbHnlv1RJ
	LAFcsdkJDhLIknNUCob4ZlsLVrM2lw5HDz3oRhx0QPXvmYvqy7q5ED63LFkx5OA+nsZaq2bn7GT
	DADSm4NWOpVj/KfJuZliwTZC/0g+uy6Tq/4lGyj/pHhCUSwcrMGXhXKdRGC+JtK6QK5G2mZGBXD
	GIWauWacJzbYFbybF2MCro6aF3ks8PlNcsc8a5WF/OBKqGNv1QkaM7dU/WeLH+fjsGmLO4KuGRa
	xIKWrQvaZmTN6hAmEeMbkBwcr6ywD2zqg8WuRWgYVIpNc0w0SdeZXgIxpoLGYKnlaA3M7qUAz7z
	tfCazaB45PhqC/sn3YaMm8qaUwhTI88Ub1wEnWEiLgiEU/WKAMTWn3hO2KtA==
X-Received: by 2002:a05:6a00:3a0d:b0:837:8c8f:8f51 with SMTP id d2e1a72fcca58-8415f3bdb92mr20798104b3a.47.1779852696430;
        Tue, 26 May 2026 20:31:36 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:35 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 11/11] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:17 +0800
Message-ID: <20260527032917.3385849-12-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..4b918c3d4a28 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

