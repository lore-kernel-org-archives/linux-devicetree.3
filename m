Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58673F9A1B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547556; cv=none; b=hDlVCKL2eBV756iqATpWCabWz5wsv9xdT/Ext/EM/0pB2DOhlEmI0GInByb5doOebP30Bb318V1DHlvvEI+pggVmijbS+0/vsN0iVQeQ/loyGY2o2nPMk4WVc1DfQZKGsbmII7fR9CQPqYDe31lTPcB5ILTPXXuSYXCdCFCbsKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547556; c=relaxed/simple;
	bh=xTz3yEd8t4v3/U4yrl4P5+bV8vigviXxE5aIF8OTQPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NEbCQx7/SHEg/XI79TxdJv8Dfhgp61Io6oyZrdX+SYOR9diOKVdoZITUzbLGSt6xkt6e3WBn3OJBdY0Tgq8Qv796XLeDVpMs5Htwd/xzY49mlyzB2pcC0Qm+Luxcg6PAgjfiDGpHb27N4Rpeyv+luzGI76CblOnJjDRX2pArTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=ZRPjV+1A; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="ZRPjV+1A"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cee9b74ee1so60660825ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784547550; x=1785152350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1NXr2phHnfz8YKmbh9LAE4yktpAw0f6xAv10feVt6yc=;
        b=ZRPjV+1Aqs7GJrOkRA0cgWHWs+hYr6BphLl9WN4FOczr5tFRBsqceZwrKX2bL/uE9S
         I0HkapGFay0bGfedDgM9t4u8B8xqb5+m4l2XxmqiwcP4AGgccJvIjncepLwbUoF3iJHH
         I8o7VGlHU5HlaopZU4KMwj7ZvHfa5iij+rEvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547550; x=1785152350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1NXr2phHnfz8YKmbh9LAE4yktpAw0f6xAv10feVt6yc=;
        b=ZRrUREie/Jf8DQ7oTN3yRKSjItSYImLVgThsTkVrawKh5acqJTEjDSt3lt7F/LDwc+
         mH5O4I5Nk6JBAkciyvLoFIEmtdLEz/L+sd+mK2uILz4V4yiV0wBugQLG0kHsX+VwyL3g
         cWTWDmsUs3wpLyJ6lRP32eZUPSp8pk1zBROl8Dhx8MHq0bL4JztwjMYVrmk7MzDz8fau
         pukUkiQ43z5Dpz9J9ew/8qOmyYHqwWuagxjFa9OrgFw8BqI14tjOH4M7i3tqDFYC6phR
         8GVyC9nH7hZ9nTI9ZKhwVjSa4YyXmh5zXDXerAn4+Oe8T6W8GTF5/kiWvxW4XDgdqzVW
         jdHg==
X-Forwarded-Encrypted: i=1; AHgh+RqrevJHrtOP6VrR2uYw/t1h9Zv9brs2s5R5hwkFqRjcHIwbc8Q88vzt/qhfW+VlDg+pDw2FAkUhy6gu@vger.kernel.org
X-Gm-Message-State: AOJu0YydATMbQlYDzQKLpaxDjYemRuVPjznE4PTuaoO9DHfB6+vkZj7Q
	IY3APCotIZ0tBxDVtmrlZxRatEyGAliTrSRrLSqcSP695Ty4iExcIA32neH9yHo4hXU=
X-Gm-Gg: AfdE7clH8zJbsw1h5ULcQGCcOtL6wEPoQPCcU950WDa4XUMGHmFRfdrpBCfQcDTmtEs
	dBW8uknMMJONu00UTIgoTuq4c7SxEUd/r/jt1jmX9zkmjnU4d/MoYZZxIpOJoJPKVqpY8TOw2Em
	/ljO4ef92/xRtSlnvsFKfL7Zq3ScjY4u2xuVwN4ZpELuvWEZh7gRenfkXqeRsxomIcww+zjMPrT
	vd/XhziJcloRt8zz5J43VywIHFPjD/1GZiRoi79woZUgM0+QPCzfgkBthU5VBJIjktJi+/kgMnQ
	0oPJZenKfi/zEwQTidy7s3QItEjqx/D8y7KmlWNIFRN0FhWmRtLlY3FI6eFNqnGiFkS6rOo0dv2
	LCT/dRgMSPnilQbJM6mU760MrYXYbOEwL2Alj1hPs2zk+OkPGbrNJ0+Ti5YLyQzHZjy0fNUKVpF
	vtv2kp/EmzQJJNc31vqbQKI4T0VSABB7nLg9FVjdhhW1HLEMH57LSdRDXoTPMWP20nC+pTjPSbT
	nTcV7GkgoHXjwfMDcMEl81q968Q7q4N0Km7UasaZ7R9vRVM6UFVGYVc
X-Received: by 2002:a05:6a20:da14:b0:3c3:94a8:7c18 with SMTP id adf61e73a8af0-3c3ad947dfcmr15251382637.37.1784547550640;
        Mon, 20 Jul 2026 04:39:10 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm61824393eec.21.2026.07.20.04.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:39:10 -0700 (PDT)
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
Subject: [PATCH v17 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon, 20 Jul 2026 17:07:40 +0530
Message-Id: <20260720113740.64960-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/Makefile |  6 +++
 4 files changed, 91 insertions(+)
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
index 0000000000000..edc550562235e
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
+	tristate "Enable HASH functionality"
+	default CRYPTO_DEV_SPACC
+	select CRYPTO_HASH
+	select CRYPTO_SHA1
+	select CRYPTO_MD5
+	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_HMAC
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
+	  This value configures a hardware watchdog counter in the SPAcc
+	  engine.The counter starts ticking when a completed cryptographic
+	  job is sitting in the STATUS FIFO. If the job remains unprocessed
+	  for the configured duration, an interrupt is triggered to ensure
+	  it is serviced.
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
index 0000000000000..d7010644c3dbc
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_CRYPTO_DEV_SPACC) += snps-spacc.o
+snps-spacc-objs = spacc_hal.o spacc_core.o \
+spacc_manager.o spacc_interrupt.o spacc_device.o
+
+snps-spacc-$(CONFIG_CRYPTO_DEV_SPACC_HASH) += spacc_ahash.o
--
2.25.1

