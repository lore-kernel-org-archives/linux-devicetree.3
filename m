Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897241226E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428866; cv=none; b=KOrwLguZIiBfoNlEiXbqdoQeVhYPRLiVirZfn/TzLdI2h8brrhkfgxgkxvcvA9Ni6VqfYQgRVtVJlO5aEL4mPeWcQz7rfEBo2xtahbhhmfWz2dLNB/0+H1HLx3hzLxMxLEwtTvFADli2wtp4u+RbJV7l9YShDD0SswR7CUC2WXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428866; c=relaxed/simple;
	bh=vIrR6RiNfaEMyvLmoZz63np42ffEcnhsXG50Az0tj0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bDxbNi/nZLvGfFtBn0tFa11Zfl3ur5zk5hZtc49FbI1GZEOw2GgZ5ruP5vZX7V/ZDed8zWfu/lCYw5bqifB7xiADpaGZlVFOnAtXZoHCAgwlLYFLwN0Dg/P+HGsgmRuUo2NvvJBIe+U7leW06jCTJnkHnxMyCvIIDsJkhZAq+7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=fn7+EIdM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="fn7+EIdM"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3558870a12.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1783428864; x=1784033664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2+9wI7QJ/pqWECxFNZ2yWeT95DuedF5MMaqTIHojtM=;
        b=fn7+EIdMYiI/XEOZK413dsVl5o+Fd2Rbhc9CBgNwO9pvgTvZvAyIPcxYYmEBv32u7P
         DTI1N1Bx5BQB/BGEjCQMjAaX4CD290OAX76m/qqnFSTYiHxawQJiVCgXIE5IitvXT69R
         JpXoqOpdhCWs7B6YoC3M0lngpMKwDmfivTTXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428864; x=1784033664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2+9wI7QJ/pqWECxFNZ2yWeT95DuedF5MMaqTIHojtM=;
        b=QIArq8TCd/WYkafjeC0mXL1wVPiK7fTUYjSwQOT5abNPt3Fx/Dmd32VjXHI49ZP0BN
         bDyqIRgsgKCNbd65RtjM1lf5LMN8XJX30BJzRRFNdkvuDifk5w1iWEncIs2e327ZRthO
         gOTImvkjfFCstCHx0XrkohCV3YBX3FQxy77Ngw2PwKgSntWFY8AYzTZ2HO7SsuzihhDg
         Afc9qFtyd/8Xs3QYudFgOEOPapj3oKgdONHfqcPnOSAopq16Svd4X0bArp0MXMhLQ0jB
         Rv7uiEsqSo+U8oEgGuY5WN3hINCGPpGT27bD7+/yrxK2JPDTVcTyMJOhfMAaivhhgU+Z
         xxgA==
X-Forwarded-Encrypted: i=1; AHgh+RroyE/i+A6KQF7JPtXmPS1oNYS6IvzqEycYdEPycN6FHGxlOdXS4GUZ/rcNrawK6/EaLsxl3o4qgu69@vger.kernel.org
X-Gm-Message-State: AOJu0YwJfD1VU8hJh/id6TIwRAX9SizdWH24WQK/Rp0rBqG3AWKx5v86
	/exBX7sWvo1hA8gD560vCIqmcoCwMckjv4cuTGoVrCI91b5PrTGi3OgULOXkTBPErHQ=
X-Gm-Gg: AfdE7cnPQN7DRRo9/wF34Gbo/1iy+KaO3QzF0AkMSBEcwlU2kAWPDVX5tmbrdbuzCYd
	nRdQwJDDdTDUDs+n1ThiRHsCvs/0QRe23LUMLofQ1bxXaW97c/N89RW3Nyd7WsTOz0byyr/lmky
	/b0mshdeH8UvATvrYnHN/ESXr99MP/1EWuvsvtarMjEVj/hx6fd/t+IqrAs39imFrTGj+2q5Wgu
	wVIUIcWvUEQ0OtSC68IklEkM4xy7fPrd/4xa0X1cssEHKjNYWleoKYMM4E87EqVphnf1FzmNdWH
	okxO19AmjLZoOQQVQbK6/trfa2xOlhtSIkwIxuINT74lR6VOuhDMmMY4T73hhBNliQtdlf69oJj
	bH4Udc3OLpIbqW5oHQF1AgGeRIi0L7upITHGVCVHTx9rTcbDmgFtxYScnhKCPezUD8eC9ZSOYzL
	JWXzJ2dAEiK2ef6q2/rgLU+d+saqhth9Ilmk5A812l++jAOqSygRRLvuVB7l/g+2jmUEbI9v7dw
	w0zQDe5/E8fuZTyoMy/EnLBJD3lslb/wLdnfL2oYTUfGywlPcxqmL8DBxnaCjFfb4Q=
X-Received: by 2002:a05:6a20:72a3:b0:3bf:e449:332a with SMTP id adf61e73a8af0-3c08ec76882mr6365583637.3.1783428864494;
        Tue, 07 Jul 2026 05:54:24 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm7945671c88.15.2026.07.07.05.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:54:24 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v16 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Tue,  7 Jul 2026 18:23:11 +0530
Message-Id: <20260707125311.2398031-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
---
 drivers/crypto/Kconfig            |  1 +
 drivers/crypto/Makefile           |  1 +
 drivers/crypto/dwc-spacc/Kconfig  | 83 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  8 +++
 4 files changed, 93 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 03a8f7a1f75e8..6d2aed809a4f6 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -730,6 +730,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.

 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"

 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 2c33b83f3cfa6..b80f211598bbc 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += intel/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 0000000000000..a9172606d77aa
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_DEV_SPACC
+	tristate "Support for dwc_spacc Security Protocol Accelerator"
+	depends on HAS_DMA
+	select CRYPTO_ENGINE
+	default n
+
+	help
+	  This enables support for SPAcc Hardware Accelerator.
+
+if CRYPTO_DEV_SPACC
+
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	default y
+	select CRYPTO_HASH
+	select CRYPTO_SHA1
+	select CRYPTO_MD5
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_HMAC
+	select CRYPTO_SM3
+	select CRYPTO_CMAC
+	select CRYPTO_XCBC
+	select CRYPTO_AES
+	select CRYPTO_SM4_GENERIC
+
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	default y
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write oprations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT opration
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_PRIORITY
+	int "VSPACC priority value"
+	range 0 15
+	default 1
+	help
+	  Default arbitration priority weight for this Virtual SPAcc instance.
+	  Hardware resets this to 1. Higher values means higher priority.
+
+config CRYPTO_DEV_SPACC_INTERNAL_COUNTER
+	int "SPAcc internal counter value"
+	range 100000 1048575
+	default 100000
+	help
+	  This value configures a hardware watchdog counter in the SPAcc engine.
+	  The counter starts ticking when a completed cryptographic job is
+	  sitting in the STATUS FIFO. If the job remains unprocessed for the
+	  configured duration, an interrupt is triggered to ensure it is serviced.
+
+config CRYPTO_DEV_SPACC_CONFIG_DEBUG
+	bool "Enable SPAcc debug logs"
+	default n
+	help
+          Say y to enable additional debug prints and diagnostics in the
+	  SPAcc driver. Disable this for production builds.
+
+endif # CRYPTO_DEV_SPACC
diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc/Makefile
new file mode 100644
index 0000000000000..45d0166dfc8f7
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+snps-spacc-objs = spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+ifeq ($(CONFIG_CRYPTO_DEV_SPACC_HASH),y)
+snps-spacc-objs += spacc_ahash.o
+endif
--
2.25.1

