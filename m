Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3070400987
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179528; cv=none; b=OEPTOKspXCAtiCL3fODfZsMMjwN4UjrB+PfNqSMtcAH9UHpGLCqc47S1+0fymvbnsqB0XWPxNd9qrJOfZcfG7C68TKfI4/RqY6ufHrLyQeSlRKuCYrfEYMnLnCX0xmM9WulHU3ydJElX+zGLrDDeIh5AMrOesxsBKwKh9cLiUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179528; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n9pLoGJjf2vW/4jw6x4/q0+42ZN/R46p+CyJ2XMemZm0Efx1sNE5B/DMoysEFSkFDRVWj15QYua/ZiIkM5sg8vAo7tau0/uSCEEhaC+FXvNOMqqjqHk8o4JcexfISKkroI3jUO4SfmTwzZIiI7eNFIR3hpJMPe3w342nzih/G+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=d597RFTV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="d597RFTV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3257770a91.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1788179526; x=1788784326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=d597RFTV79lXzt/zNSrpgfD3wv0fyvMpbfwa6d0zBFX4Ul9jR0ioO6KACHwzskrp2Y
         JjbXQWaQUT1xWbHXy5dCFXtylNp4SpzwbEmQbpWAo4zilr8xch8lvYGP1BpZ/kHVXAXj
         foXQTjE0EUM+6k+bDunQhEL02ivcR1kx+zHCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179526; x=1788784326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=XjSoZ2JPlsVAfDwxrjIEZOpXPH6i0P+kBhqX+pxkHopC6PBIm626Ms3P+NrRbh6zQW
         9cxAjb4sNVyt3rDGpI8xj8QwJGBIcol7EnYb1IPu1M46eT24LqPnJHU9neDfN3shxBZx
         RAxvYPA9Li+9P7XFhbPxbOKiAink3Uf10DuicCihDksDcMKj53iLgXGbFdxcJPC48cCn
         vWZqnvyu85IfCCaIIrirBAVp5dwHeDGTjOUUj5yy3OwwMUYyURJ9TlkjHUrX4PrRdLsa
         rOcdts2FjoNgz13AmYshrcBD+Efx8x/INSp4k3frjr0o49fG/Vd7R8jZFbZVhXBApgG+
         SSvg==
X-Forwarded-Encrypted: i=1; AKwUvByG9+1xFnaNBfdKWVHiPSFU6+uLR+uU/fjfedKFbN9Okk6Rme85tQBSdZdEvhlHGNC4aOA38A5o9Az1@vger.kernel.org
X-Gm-Message-State: AFuF++mRz9v3i7+xdz0pNZcZKJLIGchb26ELZzxxy6t+bo+vTyxdbhCa
	7l1a9mOvqIWNCsUSpwgZXQV5kSiwNhUtEmRuBSyoNdm91pzUz48CQtlMEtcY+dGOzlU=
X-Gm-Gg: AYBFou2yNLsl+cg0oJnK3z5ZE0tJsxRpAT2z5YfW7tbZ5SoQ1rTSHE7lEVw29xzsZ5Z
	r/jfAjYOGQ0BUYFAvXjNLZPLOnijgK3ybjpKK6O8XuUaE5XgKtoBnL/mFsux79Vr5Lrf6jkjXGv
	k+S7G2pk/clAZvDEPIKToipy+04pyblMT6pe6pu4w5YdGsFUH3S2DUGBifjXIO9WHca+FqS9RPo
	XvHni+pzTt/XxzqBh9HnpDOQaJyNpBcLL9KC5thGaQc6BjGxGFFmjkhje6j19g1TAS+oN5LQYBf
	76T21YH5cst0w/vRyBNOrU9T4NloIZOyGlxAd3TEKiQjpN1HsMqjopgOsOqGvig8Kk21oVa8m+L
	VrA9CHoNccKJrQh9RfSOJVRn6uoiG0+nbrgs4YhynFsqZ8TYBCdt6xm5X41smS5/ZQ/jnklDQod
	ohvgf20PQodI0iMqGisGZDuCVPl4hm4sX+8OHw5MVQ27LOLcKj/8arJOYnYIe/iBcZJfPyvNWL6
	a5fLGGjjBgKO6I9hTMoHTHKJl+rkKsVxVO0X5cPEFAqmDQGh33uQm435/8o98rwMPELB9L4RFSe
	VLa+7KM6OUcxMRuqRjje07tuOtBZxX90i+4pT+o=
X-Received: by 2002:a17:90b:3d91:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-396d0f016bcmr42950482a91.8.1788179525864;
        Mon, 31 Aug 2026 05:32:05 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm27470376c88.5.2026.08.31.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:32:05 -0700 (PDT)
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
Subject: [PATCH v24 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon, 31 Aug 2026 18:01:13 +0530
Message-Id: <20260831123113.870832-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
References: <20260831123113.870832-1-pavitrakumarm@vayavyalabs.com>
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

