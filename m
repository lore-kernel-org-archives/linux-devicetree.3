Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63536A35D
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765104; cv=none; b=IbaoNCvFhw+5GzgpfarOauj/2Ifon0Knz7dYIO46DjUKfAeuYfQNRxRph0ZPuijSKqhniKtyit8FYePIsn4LKUMk/Payuo1MS32glIy0y6J+vcKoZNhNbJYqRZqxj7JprBnfAsOL8EwvwwCxIw4G5VRaylQscunM/2kznbfM+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765104; c=relaxed/simple;
	bh=CLq0XW7D8ZfFbmFAIkl6bnfBIR9Q+TvKysOSDQNh9+4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C/GXCfz7QH3fDj+QxTPTdwp6z1GkF1kbQqt4C5gXX7b6rmmoPWv27psUNmwev2/lHNDXNOsHThP26UnXxX2IyjeGkseHJhaOob46Ag128tsH5PcObNAzBHLspYO2OEfqh7+UE9tZDOeFcljFgFIEinO3FEg1cVT3taHJkMmOb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iCrR4fqa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iCrR4fqa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso5485155ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765103; x=1782369903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzlsDUhDCE2mtUY94SqShY/BDngOyXGE2SVh1DG2jr8=;
        b=iCrR4fqavVN44C76ISG+TK9eol2DpUQSRJymH7vK1PWBM357xRWRVTtd3LQgwFoAv3
         L6t2jCxgz39r60CNvGzTdYg8ZVE5Vc6eQ7L2jmQCyz9qIVC4iaYq/vmvwsQQnaNwfKGf
         GH1KnJLbANHrLiju7CF+6o3bVhHUA6Sz13/Gc8SGkASmlJqcLvCQcpCc7R0fUgp2CqiF
         GLB0bt0f2Bdyns+8MfGylE5QESio2eeMxufd+9ujORiJzN1OWosIwLLgRpUvDwOSVmBY
         smcpa3WgSRAp37Od9q7Ya2IJ0omSdpktNPa5+n586XFpqoVQqrfJNNhCffjEU5Hpk5sl
         2LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765103; x=1782369903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzlsDUhDCE2mtUY94SqShY/BDngOyXGE2SVh1DG2jr8=;
        b=EGBSnf9IqlwgJnLTQRk/1STzWw6hlU36GnwZq7JNXoFh8WUBMjqWVuIZzcFGquiJVu
         VO2DRCBSNFQTfYAbMZIm7PGPRi9r8RI5w/uyKmQidwMeLSXepE8AWWI/jYb0KLW/dHm3
         w9DpMHLgHovnUW/dtQglXkeelmDrMQIFvPKUZm88MuGgxWFXEyd5U3osmp+Q4S9qS/r5
         p1SMBuCBon6hi5CpzuA0upgcdj8GpWNlKpFBZGcPpnVDzZLVmn5tALoyEhtRDzH/OnXw
         Q9HEJaP9YBmqsU2W1CB4kaN8VFyuKiu/MyDLhuasSyMwOqDTvJjh4QgjtZd5Fh6FznV0
         IoZg==
X-Forwarded-Encrypted: i=1; AFNElJ99RGZqi3WA3RtQVYLpK1W2n/Fx4LW62jnh/+isXdUYrvtERxv2EmkPd7stzlWJb1n3BHj9cIQA4eTe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FgBT2RbDg4CQqI1+d7IvB8blBQ9AQp59YfTLt526vVdIpS8v
	sBUvzrp1Wv3yGSc0QWGbixQ3ZurqsLfLS4sPPWQxjW9V0cnkj4hgbZ88HvvMOgyB8/E=
