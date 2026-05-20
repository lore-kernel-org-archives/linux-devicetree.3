Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684003B6BEE
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268816; cv=none; b=t8cYjG8hq33wYpsFYt6fIfDY4ljMweFJpPdB6/zI4M9LDLEzGFvDUPVpLAXe1mkaTj5SbjQjDph2EGPsZP+GHXmAOfN6r/AOHD/LChsgXKaDjDN1KcHdMPV6XFD+dIz+UbC5HVkZyzD2PUlvlG6JY8thKJgnrkpdEwfdva4iGXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268816; c=relaxed/simple;
	bh=tykyc4F6DdCin3fut0O+1NMZ9opVL5h+xA3WkGtbPlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frTuCmCR+lfTAAEvysfsPZcKbvA41jghTfX/Zu/Xxg2pHrwIYj8sJxGagyeyDy/4peWPYknSxCBriiUi8091OA+Yd/9hMQ3VGmxjOmMnqrG811w99JO6V21uHq2CzVO3KmgxOYFhtev4v6isxP/hdiicp8lBsHydFQMh1oX1a/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRa4+0Bh; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRa4+0Bh"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-83d5bbef760so1952731b3a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268813; x=1779873613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=IRa4+0Bhg051i2FZirMci8CSAsqqxdsUOU1OH8Ij+JJrNcjllHOKaxTKN81K3+IU7j
         yfT4uM5LSQhFSOxWKW1z6H0mFtpNklXj/26VL5L4u/C2adlVglhLjdBfj/UF4l6FgMC6
         U1a5Rryy7BzS3ulyxMBW102L9zcbRPJOcemzWw7r6fTwfE4Zhjh6WblFgJy2rYc1XRLA
         GDJLs40aiLwWWM7sr1k4DP1E1Vhmei8RW1Hxc+We1SkISPZbmY+MeGwRrrYx3+XW2KpU
         jr5l2zx3pbihGEqm1cGQ36YC/kdvrLK6kiIZC9HzAaqNbT9Jb7e9ClfzwULTILi5VJE0
         Ye5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268813; x=1779873613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qTVbMKm3/twtkQTkDovvFEvZk7HsMSG4qE1A6oaHTA8=;
        b=Ck9uEjPqlqC7yklANdQvUldLWg+4tMTt9+7SNjSza37h0gQzWDOz9cEjh0HYZE2+r8
         1kbXcYkXepVtA11vdf9GscvGFL7VtqxNH2GRTFAbwEMVutVjXigXxWbZD3kj1eh3Tpmy
         juzhS4RRk28S5BMjLLxhbTqAFXERRtlFJzkaq3p6Yi4ctwQAhCfwmIqfy5LppACRL2xI
         Z4tIrYFs5us/4qTZfc9otostrwsctG1+3QMJkkToRQWedTUmjJ9jhwt98bmbZ2JsJygy
         MO87PQPODffJTZB/M4BohvLoKYT6P2g65BSNx+j6FRFirh13CMddWLQOnH6EE092L0vY
         /f+g==
X-Forwarded-Encrypted: i=1; AFNElJ+M/w9bjiv8irIXwNn6mXKIajDTBMZv/7LR6f9HGuaeUipNjLXdGPy2Y0w/kE50dwRpSMeEcXN+BRGY@vger.kernel.org
X-Gm-Message-State: AOJu0YytvbdbGgYcyH38lsWabjuCJxlwF4jHLNs5ihIKkAAmKKuEAMg4
	gdouhcipvE4HRs724ocDuRxQTxLZB818Xchs8oeuE9r5Imi+yQ8nqtmd
X-Gm-Gg: Acq92OGGD9z3/A4PP+UlbhbxFmO0gJxFsSPYiDBPpkHd4TuV99WyHnxd9XcOBvMDgSw
	daxJqYnUk5WK4t0VEvmVgaUjYdeJw289X8YrDYtduyA3z3WlwqsVBdATN1UVIUe4lQGjFLy/GcZ
	1XZgPx/9+5Wz710Qk5N+T/NsiL4w+E93r8UaPoE4AerJnpgHW5rbXCH6gpnmhIPgy3vGjkhyvt1
	+Ha7tpdg4DQXOxVdGRdDmqbmdLApIneGQ25TyWi2oaqr8+L1Hy8EoPImykabek6ZpUReGgXVsC1
	cLdMebXyyfFsgb28bRHAilQcszhj8O0sYXUqxG7/3tTZvr+KIHX/Rb0VsoRE0UCbevW3kSKFOVL
	IS5fJli9bwlxQEGpnG9xGETg+LX0FWcNOGnLEFbnkCXHBJafF/DgkopltnqZC3LVPeOo3RIcXDN
	ALgticr3sleHUTm2uS8lo7cTNaJzWAW6NHaFN3M8Vh31sEinLZ
X-Received: by 2002:a05:6a00:2295:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-83f33d547ccmr23996834b3a.39.1779268812696;
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:12 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
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
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 7/8] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:43 +0800
Message-ID: <20260520091844.592753-8-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..c359cf714c79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0

