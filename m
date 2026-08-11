Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718AD43CE6D
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786448108; cv=none; b=P55YdFUxAu8cvqB1r+Bz6xFlu1qnvpbKShO+n3ZrxTxj5XWz13Mze8LG/iCuPMxPtZBFCoNpEPPSBxy2cQK3KLWovkitpp6LpMhGIB6TrNAz3Kej6RZDeKQ93MjXusqDQErSSz6t0GnZWCoP/VdrVVE7dOmgZbfutDGTZpvSv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786448108; c=relaxed/simple;
	bh=+vYSXAdB7mdZUzzraaWojPzoKc/WyC01Fzwr3gps7GY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mk6Z1eRd+MWizbTsQ3vG8m/Eq11VWD5dqS0v0FpEpYEKhyC9prWJwfEqqRjCscfIDxDjloO/6pTVy/tvgk9y6ZFoYTU+Rgz+zW58TIug71DKsMcD7KBrw8c+VlFEL0mxnNddjCisHUj67D30Xf3j9JcHfHgB2z9cfvGnk+T0jjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=Jhd2QMI5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="Jhd2QMI5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2806513a91.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1786448106; x=1787052906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=Jhd2QMI52/iLcJ3lJcKkKxBYOB9v9d6Rf/aGf4IE0MIc2zuWK5dixHiqXP+lAqSYqL
         zkU1nDTsS5VnG8Rzd6NphxdhupXkgSTwWdXz1UrTcALU/ig4Ri7Hi3sxTQPGjloWgQZC
         U/6tmZUHcCRnfT8owi5qi4JU6uKBCtXxQVRow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786448106; x=1787052906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=XGuoJUWCMbo42h9lg+9AmngouH4aelNLgwwEezzF94cU1n4a0AE+KHZLB6yziD40Ux
         l879m5+MDfRy07BBzhk1BO7OZ5aDFXF4j2VJrmBffHwKt8oGVAmu1Sk5Xz5nabvQidSx
         pf6iuOgMquVJr3HpzENuypyjz68TEcWNRNlwHNWpbgEJ2w+Y3dFccgrnzAUybk5F21gk
         9Gt2QX9RR0YEb2B4I1gdRdFTxdlvDLz0I1jX+1odtj+yCOMAYPauuoZr9Cw0GRZVmfb9
         A5vwbCckpG7+6uyNGfRA0gVJR+p2N8dza+aUObXd8Woeo50ZzgCmbf4J+V3I/dMVkYCU
         0t9g==
X-Forwarded-Encrypted: i=1; AHgh+RqkLS9jB65c/FjZd/ozxKMUGVMNa+RfjnJ/fZmmynE1M/veN+3JPUbOOUJIyuIy8Nxb1Xw7Mi07NRAI@vger.kernel.org
X-Gm-Message-State: AOJu0YylrnNzj1IzSVt0DBt9FMvGu08oM7OGDHDsTLzqsZjOWGr8CHD/
	u6JH2Xc9NDShIBoTmKAGbaT8quksR7pdryGN+HxzUDDUKJVJF3RXwJ2W6xQOnuJTs0o=
X-Gm-Gg: AR+sD12JfBMZ/IHQM0GHoWDEXMqQooC2l+zoT3tWqw/pJWxuYOe5TQs2RAijPXDUFF8
	SwjF5PoIdTrcSf81E3qSfbip53ep29FfVU3FtRbWgM3FVhHOzi6c63w3cLXUNeV9Z/Ni2Hwv+fT
	Urz4gD5yCy7OuKsKO0gUsUmNL/mBlG5GFoXVFtwIKf0InItla4JGlPK/uxqTnWeU4Z1qa+vOjdl
	PTrH3yHeiQhxwU4kFxZS3obKKR8oQzQl47lG3y4Bp4Sikm19QaNNtqj4uH+1B531Id+VD/qSVI0
	4mQOIQQy8PAzPM+rcTJJ3N/QY+6dm4pFSZ56ibk3h8exYnCQSuajBuB+5yfTVxKug9ZPfKxrCE3
	XZ8MWHcB6fBP0k4vyEUVuzGPhhui1LMlmY+0V7Dgkf1vOfAFiieYuHSlGjNFiUE50dz2lSPL2rp
	sCOljeAEOHcEBbFgwLYAVTI8THxzQLZ9d2Dwh9HNP+UOHi5cp+J27vkUdPSt82lDEQmX434BvUk
	SX8bdDSO2ebGI+2khJgwRu8xdWKOyZAaelbX91et+Z5NQoeNoH1vq9G6iouyBby5akePXpVwpP1
	f/Xuimm7gyrlg0fI8rNk2JbZLZ8Y
X-Received: by 2002:a17:90b:5907:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-392ec52b258mr3009969a91.12.1786448106483;
        Tue, 11 Aug 2026 04:35:06 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412035e08dsm4983584c88.1.2026.08.11.04.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:35:05 -0700 (PDT)
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
Subject: [PATCH v21 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Tue, 11 Aug 2026 17:03:50 +0530
Message-Id: <20260811113350.632737-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260811113350.632737-1-pavitrakumarm@vayavyalabs.com>
References: <20260811113350.632737-1-pavitrakumarm@vayavyalabs.com>
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

