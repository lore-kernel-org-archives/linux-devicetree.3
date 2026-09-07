Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F74B0C9E
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796820; cv=none; b=BHrgieaIv4bQw9SKCRZ3su0qywegDzm2s4zHNMxuEq7luqQRur7bS3iFoNeJXBDjdaX1u4H2UOvY3KItzQVuaXCuUkERHVNUYofuoVydWtm4pTirBxHM9AaRF3I2zJUH8ph/7k1U6/RXQLRkD3syNwGr7Pd5KMD1sC/P7XKJLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796820; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BGmnuOm+VVXV1CTcRyOls22hOjsgGYtmwxSnTuvACvjsY4RSnbrJh5b5+Fnwb6KVTplLJZTb+nhkKYgPZ0UBVoouG+vxKyyNP499ougNxRLWotRbMLYUNhhGeZ6d8aIGQYgO6sJ/CEuJpmuM5nQMpUpMPuQkGTmd1cuT1zypYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=QKrbicDH; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="QKrbicDH"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca80d708489so2606233a12.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1788796819; x=1789401619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=QKrbicDHGgTfDpiNEZeq/ug6Fp1I6iDBT9R6W56bE23mUBjv4PV8yqdfoSvzH9UMhJ
         nOFQMCOrZxAddMIIh5APUuwOXvfN8aRNiudS+cvRRnhu2EHAFIS3L3yxFaBi99JSpJm+
         E587d4MgFNUAnirLBX9sadwwqtHqlPKPoE+1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796819; x=1789401619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=al2+f3lynQam/v1Q/JB9Ye4bzbrncK7NgXhA2uogKPUmoTzqguPYDioWQhm5WAtk+R
         FrC2msmktZtYVY6yIkhRkybTR/uSEzDn1Eu6xZaZfdBGs8Ew7YZ1n14Njn9t7S6jexoU
         wSKEbeYDIdiUMl7zGTVR+vkhzDgjvvfBdlbUGHzQGhn/CU0Za6byEjMaUY0xR0lITnaN
         7HJloTuaciACHEQT+cvdxSHTB8HVdc8cNlweKAFA4Vmpv+5MjwqYB8QvBFTqCsuwC3FN
         9TZ8HNGcU1pgekDrztY0yIkdOlOwjhVE3+lgMx8b7xSVL47daBipchnzM4CpWdFQHRpA
         RRiw==
X-Forwarded-Encrypted: i=1; AKwUvByojU+foH+9rSikYB9KBFa7VIYMwNnXD0sig0w7SO6N+TGLcEst8ZS17YL2mEv/oX6Cetm3Jf1bbiJZ@vger.kernel.org
X-Gm-Message-State: AFuF++k8TZsZLDnW4cHOmU5XsYZMW5f2sk/CVXoXXCnXEm04vcGzvuzB
	nxWTkY8aEBeH7U7N6ERqyVBYVHXg6oGp5bq3EYBXBM9UHZ/5Jt9N5LLhLnnKtJf+QI3K8jFWh5A
	KsF2E
X-Gm-Gg: AYBFou0LnfCkS3nBUhQG8iI3i2cFxK5Fj1zdqyqTyA+Ax1lmYcIMd583IqG0I8hrL9J
	pM5iqnzWIZXmxzWTAgOjvvlJIs2rZVPkOs19Q57UGcBE1ZUSv8KI6L69Cg6rylBp81JSX4ojydY
	jAJzEc0nDboqQNmz0KLYTWKe5SlBKXAs8aymRoSyfr94IveS6J+g197l4JYpSCZohRhbHED1cRq
	igzjGWvgkSQxlKgKjwAiUya+YTysI/dTEDwYMyzhASHgyg3/gJG2KjUWgn1qmOZu+RiuXUU5mo7
	ZQq+mNRs/hv/qUgYfwc1f5nhiE9BWlY00egkawaUpi1c3Yok7p7Le0Pp41s9eV2A8KM9TeDGinl
	o8EArUHrbHu2zPa442vpxba3x8VlDoNZFr58c4RNf/rLW2ZHp84VEwCbfOsNx7N5ZUjPp46g9UE
	UvUseWeKUVrUTzbvsz5eNnAQr9yVl3N/toqao07cg5MceRO3Qjn6vsNcGR4g+Xa4DYSYk2JBOmp
	7cumpnIeHa9o/VSqrDdhYMG/8BJ1rsPjsiSbbvTgF7l9tqwoyGTvULOGpS+5zOr4VMC7C1Wtcfb
	/TpPKTxwbmgUZqcfahamW+80u+YX
X-Received: by 2002:a05:6a20:6a26:b0:3c8:e304:99d0 with SMTP id adf61e73a8af0-3da211316femr26644951637.0.1788796818456;
        Mon, 07 Sep 2026 09:00:18 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm46065613eec.16.2026.09.07.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:00:17 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v25 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon,  7 Sep 2026 21:29:16 +0530
Message-Id: <20260907155916.999153-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
References: <20260907155916.999153-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/Kconfig  | 65 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  7 ++++
 4 files changed, 74 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 0189dfdcbbe11..e0a8de643d6fa 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -734,6 +734,7 @@ config CRYPTO_DEV_BCM_SPU
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
index 0000000000000..82ea907a14635
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_DEV_SPACC
+	tristate "Support for dwc_spacc Security Protocol Accelerator"
+	depends on HAS_DMA
+	depends on HAS_IOMEM
+	select CRYPTO_ENGINE
+	select CRYPTO_HASH if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA1 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_MD5 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA256 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA512 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SHA3 if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_HMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_CMAC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_XCBC if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_AES if CRYPTO_DEV_SPACC_HASH
+	select CRYPTO_SM4_GENERIC if CRYPTO_DEV_SPACC_HASH
+	default n
+
+	help
+	  This enables support for SPAcc Hardware Accelerator.
+
+if CRYPTO_DEV_SPACC
+
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	default CRYPTO_DEV_SPACC
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	default n
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write operations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT operation
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_CONFIG_DEBUG
+	bool "Enable SPAcc debug logs"
+	default n
+	help
+	  Say y to enable additional debug prints and diagnostics in the
+	  SPAcc driver. Disable this for production builds.
+
+endif # CRYPTO_DEV_SPACC
diff --git a/drivers/crypto/dwc-spacc/Makefile b/drivers/crypto/dwc-spacc/Makefile
new file mode 100644
index 0000000000000..b7125a7797ba0
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+
+snps-spacc-y := spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) += spacc_ahash.o
--
2.25.1

