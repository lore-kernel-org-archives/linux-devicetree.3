Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF24A99B6
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637240; cv=none; b=YYLYww71BIU8W+wC1pRA/O6v4elakBMeh+S4stIqu8A71+5cIK8q2xKMTgRGGAaLv5WMWruJqkJ6f2NDUnbg1J4vgZRiDeScBd/D58zFe8Gs4PhpyqBpW/4QcmLSeqPnjipdR069GjtqOX0mdO2ePhavy7SgOQAVnK3d+a1sSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637240; c=relaxed/simple;
	bh=QzDIBx2QJ/WoHugMHP+vYhAOaeLSx0YONeE1rWBUfBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxSZg2bwc2mFk1t0xgvZ3x0tJqqVCij2w0iFaABZST4Dvc6H3b4nfQ+dAb7thnCp8/mp+orvOmQBxelL7Mux8GXrhOHs6YT2LsSvFL1fdVn9VSdCgLODHtWqI23f1UnCXndBa1UPrKUW3hy62f+O5G/WN5AqFLsUMqOUTzCVo+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpM04sCC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpM04sCC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso4450215e9.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637233; x=1792242033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=NpM04sCCCPLWZdVw0eUrFJqqUsojpxZxSPnNIy1Fq2daaWNWEdnwl1j9MT5Whx4ruP
         t9oFxTHnnsysURxUEo46TqTmMCig84Yi/H8bmL55p8eEEqo79g7JIbHuZVIFhc+2YzbO
         6rLNYb8IP1+RrDpNzmEU8aZkUYJXT1+engFWo75O5NaymXtoDF2pHNpKkSXjjP1h/7eV
         dRErh459jegoFWQbKgWDuwcIYmjNIEwzGIPsyS8e8/AeZvYKR8W7c+0kajKFl5dVrQJ2
         lLF7gjoBmPa4ivQSwPe0zgkKyqqexeEZpmG0h8g+f/ESzXqBmTqoWHCO/CUNHnXCD95n
         zwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637233; x=1792242033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReH6zdN/Scg2OvBXNd4w2aYQz49a0qu9tqAasA+lUVk=;
        b=KOjPdBne5aGg//GmkjTEWHnDsVd+wx6H1vjW5zuYFh3RThpqyXJrL16FbBJG1osg2q
         nEuPOfn0UtySICe4MYHpX8GxUH5lGixH8tXnIOKbI9O8AdjfWUHtiwQGCv5e+0mp4efk
         Eb2JGdhmFvpOhKv78temVMkKwl9LpWhTGcDmB3P9hAY6jLJzjmf/Gn8P7v0ptia2dnUF
         IcpaCVKWsfbcqC0GqmOWpngE7ogGCPt00Z8P3vLBD1yWklGeSI08YaSS9FwhWLRiWToS
         yMGoZ60pQlBGDS24EOf9lbirgTj7SKw/FqeOtJZsUHozuMjTWiMx5x3B+6lMEjDCQZPC
         zKEQ==
X-Gm-Message-State: AFq9FYLwmER3RWoH/DmOzKL/jDVQteW3hPzzSkagNHGFifbhyALMrURd
	vo1Q7Abv1cLM6NMKMPoJVbqvs9KUWNb1rmavkEFSPEjM+6A1AraZLPpM
