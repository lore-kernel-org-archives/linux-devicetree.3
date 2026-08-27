Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8853909B1
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805898; cv=none; b=oY6uir5zOQcMsyhxCgfWaMLuf17n43hiq9pgl2Yz39S28lJQYzJoVc3lIxnbhZQMZ3oyruCAlSLPGe8J2O+xhIsPmxF3QQv15OvYjRTqauQmTf15kRFdavkKoZQROHDpOmtDwOjHRR7PDqR6uoHemWD3BQixgWG0OdR2VK1pkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805898; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQiPHNhQsfQM+rIfxc3l4dxtK4UPwKqvqH0ZU1XqSmnK7PgQ25nljJ/tZBZi7NVF0J1656kQQtVdq5yhttt8/CXEZa0hKdoS1ZXtGFv8OxF4GRo66fZD4T3BLnZtD5XpwFdh18LkkEV4tHq4cL4VMjpKIx6B9PxHRAKLoxrONM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=VIG85tUf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="VIG85tUf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so414383a12.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1787805896; x=1788410696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=VIG85tUfm7r2QEGNCJQQKf+tb2nt6HuTUNw3AT5DiGrf34D0BNCYeDgrWV5ERMRhYy
         7RmK2BmTUCsnApmeVnNJJUvRkhLPquid0jw9nuZk7OGb1zjDaJH/SjQ1elD2GVJldNBL
         26BmY70qtDAiCsMFvXdFXrfqC9b58u5UeLF0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805896; x=1788410696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=BcR5xBRLdR7YIu0a8B2+It/9QRN2p0fNoET6RsXdK22N6A1xreg7vzB7iOYqHv2sgT
         iWxCA0R3SRPyVVn5kndxXxtPSOjeNFFXwL4xN7RGOnmlhIUI/rtsqaWIZv/oTdTrgkTE
         gKkZpW558v6GwdbU02wpDoqF4iDrUyqONbMJXK2TtC6yAUAow43cocbJvvvfQT0deGdO
         tUl5Ze+Bv2Pt2G5DuEVVMoemwW80bIow6drM6F9fBpAVZkGwVADr9B8sCLmhKH57ViZ4
         BQrbrMxd7yWXZmApgNVgZuzAu+N15tydzo2tnyLgYMRRDRpEGulo37qzogmxOLo4gWl1
         P2uw==
X-Forwarded-Encrypted: i=1; AHgh+Rqwdah9a2Cgfkv2ooQ4m+fr4OnM0MXfKfShTTAYcWh5Yh02Rsi1X5CU3VkZa4AR0fdXJRjYBqxUQbiJ@vger.kernel.org
X-Gm-Message-State: AFuF++nFV8Bof8t1nLJ6cZ5JAWq1H+SjYXF3SO8KRhgNhlQclvvkg9Nz
	c5jY9+/eJZ9hH3/qrCXMBCtJmvZuvvG9F/rjF1f9EzaREzZXP2ZagrsMLP3qARTuQXU=
X-Gm-Gg: AR+sD12CmrPftJaDBe2uoXYK4+ONjWTwljt47sSBnyDoKT5wuwibqQLROxpOWK9cwQr
	sqTlTgB7Vb8Ip2ty7Fcz8xbGEMcismbnxljiPdMqiEvkh9huWMyUKOtGgVEUjv/xdFWQ59JE51U
	LVtNoqVrgbOOIP/7h7SMUfSnM9oychm2QUc1XIcJIRHr6Mv6KJKY+XdQLWlAVb7Dp30QfohUEtj
	9nT+UNaM3D4YO7G1q43h2nUTKoPtg+u1MCyYQCXmXJbnSFnZU2VRhhBIOqBouBmh0QlZYOxbeiR
	jqGh3gSuVOsA5WepQLdV1/my3jYIkvdgev7MVygasOXrAnq1hXEf2LJZjn8UGlrUz+2fjjsN6cd
	zVYowsxA0FZLLVv55F73nlV+ZUbc1sxizw3xtxvBHQ+jQqq9e0KrPSXAsqXYaf2LsOVwgh0DSkP
	7KccGcQxzVycJPBoTyFtV4cknhmgJweOfmktPgsTU8h7Bb9D3GhmEBOFHMqXdRQFsEce4ysSKSu
	iTx9/aQvpHKiZ16Ngr3n69WvHdwzZWy+3XYIlU87cds9YYQc8FDeIs8bFlkub7+52Wag3M6CPFV
	CpWJQPwJoXF1UGUA2RXWVcUOdH6k
X-Received: by 2002:a05:6a21:3a4a:b0:3cc:2552:ddd7 with SMTP id adf61e73a8af0-3cf8293ba48mr28734686637.5.1787805895951;
        Wed, 26 Aug 2026 21:44:55 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d63bb23sm14554224eec.7.2026.08.26.21.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:44:55 -0700 (PDT)
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
Subject: [PATCH v23 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Thu, 27 Aug 2026 10:13:49 +0530
Message-Id: <20260827044349.826534-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
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

