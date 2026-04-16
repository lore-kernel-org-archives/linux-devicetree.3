Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD137B40A
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776321997; cv=none; b=DR8zyjS8NSHbnGOC7UqAR7r1xVEk3syNwaw1yU+1Itbn1eEsH2//8leeWJkDvcSfGUdSRYdJAq2SWRZs6T5aiZxwebug0zuRuCyFcXKdCP0MQeZJjvCBkocVz1frpEgaVN5Ep34UzCUQ7C+Gr9tKD+JST+PXjYb88y1mq9wkCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776321997; c=relaxed/simple;
	bh=4LU1IrL5gyBpEHR7/NLXXJqQW/u2iHDuiJdll/UcfBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jy5BWQRGFo/uq/nKp0Jiq3WV3xboJWUY/R3xBzuJT48JkCgmU/lIjRUgRUIDlYnKZDx9BXca+DP6KrlO2UlbfoGi/W9ns4OX+GUi2UxeAQ/EiaF0Ofdqvv+ZULnQfDuhBZA1OqbTUd/qjkJgyhdMelRAOG9RfcYlTGU2b/VVcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=NnHS2LbT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="NnHS2LbT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f7c7ee9b8so130894b3a.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 23:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1776321994; x=1776926794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/V5ox+79P3LcSxd6wN5P/F1MTZ5N007Bin+MslZtJ8=;
        b=NnHS2LbTE2nBD7EZIhojlzOWoeL1w8mdtIr6zYbbokBYruXQ/UCMV02t5IiT3Crf4v
         ajSzuW39rC2Csxi4HAbzbwqVMZPSV7RZX9EF5LZsgfU4OrQg5BMFjiaQqaGTRgPcysE0
         6KeMeUzOF5jqXOH86ykGbyWOZ2QmXlAxqMasQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776321994; x=1776926794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/V5ox+79P3LcSxd6wN5P/F1MTZ5N007Bin+MslZtJ8=;
        b=KTEmhT2Il40OWU+m87J5iDuZQ0WDR06z1fj90yvmAfIGwBKS31YjXKbmN8k6RQA3Qr
         1dKo4c33caWojncHg+mPf1au2LFE9B7d9SUFfn/o6dcG0N/m//O3GA7GwPMlm3FuOJJc
         51xGZWpNH4FwXCcrgRnagQBaavZkI1OtKRSUHYHcQbUbjfY2XdnLQ4LxjXfJQuJu+JZA
         hafh5+58RSI/08WzBCr766o+Qn3VCIfI3kpz1DDlUR5mlqQ9O1PS6/aWUQxwvkMhpzdV
         p7107q12DBDIC1EcaPFiMb6aiucqkmg6ukmmAC9/HmCr5VeUf4k/EiJd27I0AYmCowzy
         uCXw==
X-Forwarded-Encrypted: i=1; AFNElJ+KVp0+smCsJIJqNrdfSMJEsX8LuLnAVwx+35VOpSVppoJHi/oXw7QU5sfHPH0+9qUnlrkInUK8jony@vger.kernel.org
X-Gm-Message-State: AOJu0YxBX3mZVbki3eikq3AbaVvMTXJs+49SP11+uC5L4Vu/Ie1Ble25
	WcaBcCqNby3dT9nIEEFZ8YV9Wiw3mRxcU9oXasgqNhGB5CgDTbzs8sPyDJkkZA+Giis=
X-Gm-Gg: AeBDiet3Wnue5UlsV67bT7qogQgFZTlbXn1ishMxMMWjAt4D60rpAZZop4JeMJx66c9
	onVLMO44nUbiVh1MbFwFFK5d9NIM6duC+skynXtJatSN76neVxRL6kOp1xWRZUZFcOSKpevIYLW
	58jE7/fdan7PD12spzaOx3T1+AmVEXyQWwIebxcExpW8EeYSpKLd542TDgu3aWhpZ5a9VK0Epe9
	KDKITreksItos01i6z7arnTypaMRUzIMUubaYJbIgwfhOXvsgEg8CjRy6jI48/0beWrgxNqKYNc
	7RS2yVNahtOdDCgoPrI3TPmNFXr7HC4rYLL2TgXUuXG+H6PVqTSQGmUYbrBaOSya9JYF1s8cHKp
	3l1cewGkERTubuHM3hFwj26BoDe5r9tXZc681YtPLGvasBep4+IZsZHOhePYIYHW2Kk323033Or
	kvSZ6/ak/0Cc3gwDag+hY5ue/qDVvtdf7KcusZxv6jCmJZy3hwkJ/F/QgEyy5yKsu04Dj10EBL1
	8Lec1hFibi9wDQ/KowL9Pa+QJ7qfZOhVnRnxR0f/JELt1QW/R1/zav/LiyqmFKvAfc=
X-Received: by 2002:a05:6a00:4212:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f0bea2ba5mr22997415b3a.0.1776321994057;
        Wed, 15 Apr 2026 23:46:34 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67418a47sm4107066b3a.48.2026.04.15.23.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:46:33 -0700 (PDT)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: conor+dt@kernel.org,
	Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v12 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Thu, 16 Apr 2026 12:14:51 +0530
Message-Id: <20260416064451.99886-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
References: <20260416064451.99886-1-pavitrakumarm@vayavyalabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ruud Derwig <Ruud.Derwig@synopsys.com>
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
index 971f17a155435..2d10ef4321bc8 100644
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

