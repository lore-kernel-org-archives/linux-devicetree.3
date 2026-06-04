Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E6492514
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592085; cv=none; b=aaKbKfqvf3zsPVRcHMz7uatyKWnwNjxN/+I9QuTwteIpWX7fMnT9fXpYZKMHpQbp+zs84cl/rEpyNFYoiOZeqapfh9X8eg1ey76HDpckHHNqK02EGlB0JZ6U+ZGRo18l6taNa3B52xZ1MiDEXbLdDJVUcrNsDU5WlJhLyG0WgQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592085; c=relaxed/simple;
	bh=rABbYZThzUNlASAg9PNrF9XDHFdMGNnw3+CijB5LI08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ecYVzJkhYsg8v49YkT3jWr2pmgiRwZGeESyt8bAWgTx4cEAe69W5OWE6zFqumJV2d97NyEs0taLOAZOYzfLjytliPhezAWjb8Rxk1IATiwPYdJ6E80u7iTscFk1RG/NTJdofAkTcpu+10jDAkxArNLXjjfiIJ9WVhGuYVrnZmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=Uyt6WeCm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="Uyt6WeCm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36baec934b6so1256724a91.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1780592083; x=1781196883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkZvHdMfG2/miY1eJGcyaUgMffG3UaOtedsqc4De/Z4=;
        b=Uyt6WeCmqzpryxssDTkjul2TvH/Oes+JTekrQcH25+jivBhy3wOr/nkgeGcJIaNsz8
         D5iP9t7T2/MHUUochh5bRcx6UCFvP6909F4njEfHr6Nr5IHuHxivgVIJHHecMeEZNxaF
         5DIt7ioRTrieuLHed9A2slDr9TZFHrbQFjMYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780592083; x=1781196883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkZvHdMfG2/miY1eJGcyaUgMffG3UaOtedsqc4De/Z4=;
        b=eTrRPe6APY8a2rKclfRGr9U1x9JpLidsYVPhkbKxw/dJG/llB1NGWjo4vliRK7EiJD
         Tif188OrDQQJtMgL00B//nAppIzFkq5hPXxspquJWTXDomGOq2CAh/Xx1MRmbvCSLUly
         ogQQ2NJO7f4v3udHS4VlAJtxLB/agJTINSwLKL9MLRqUDxR105gKhNEPxkaykA82CHfE
         7u3Ej1sFNmEmrmII7AWaR02B7gT7YADPdBxN6hIMsdeGPYZNZG2FJhre903mriMom79v
         gwxmebIMnd/K0gFcQUlyd/Dc1UfYzjaSzuOEbAcY0DzLIK/598stEfRQezGDZ2Gc/uVt
         zp8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9aYoLEBFyat7o5kLJAs9sbTUj8MZDrxmzU6kzBoSynNlMOh+gwA9pht9M4/+FafjocAn9ASAg6z095@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbRIPlsuWf2tMF7pIHkc4xAd0SSIHQIZMSjPBlRz96u6uaUzK
	H1DhSWcoB3ga8z223mLzk1Ifz/pMfF+vxWvFDbfRliaVKXWRgiCmS23rEsknN/d8714=
X-Gm-Gg: Acq92OERD9JirOMtRlNtv4CrlfnzE3xTBnUgHaooi5oeaJ2dZ6jGrX3t897e/x+cfwy
	q0cwGdvaK8fmkoc+x+gWmukXWd/MlFGOlfwSADE18h5gvBWVwqc70/YpAHhEfSOCwBgC401leC4
	0KlHmXGz8hAQVXsplT1kfM3/yUEDZR4R5m9QiVZ6lJW1U/TZ23JayT5ToEwqBoMce1E2oywNmRZ
	GpaI2C5MHTXFtoOFoVNXIysItd3CAlBI5hwzZwhTUmE7Yr7fvqaNFaOKekgMEV82wpIDDTdltgo
	n7m0A0kyjdHV6bPlNy+I85Bei9n6Kmm0UXKqkZCWQCGVTK/mx6uI5k6/9RRJiM2FXwFe/HVAhM7
	cX5YeJ5PVfvM1wK+FrVL43YDMS2i1kqdss4l5MI+3zBG3DmTrVGQMAU+EyvfoQ6FSqG9LOW/CEE
	FQRQAJYQumaYsSWDUKjMQQIbMl53WPVizmI03kddWSeJji7K6yhhLNS3INELX9KEQPkEqDRDDNg
	oFqGkvPUuUgeP/LKyeqotlqlnoAmSsqz3K7MFG0YIztam0Bs2x5FTzG2Ax6zKSPK4zao4ALAEhe
	mQ==
X-Received: by 2002:a17:90b:520d:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-36f778fc247mr3693015a91.10.1780592082773;
        Thu, 04 Jun 2026 09:54:42 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm3689229a91.14.2026.06.04.09.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:54:42 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v13 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Thu,  4 Jun 2026 22:22:10 +0530
Message-Id: <20260604165210.1141842-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260604165210.1141842-1-pavitrakumarm@vayavyalabs.com>
References: <20260604165210.1141842-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/Kconfig  | 88 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  8 +++
 4 files changed, 98 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 3449b3c9c6adf..00d67990644d4 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -774,6 +774,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.

 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"

 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 283bbc650b5b2..d106c1c729060 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-y += loongson/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 0000000000000..f9752e6f664b8
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,88 @@
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
+config CRYPTO_DEV_SPACC_HASH
+	bool "Enable HASH functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	select CRYPTO_HASH
+	select CRYPTO_SHA1
+	select CRYPTO_MD5
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_HMAC
+	select CRYPTO_SM3
+	select CRYPTO_CMAC
+	select CRYPTO_MICHAEL_MIC
+	select CRYPTO_XCBC
+	select CRYPTO_AES
+	select CRYPTO_SM4_GENERIC
+
+	help
+	  Say y to enable Hash functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_AUTODETECT
+	bool "Enable Autodetect functionality"
+	depends on CRYPTO_DEV_SPACC
+	default y
+	help
+	  Say y to enable Autodetect functionality of SPAcc.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_IO
+	bool "Enable Trace MMIO reads/writes stats"
+	depends on CRYPTO_DEV_SPACC
+	default n
+	help
+	  Say y to enable Trace MMIO reads/writes stats.
+	  To Debug and trace IO register read/write oprations.
+
+config CRYPTO_DEV_SPACC_DEBUG_TRACE_DDT
+	bool "Enable Trace DDT entries stats"
+	default n
+	depends on CRYPTO_DEV_SPACC
+	help
+	  Say y to enable Enable DDT entry stats.
+	  To Debug and trace DDT opration
+
+config CRYPTO_DEV_SPACC_SECURE_MODE
+	bool "Enable Spacc secure mode stats"
+	default n
+	depends on CRYPTO_DEV_SPACC
+	help
+	  Say y to enable SPAcc secure modes stats.
+
+config CRYPTO_DEV_SPACC_PRIORITY
+	int "VSPACC priority value"
+	depends on CRYPTO_DEV_SPACC
+	range 0 15
+	default 1
+	help
+	  Default arbitration priority weight for this Virtual SPAcc instance.
+	  Hardware resets this to 1. Higher values means higher priority.
+
+config CRYPTO_DEV_SPACC_INTERNAL_COUNTER
+	int "SPAcc internal counter value"
+	depends on CRYPTO_DEV_SPACC
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
+	depends on CRYPTO_DEV_SPACC
+	help
+          Say y to enable additional debug prints and diagnostics in the
+	  SPAcc driver. Disable this for production builds.
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

