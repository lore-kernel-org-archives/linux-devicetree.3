Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FC3B14D3
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880446; cv=none; b=V/YHwsTXu3q932eH3mt+PK4cDiZynDIwSyiLcMme5SvnvXNsg1Gj/ftCXAgje5gt9CjcfHsJswEQUmda5JPWXf6ubWBOjhzp/u2euPfrir/B9WASvxVAs+6F8KGoHtydijK589E2Uxv054/Nl2UrPoxXRYvEF1kJ1EQxGWkZM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880446; c=relaxed/simple;
	bh=8WZVLLElTfO48OyPq4zNqyR+3BaioN88A7W4fKnZMEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tGeN/NZT1/LEalaDw8v0JrmJiUjG1lo9BOCVDukG5fTkQWmZfF9v0f1se88xsdkXf8DYcg7bgOqG5IQgoPRUzw1GpvFhQhtx/x272aJ28yO9ICkd7rbMj49cINNzD0jrwHcL8sQNmXc2whFMA/k8m9SqH5RaOEaG5nZkpiQwCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=b44e+vHR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="b44e+vHR"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6d31bfc70so14339395ad.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1781880445; x=1782485245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1/9OZpQy2NHCbAyFQJbCVGK+rSBNj4Sge11acqBf1Y=;
        b=b44e+vHRDke5fuOfFiVWU7/Rv62OLF/Tak11B7FoLf/mjjMS1ShbW2lTNa++kzMrLg
         q4CxWZJd1Thl0dx0zBYb4BdcWT3AwtmQFNxQe/r/h6RVGm03nVpthTROhgTErU881hQv
         QyyVIwtcAZYILebX27Ut69aGuGE37gfN83txo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781880445; x=1782485245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1/9OZpQy2NHCbAyFQJbCVGK+rSBNj4Sge11acqBf1Y=;
        b=ro06zxqwIvMwF9t4v0LbpLrRwQj4YZzihpkkX8hCBAdXAvCRGicC/qHVnskb9cG6rx
         eu7RaPdjHKgC7YeXdw+j7QXTqui2p2CIBz/jfbO+so4HNYV+x0NzHDlHPeJ32g6eoto6
         p9asOgRRTUt9jDPPn4tA+wUy00IWYobGsyA+wWZt8zogKzdLruROLGddiQDGbZKfR+Xn
         HPENZ/UoOqyM1NGDA3I0PiZ5vw3t/rhsOnyJXRFo4EYT6AN7UbwGW0k1xrwguRkW1eZu
         khMwMkQZ2B9AUfLFzW3ekIeUJSdpdWo1vD2+e5jEh47p3axLlwwUlPZ5Qj9fzwhWhjY+
         gAGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R85q6FgCcONj6yAjrIgl6y2DJyMnVs5ZTfULfwxowq8XNKDNoJ0/lYqv03B6huSRM4BZidZVz0ltI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pmWHpzBzEDb4CVSjSNAl/2X7i0UIvX0ebHcJuyvbNcUWPPJ8
	HOLjNfG0kx0j/b4wbqzHtp/bjW0vXTHgQYUDYN2lgG2pNApcZDACsNrQqYOYuNTIYvKmVpd5mfE
	SSY2a
X-Gm-Gg: AfdE7cl+mJldyYogjZZGKdSeTVrXnB+9RheEStVfLOV0Zvs/6ykuXl+iekbAC6LzYyq
	CRrRnpCWTOByioqOBAuLeHKSAVBNC7p26UMHW9wgJadgjowY8JJ1r8w32Qj/yTMf0rmT+iZgGvm
	GyYmVDuXEjngBuSHFFWGgRyU4y0Mz8dQuUU9Sr7D1dlV4C41ZeY2naloADgXG9CQlndobUDP8b8
	rBDtxTdtVv8e9k2ycG7HKxWeKG/vSC2VUJi7ehXMAfX+Yl8Vn23IRpMa9ctUxPS1+IeNEp49gH2
	6c5i+1QC0eQPsdY0IIaV+DETW+HWX6bpIXI4kjwcVYtTZln/+NTnUTmzsE9n0pgtNU4tSeDkczJ
	BBEqMM4okl/SQIloRcwkMiu33lrrO0EF76oWtMORaCAKz7FUw1Hw7Q3GSvWBlb5ft/wGg6fHGbI
	vYfnjFcpXRkCk7HeL++zwAOpcYiKxP0rCn+Xh+TEjHAs2AHo+R/9W4AJ8Ki69yUAMNI30IRN1Vd
	iaTG4Vua1mIDpQNgMlrcyIB5+lQoUo3rE7HAwOeuTCgpTgOPdEiZOS4
X-Received: by 2002:a17:903:388e:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c7253af6bfmr32725265ad.0.1781880444678;
        Fri, 19 Jun 2026 07:47:24 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720899fe5sm27163595ad.16.2026.06.19.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 07:47:24 -0700 (PDT)
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
Subject: [PATCH v14 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Fri, 19 Jun 2026 20:15:58 +0530
Message-Id: <20260619144558.1868995-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
References: <20260619144558.1868995-1-pavitrakumarm@vayavyalabs.com>
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
 drivers/crypto/dwc-spacc/Kconfig  | 87 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  8 +++
 4 files changed, 97 insertions(+)
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 216a00bad5d70..280a0165ddfdf 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -742,6 +742,7 @@ config CRYPTO_DEV_BCM_SPU
 	  ahash, and aead algorithms with the kernel cryptographic API.

 source "drivers/crypto/stm32/Kconfig"
+source "drivers/crypto/dwc-spacc/Kconfig"

 config CRYPTO_DEV_SAFEXCEL
 	tristate "Inside Secure's SafeXcel cryptographic engine driver"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 5a950c7abc393..d463a3f101963 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-y += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
 obj-y += xilinx/
+obj-y += dwc-spacc/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += intel/
diff --git a/drivers/crypto/dwc-spacc/Kconfig b/drivers/crypto/dwc-spacc/Kconfig
new file mode 100644
index 0000000000000..b253f8dc539c1
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,87 @@
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