X-Gm-Gg: AfdE7cmhrRjzk2FQMy8Q7tgRzOtxibijVRsbJMaEA2TM+8LLVa8lMh9ZOLD8R0JhArG
	goJ2xajmNVvFC1Gp1o6FmvJux4w5e+zsc6hGjnWg0RExfpEB/k4QwA/kwvBBWvICJfl1JFLbBQ9
	NIIKrZgWvj6zggGiua+E68ZlwysT2ZpvzKP9uoD3O2mTMhMeGTi7rAyjeGBNyzneMFzkKTRNfnB
	qiSJqanJX8/7bYo+1fc6Yjk2TY3G1sAK+AlqQagvXwbj7J2U6lg/N+7uwqX6CdfHts1ekHXb3dQ
	65Bhs8YJtZXS8Tlz82MQNgauvQhBqSWzSDWAYtWRfuFxnQRzxTxI1tAqtZqnr1rGtqo6jqFXXU+
	jH2X8XH/JaflThFGALwzSzsEfyvwITdjpLH2kkbza3fF6yT14YDlYGFLfKNkDL3QyaFvkTTUhsp
	gPCSEApClnBhrJnKLZPKudGkN5z6grxOTXe3wxtHqhnewZNg==
X-Received: by 2002:a17:903:2b0f:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c6bbf98e47mr79277795ad.8.1781765102639;
        Wed, 17 Jun 2026 23:45:02 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:45:02 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v4 2/3] riscv: track effective hardware PTE A/D updating
Date: Thu, 18 Jun 2026 14:44:05 +0800
Message-Id: <20260618064406.14508-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Svadu being present in the ISA does not always mean that hardware PTE A/D
updating is active. When Svade and Svadu are both advertised, Svadu starts
disabled and must be enabled through SBI FWFT before the kernel can rely on
hardware A/D updates.

Track that effective runtime state with a static key. During init, enable
FWFT for all online harts before setting the key; if that fails, leave the
system in software-managed A/D mode. Secondary harts must match the global
A/D update mode before they are marked online.

The full state flow is:

                boot init
                    |
                    v
          do all CPUs have Svadu?
                    |
             +------+------+
             |             |
            no            yes
             |             |
             v             v
      hw_ad key = false   does any CPU have Svade?
      requires_fwft = false       |
             |              +-----+-----+
             |              |           |
             |             no          yes
             |              |           |
             |              v           v
             |       hw_ad key = true   requires_fwft = true
             |       requires_fwft = false       |
             |                                v
             |                         FWFT on online CPUs
             |                                |
             |                         +------+------+
             |                         |             |
             |                      success       failure
             |                         |             |
             |                         v             v
             |                hw_ad key = true   requires_fwft = false
             |                requires_fwft = true hw_ad key = false
             |                                  fallback to software A/D
             |
             +--------------+-----------+
                            |
                            v
                       hotplug CPU
                            |
                            v
          if (!hw_ad_key || !requires_fwft)
                    |
             +------+------+
             |             |
           true          false
             |             |
             v             v
          return 0    enable local FWFT
             |             |
             |       +-----+-----+
             |       |           |
             |    success     failure
             |       |           |
             v       v           v
          continue  continue  return error
             |       |           |
             v       v           v
       set_cpu_online()     do not set CPU online
             |                   |
             v                   v
          CPU online        CPU bringup fails

