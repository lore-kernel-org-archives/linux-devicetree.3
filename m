Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983756;
	b=FCvjfr1js9yXsO5MmuK0M0y1cyFTRrJdegapPDbiurPEUlUjAfwEo4yCA2DXEAmPNl71
	 yszR8X+H4h9Ka2uHyC1T4eBoXAI4LzGEBJop+4kjzPCq0uk5r6Fts2zxAzDoaLrcnVLoB
	 JrNxhbk8WKTZsqXcOevaEq7acgjU2XwPs047jjXKGGiA7v0sYAGmBviBTZ5QynxtexKuU
	 opxiALcj+tUNFJFY6KwXgeYoM2DWq66fopJXSujMsQ4ltkE8LxTQNHzH2kc5T7q4ybHOG
	 5Xf7lflnlG2FgkwRji/qY2tfVXrhTfE5Olped/0LC4KTIZsmlGIu1zyNrszwiqnw4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=bStToUc0c5/vL/MJEH0i+THzTWSMYFzcPXEcO+JfFsEYLSktt9YRHXOFGRr8JxjZVOgG
	 xmjtUjxpTzohXSSC04glJMVPo/yA+P2EP8cquvmrL2rry566KxKdpTNix4kkLXOukTOH4
	 jRT4cUED6+i+0WavTBpsdo4odIa3D+F0Zya2xNpO3XGWSDgvLwsU6Rz6sx0xfZH//5A8Y
	 pCr/DncbmC6HRUfm1wbmKeQXOI418Hxh31yfn8JXHvOKsySFi4NCRU5KtYdzFE1J2wkRD
	 GzOVP8YKdBcd/e4LOJ2ZId1+XjitiopFSeyoQbGGYAB9lCBpGki0OAEn12vMtjPSlTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b="BUGIq/fI";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86180606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86180606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=BUGIq/fI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380c28f9e35so1922428eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794983756; x=1795588556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=BUGIq/fIO9uIOIrlMQDHeKoCPKKxf4/yFsMrJpX1DTpgJZx3b4wOoHjQ+P3MMABBUm
         xGQr341C8zrbAG7AjCtmuqzMUM4tPmT3y2XbSZzSs8zx+83mZzYu/gVp1YPII4eWhP+b
         1+I6Ax3+vs0vJKIMDFgv6JTGJSvfP5ex/gJpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983756; x=1795588556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=mM+GWzrvwymxUEW9OBb6vERJ/f1uGbcGQ5ZkK4TC2OtFw1UBE5YmnZpxzZw+HfH2aV
         Ntn49PjNzf5/CLVnGlo3HzLdL3h5NMGBKZ1E0C61gDGxQ13xffn72ScxNj2x6HfWWTD1
         EDxHD51F6wLLkgwwuGdMlJaJzpdoIAij0elMjAbJ8dtgKM+kl/8lFDVQ7z9YKu/eGprd
         /Brnwk9WPUclCAH7kApZ4qsbUmmjDF0y1Ny4wxpSZBl3Ds/kiLdYDjwpE+DM927izI87
         T8Kw+GfKwAcOROP5y7+0jtB4NU1VlpU2fARPniVkWIJKveVgpH80IEHoXORmCUeBsJ7r
         wFDQ==
X-Forwarded-Encrypted: i=1; AL+hErHeACD/4lEpaT3k6PrlAUgdZS3ln7IyxazjpL92jeBTePxOKI5fBg3CehaWybm+BxaFYQVBgtq4ja5k@vger.kernel.org
X-Gm-Message-State: APuU4Z/baxASlf4T/CBFlbC6lSzwYG2qJgOyor3LRU0+GkL7tgkt+d0v
	qgp8nHeLSBeTJILFKxWxShXgqZ1IxLVG92yTju22m+wGH203J4Idt43BgAsJxaDBDII=
X-Gm-Gg: AZFdTZdVhKruJiFRbd7/D6s2nXIAcNK/si6Ec6Za7KKmpmTiAKEB7dlpHP2GrepLUAr
	Q3IH8zGcr0aWXnPqz9X8RTngknGRI3MvzlBxYhYhN6zeoKREwOrEHNMXHtZLSH4AJFlFamtvR3l
	Cbn9XQO7dOgN4uogztA1fdyZvGe8syiAVBzxpwRuN1p/DoPZ/IQ7K4hjNwPaGSto9kNBychFnTK
	5lXqaTAF5KyBicNYY7yIZEXwRtOqaWWkb+H4f/hdA9hlmy/tM3/mjH88f+/oxKscsx/KHqLOz2Y
	UXld7TCASdG5NQvKLAeRy4GSaDbr4v0fRr1rOdeB93Q0KOcdFyeNAqYXdUTR6akHw8W/3UuMcl9
	w6y+NCFQqP5dlygtkY+ZNz6TpClWUNS2PvHGtz+6eWvmC3zwTiBeSYgajToGP+z6Qo7g98V7Fau
	ln4spwWaUY79HKQ4oa/+liO91sfCXWLuRTb1jYfGBXI6VzH87RCP2TKHoymlJqEUNo5geQ81TiP
	AaAOVUuEbHk6jZq5kbYiOrf0523de0Fq6ee+Of3Q/N+LvtEbtQHhqsMGOxgJ7qzTyYgfPKekGJZ
	7qpy0/PX3RZExh8GlgT03ruOF7ryhoXa5oNzrRY/ASTucsLFM6NRnFegLxGE1rSLMu1Jl4GPxN/
	EeQwQsryFzcbUwo3udt27ACf1nikKLdkzFDWmFKLk0evbZ+MhiKgOC5sIR4zft1cOGX66
X-Received: by 2002:a05:7301:2019:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-3810e419e97mr4421701eec.6.1794983755563;
        Tue, 17 Nov 2026 22:35:55 -0800 (PST)
Received: from localhost.localdomain ([103.219.60.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm5002338eec.18.2026.11.17.22.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:35:55 -0800 (PST)
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
Subject: [PATCH v30 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Wed, 18 Nov 2026 12:05:04 +0530
Message-Id: <20261118063504.835259-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
References: <20261118063504.835259-1-pavitrakumarm@vayavyalabs.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Makefile and Kconfig for SPAcc driver.

Acked-by: Ross Bannerman <rbannerm@synopsys.com>
Signed-off-by: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
---
 drivers/crypto/Kconfig            |  1 +
 drivers/crypto/Makefile           |  1 +
 drivers/crypto/dwc-spacc/Kconfig  | 64 +++++++++++++++++++++++++++++++
 drivers/crypto/dwc-spacc/Makefile |  7 ++++
 4 files changed, 73 insertions(+)
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
index 0000000000000..b8a7d04209112
--- /dev/null
+++ b/drivers/crypto/dwc-spacc/Kconfig
@@ -0,0 +1,64 @@
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

