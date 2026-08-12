Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734F471D03
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557120; cv=none; b=VPqn3EtoVKzqa2lq4JOSl+bv+LhxDRMcrv98Bgrkf5++onbzhN/AM1NEI6o2dbl27yjUkxCt942WJ6d6q4KtWKMzqwnVxmfJp05Q2eHesXLlrP8AwCQ653H2UUp4TEtwfibPitrsh6maHXfdRIztAaTq3ED5mLdstkO3Hrm23e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557120; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MDKR/BjXKyKkqr2NJghiXyAEEeGl+8utuQYCOO5Da4hdyoDgggNEWvHpzPmh4EWhdLaH89yGTyBgivcrYXDMqhE/3JFKMjRHowOxdEbJK6kIe21cX8Gx1SWAJok0unGaFnJLlNM8Z/qzuoBmXwkBTD7F3/fblcF8C3nj+zPgKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=RasU0S/T; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="RasU0S/T"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1284954a91.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786557118; x=1787161918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=RasU0S/TnBDxxvNlofOJCfxCLwHeFDJRzzDkafWL9nHTym1lar8Wsb2cwoA7uIXAIM
         PR+TnLilixgoLcEj0J6Hl390kc6cq6wxt4+JSMR9rVYCnbKsysxm6M8dAD1IJ8oMFf7C
         735LzYkOZ5aGVFnRVCr1unv2/c40h/abaMFtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786557118; x=1787161918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=rdzZiON+qjVXGKXNsSYQxOBLYlNGCoEDpOWdg9Wz+zRu2QUMOrTm2RYTZMArEwLxCP
         oj9Eq88kOWFsNTXDKJbr0xL2rYEUWsAH8m67asIEAk4fpCIeR55zMpbBLBROnrZXRt4+
         WelDbR4+UaIGRPwQUTVKywTgwAq74LqzNOI7M3+lIZmxQk3gbZREqQbL6T6tS61/sIRB
         S0LxWFmRl4bvHTQRxy9HAMRCSG55hMuZUMOXfa5IT3Uoc8Fjz9k2E2Cl0biJYAFvZWl8
         glueXi8Gq0W1I/WIBDowLXuwmea6/5dM7kGozIPVLCWNZHb50MI/zly0Do9Av5Yl3NRd
         PXnA==
X-Forwarded-Encrypted: i=1; AHgh+RrsoDzPMVvKQH3VUqWaP4OOt+oSFviVItTF5VV+r587foprgiNQPTWW/WvJ0aL3LMn2lUhzB6Ea1LQb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2K52CTt2ztxeuqoA71dk3QbGQQF+fIPix47PsJ30+ofUbT8f
	x1BvFEZ71LbiGvVVWtOmUKAEWwNsvCmS9ZKK8tR5WtA01PmUqYfGQIPhF1eKNtZs5Cg=
X-Gm-Gg: AR+sD13B2NFdaaIKIYDK1BDSrwz4dKaQrdhhtlmx7Z5yF2s0oNkARxlhISv3sU0ux/8
	Ew9fZU1MHh/fnBM4KmMEZNS2swjBi0i3YnHTrV2WB6qUdnIchyBwUOmUtv+pFAHA4Km3Srm8SKf
	7YGg1vSq8smr3rrYlfvD5GG0nbr2Kitl6jHnEdcwZxNpjdHCT4+cPvK3gVk8bNi50wkZYJaJlKt
	tPXsdFBZa+Gm1wIOKnMa31kKE6jANsntor53agsHQfaatMh4dW948uHPyqdWSkhUK0jFWQkBkVV
	fV5++cjBQZ0y+moRt97oHFNZEvP43gupDiQt4vCtBQNuM/u2UcggObTKIoHn6xW8n9xvxbd9plE
	oxYcb6fWlpDu7f2T/qhI4Al3UTnaPrzUzqrjlDc2kzsU7XYtHy40iTVRhWlPXlwb/6WSdMqzXXp
	YqDbIZS6aLJL5cmK5YENWMPK0ccU5FTw80Gz1uoxbZ4a27G4pZWO1U/eBXGyrJMK9kBJIfwUWEl
	0oFIJ8DXlaJ+qtGLch9Y8DLUuvlm8E7wy/YNZ0mPxZi6hpxNkJRsj2Nhv4JavQhomyxHLm3dCQ5
	ONxy3t/Fg5lyrv84AYJu9/F8+t/q
X-Received: by 2002:a17:90b:53c6:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-393013f8757mr7922260a91.5.1786557118118;
        Wed, 12 Aug 2026 10:51:58 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245540fesm18482258c88.9.2026.08.12.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:51:56 -0700 (PDT)
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
Subject: [PATCH v22 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Wed, 12 Aug 2026 23:20:20 +0530
Message-Id: <20260812175020.666558-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
References: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
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