Thus, an online CPU never runs with an A/D update mode different from the
global kernel state.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cpufeature.h |   8 +++
 arch/riscv/kernel/cpufeature.c      | 101 ++++++++++++++++++++++++++--
 arch/riscv/kernel/smpboot.c         |   4 ++
 3 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..ba3d74f6006a6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -128,6 +128,14 @@ struct riscv_isa_ext_data {
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
 extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
+DECLARE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
+
+static __always_inline bool riscv_has_hw_pte_ad_updating(void)
+{
+	return static_branch_unlikely(&riscv_hw_pte_ad_updating);
+}
+
+int riscv_enable_hw_pte_ad_updating(void);
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74d..c0ac7ab39d4e0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -15,6 +15,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/smp.h>
 #include <asm/acpi.h>
 #include <asm/alternative.h>
 #include <asm/bugs.h>
@@ -35,6 +36,9 @@
 static bool any_cpu_has_zicboz;
 static bool any_cpu_has_zicbop;
 static bool any_cpu_has_zicbom;
+DEFINE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
+EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating);
+static bool riscv_hw_pte_ad_updating_requires_fwft __read_mostly;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -287,15 +291,100 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
-static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
-				    const unsigned long *isa_bitmap)
+static void riscv_set_hw_pte_ad_updating(void)
+{
+	static_branch_enable(&riscv_hw_pte_ad_updating);
+}
+
+static int riscv_enable_local_hw_pte_ad_updating(void)
 {
-	/* SVADE has already been detected, use SVADE only */
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
-		return -EOPNOTSUPP;
+	return sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
+}
+
+static int riscv_set_online_hw_pte_ad_updating(bool enable)
+{
+	return sbi_fwft_set_online_cpus(SBI_FWFT_PTE_AD_HW_UPDATING,
+					   enable, 0);
+}
+
+static bool __init riscv_any_cpu_has_svade(void)
+{
+	unsigned int cpu;
 
+	for_each_possible_cpu(cpu) {
+		if (riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_SVADE))
+			return true;
+	}
+
+	return false;
+}
+
+int riscv_enable_hw_pte_ad_updating(void)
+{
+	unsigned int cpu;
+	int ret;
+
+	if (!riscv_has_hw_pte_ad_updating() ||
+	    !riscv_hw_pte_ad_updating_requires_fwft)
+		return 0;
+
+	cpu = smp_processor_id();
+	ret = riscv_enable_local_hw_pte_ad_updating();
+	if (ret)
+		pr_err("CPU%u failed to enable hardware PTE A/D updating: %d\n",
+		       cpu, ret);
+
+	return ret;
+}
+
+static void __init riscv_disable_hw_pte_ad_updating(int error)
+{
+	int ret;
+
+	riscv_hw_pte_ad_updating_requires_fwft = false;
+	if (error != -EOPNOTSUPP)
+		pr_err("Failed to enable hardware PTE A/D updating: %d\n",
+		       error);
+
+	ret = riscv_set_online_hw_pte_ad_updating(false);
+	if (ret && ret != -EOPNOTSUPP)
+		pr_err("Failed to rollback hardware PTE A/D updating: %d\n",
+		       ret);
+
+	pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
+		error);
+}
+
+static int __init riscv_hw_pte_ad_updating_init(void)
+{
+	bool requires_fwft, has_svadu;
+	int ret;
+
+	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	requires_fwft = riscv_any_cpu_has_svade();
+
+	if (!has_svadu)
+		return 0;
+
+	if (requires_fwft) {
+		riscv_hw_pte_ad_updating_requires_fwft = true;
+		ret = riscv_set_online_hw_pte_ad_updating(true);
+		if (ret) {
+			riscv_disable_hw_pte_ad_updating(ret);
+			return 0;
+		}
+	}
+
+	/*
+	 * At this point hardware PTE A/D updating is active for all online
+	 * harts, either from boot or from the FWFT setup above. Later harts
+	 * must do the same in secondary startup before they are marked online.
+	 */
+	riscv_set_hw_pte_ad_updating();
+	pr_debug("riscv: hardware PTE A/D updating enabled\n");
 	return 0;
 }
+arch_initcall(riscv_hw_pte_ad_updating_init);
 
 static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
@@ -584,7 +673,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
+	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 8b628580fe118..4fe62f96bcca2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -27,6 +27,7 @@
 #include <linux/sched/mm.h>
 
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
@@ -221,6 +222,9 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
+	if (riscv_enable_hw_pte_ad_updating())
+		return;
+
 	if (has_vector()) {
 		/*
 		 * Return as early as possible so the hart with a mismatching
-- 
2.39.5