X-Gm-Gg: AYBFou0m/bvQ+Ze2KBRKHsbIZ5AbluUYQQVo5SLXEref9EeKlDVsjnuRy3YR1mphxBt
	F6uw31S2tAcJDjBqjIUZL88WcBVLsmEntV0UC1/sgbj9IU9NOjfyq/GMiAgVqeN9Fd8JA+yS2zu
	tgScNypdcq1k3NdAc2Kxg7K2CDhLOrhV27k1ur7OnjUljuKRi/z72oNu6ms+2BPBFyM4jWPNr7u
	xeLlgfXrjUTwFXYdoNAEtcWCypNRcFV4W11liu9yTYH6gaUwkqAoIFCaJ/VVmtwJXVszJc4T7av
	Udq4yPLC9Bw1DdvAQoTkfzY7tWQc8W8n174Kdxs7wiqPF4Dq/X4wtKDe4PrdLHzTrZaW1gteEO0
	2mF4ej3SL94es7433BCRygIX94cBhGDF2rByv44pZH9rg3rynfw5GTuQx+fkPA+Gi9tLaBcf1UT
	GmbE6RFlA1x9O4OaNV3jOyi3qlwyOcncBg2pTKOv0tlZShAV3NdwRGTAccTlJnV47aN0T2axQ54
	yzbc34ZchXKtornE/Ue3kPLhQ6VCs4oQcOOmNKkZDEtM/CxtsOwwJDkVq8pAPJM4kbCISUYd2hM
	zGPPr9ehQrzyxz8ODzIweuqCKHKJVzXbykWXExElAddbCjsF0SbcII9rphgLxeGTjU6leLAv
X-Received: by 2002:a05:600c:19cf:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a18e4a988dmr80690785e9.13.1791637231769;
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:31 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 13:59:40 +0100
Message-ID: <20261010130024.177503-3-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide the optional lock used by the tested ZX279128S workaround. Lock-
off experiments hung the board; the proposed API remains subject to
maintainer review.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/include/asm/outercache.h | 22 +++++++++
 arch/arm/mm/Kconfig               | 14 ++++++
 arch/arm/mm/cache-l2x0.c          | 81 +++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/arch/arm/include/asm/outercache.h b/arch/arm/include/asm/outercache.h
index 3364637755..cf9552aaac 100644
--- a/arch/arm/include/asm/outercache.h
+++ b/arch/arm/include/asm/outercache.h
@@ -117,4 +117,26 @@ static inline void outer_resume(void) { }
 
 #endif
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/**
+ * outer_io_lock - serialize a device read with outer cache maintenance
+ *
+ * On some SoCs a device read that is still outstanding while an outer
+ * cache range or sync operation is issued deadlocks the interconnect.
+ * Drivers for devices behind such a bus take this lock around their
+ * register reads.  It is a no-op unless the platform enabled it.
+ *
+ * Returns the saved interrupt flags to pass to outer_io_unlock().
+ */
+unsigned long outer_io_lock(void);
+void outer_io_unlock(unsigned long flags);
+#else
+static inline unsigned long outer_io_lock(void)
+{
+	return 0;
+}
+
+static inline void outer_io_unlock(unsigned long flags) { }
+#endif
+
 #endif	/* __ASM_OUTERCACHE_H */
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 6574659dfb..871c38b435 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -1015,6 +1015,20 @@ config CACHE_L2X0
 	help
 	  This option enables the L2x0 PrimeCell.
 
+config CACHE_L2X0_IO_LOCK
+	bool "Serialize device reads with L2C-310 maintenance operations"
+	depends on CACHE_L2X0
+	help
+	  On some SoCs, for example the ZTE/Sanechips ZX279128S, issuing an
+	  L2C-310 range or sync operation while a CPU read from a PCIe
+	  endpoint is still outstanding deadlocks the interconnect.  This
+	  option lets the L2C-310 maintenance operations take a spinlock
+	  that drivers also hold around their device reads, through
+	  outer_io_lock()/outer_io_unlock().  It is only active when the
+	  cache controller node has the "zte,l2c-io-read-lock" property.
+
+	  If unsure, say N.
+
 config CACHE_L2X0_PMU
 	bool "L2x0 performance monitor support" if CACHE_L2X0
 	depends on PERF_EVENTS
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 4708671600..35cc2eaf85 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -48,6 +48,7 @@ struct l2x0_regs l2x0_saved_regs;
 
 static bool l2x0_bresp_disable;
 static bool l2x0_flz_disable;
+static bool l2x0_io_lock_enable __initdata;
 
 /*
  * Common code for all cache controllers.
@@ -778,6 +779,81 @@ static const struct l2c_init_data l2c310_init_fns __initconst = {
 	},
 };
 
+#ifdef CONFIG_CACHE_L2X0_IO_LOCK
+/*
+ * On some SoCs (e.g. the ZTE/Sanechips ZX279128S) a CPU read from a PCIe
+ * endpoint that is still outstanding when an L2C maintenance or sync
+ * operation is issued deadlocks the interconnect: both CPUs stall and only
+ * a watchdog reset recovers.  The vendor kernel avoids this by holding one
+ * spinlock around the L2C operations and around the drivers' device reads.
+ * Do the same when the cache node asks for it.  Drivers take the lock
+ * around their device reads with outer_io_lock()/outer_io_unlock().
+ */
+static DEFINE_RAW_SPINLOCK(l2x0_io_lock);
+static struct outer_cache_fns l2x0_io_fns __ro_after_init;
+static bool l2x0_io_lock_active __ro_after_init;
+
+unsigned long outer_io_lock(void)
+{
+	unsigned long flags = 0;
+
+	if (l2x0_io_lock_active)
+		raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	return flags;
+}
+EXPORT_SYMBOL_GPL(outer_io_lock);
+
+void outer_io_unlock(unsigned long flags)
+{
+	if (l2x0_io_lock_active)
+		raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+EXPORT_SYMBOL_GPL(outer_io_unlock);
+
+#define L2C_IO_LOCKED_RANGE_OP(op)					\
+static void l2c_io_locked_##op(unsigned long start, unsigned long end)	\
+{									\
+	unsigned long flags;						\
+									\
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);			\
+	l2x0_io_fns.op(start, end);					\
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);		\
+}
+
+L2C_IO_LOCKED_RANGE_OP(inv_range)
+L2C_IO_LOCKED_RANGE_OP(clean_range)
+L2C_IO_LOCKED_RANGE_OP(flush_range)
+
+static void l2c_io_locked_sync(void)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&l2x0_io_lock, flags);
+	l2x0_io_fns.sync();
+	raw_spin_unlock_irqrestore(&l2x0_io_lock, flags);
+}
+
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	l2x0_io_fns = *fns;
+	if (fns->inv_range)
+		fns->inv_range = l2c_io_locked_inv_range;
+	if (fns->clean_range)
+		fns->clean_range = l2c_io_locked_clean_range;
+	if (fns->flush_range)
+		fns->flush_range = l2c_io_locked_flush_range;
+	if (fns->sync)
+		fns->sync = l2c_io_locked_sync;
+	l2x0_io_lock_active = true;
+	pr_info("L2C: serializing device reads with maintenance operations\n");
+}
+#else
+static void __init l2c_io_lock_install(struct outer_cache_fns *fns)
+{
+	pr_warn("L2C: io read lock requested but CONFIG_CACHE_L2X0_IO_LOCK is disabled\n");
+}
+#endif
+
 static int __init __l2c_init(const struct l2c_init_data *data,
 			     u32 aux_val, u32 aux_mask, u32 cache_id, bool nosync)
 {
@@ -859,6 +935,8 @@ static int __init __l2c_init(const struct l2c_init_data *data,
 		pr_info("L2C: disabling outer sync\n");
 		fns.sync = NULL;
 	}
+	if (l2x0_io_lock_enable)
+		l2c_io_lock_install(&fns);
 
 	/*
 	 * Check if l2x0 controller is already enabled.  If we are booting
@@ -1198,6 +1276,9 @@ static void __init l2c310_of_parse(const struct device_node *np,
 	if (of_property_read_bool(np, "arm,full-line-zero-disable"))
 		l2x0_flz_disable = true;
 
+	if (of_property_read_bool(np, "zte,l2c-io-read-lock"))
+		l2x0_io_lock_enable = true;
+
 	prefetch = l2x0_saved_regs.prefetch_ctrl;
 
 	ret = of_property_read_u32(np, "arm,double-linefill", &val);
-- 
2.55.0

