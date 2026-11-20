Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180517;
	b=KOf7sIsILzKoEmXT3mUftIaOz25ZFlAUjwsBy2xVaslGWPNG0OsiKELACshuCSxUoKLr
	 4+oUtXcn9dSdF/XI5MatL/qdhbfalPsL8aT235nEE+vEzzSmVUtBXUqNZ42bY42cXZOMt
	 RHCK6VgTjzc6bwTRrfnTIQmS5+k4gd3pQiqfZs0r5KPHXEzT4HCsbxWwzOKcCLox7eoTt
	 tzmtCpfWWz8E/h2IVXII0xOq2G/GR+Tm9M/hpnFSg/HTdtj31EP5e+Ho9BYnti0sAjQ+D
	 aqeq2ui93AxiZYT4JLBiZdmhUfriDm38NWlmCrXA7QuTQk04E51NuShouFooW8OqBHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
	b=1oDJMElFPi/jKelB1E6ZWApDTDoyiEd7Kq0nV0hKDh3XRcqLEpwWo8qPaJ47AmiT9HY7
	 VJws8GKEkYlv3/NfHerCEACDfLJgMnmGxOiluYvYmPkVKbJknzJyjx70IFZF4Iu9JXAQF
	 u2xFH9dnIdm+ggGXZ89pGTix1gIkANe2c9g09gpYextI+LUq33UPfCnrpnJ00iFxh1/nb
	 Fchnu/N1bS/fmlJpU7BfATgurlu8jhNHDpxhXLivm8Rorr3MFiZx+qLElynCW7Vz9Rz1D
	 mvdNOe7DEed6sd0cldrPLoMNFpKHs87VvIFIEPZDTc3q//cz056y/p8Et0crFrCLy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=KgsOidvr;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E1606A334
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949E1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=KgsOidvr
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38692f62b22so133211eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180516; x=1795785316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
        b=KgsOidvrbcO6fU1skx4kyAGn00NKAPLV/hJKqHJkE2Gb1+nA8QmttXwJFfGOJV2K24
         jmP4Hn4x9UcH14fvrHpIFH8g8ijrwg4cGrEXAaTSmOxk66ndFhn2CKGs+MfiHKetnQZp
         rRvOvcfxIe+M5+RvamgMlCdSmTzi2Wg27XTUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180516; x=1795785316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2Zr97px45Lj3XI6OkTDSQtGrZcMB3LLelnuX/SP2Nc=;
        b=ALyzx7OyCnftmTOpIkvevnOHQ7JweKRvGhc8k6g3iltFteQ06zale5lzyq1YJyFIE4
         Hm56otgZeaxiMlba6A8LOnfyFnWITLKDepO3ilEm5eK9TIEarorV3rx75gJgrl4GhD0B
         iumkgjil5GCOte+n5Q9gQvKo/5WOWVB37pJl4UGb7eRhDNATUeA0cTvN7OXFe/pP8Mur
         uGjrkQS37e/b8jC6fdGcDkYf9psZpYxF3bDz6zXL9bltv35bBsEFGGWqRbVHtsFYI5FF
         nWHnrDwpNwbkOU8XFbATBcUg8yHI+QhmsndREwFYTcMaCCuCS4+ICA5JgkkoCWsUkxmQ
         e/Cg==
X-Forwarded-Encrypted: i=1; AL+hErHfwvkQ1uNio0XaYnNpahmFclrYb4+br+4Y9hzcxurfunapFroaevP8ELoAcKQZqqwFaQah1gw88MeR@vger.kernel.org
X-Gm-Message-State: APuU4Z+eEbLJIUE/D1WNkt9p9BExP5k+BXQny8/sK7K9AcCSkDHjJ77w
	raDw9tiW12pFF0+R8XvGJqhHCgnBYQFvyxAzz03Okh+JIYQs/+ts+vA27/nh5SsvSoU=
X-Gm-Gg: AZFdTZc70noHzA1KT3QC+iJYRSGseSpCNt5cAEGvsijZH5d+mZ/GyyNiv8n0Jv9QtOR
	1tcmkrbEtiiukFc6UXqNBAEQoUxoSUiLk2vK0/YeAPTlh1JijBq6AtXQ/X94LwLfj9Yr0OMMB/6
	0ZmUk3menxN8TXwBcuWrtcWPiswpln+gmAH+8/fmNkRNZzLQZt8D3CSf9tL7/fOijLHB/QFVZ6Q
	QMHq8rQEFps6zDwqkw4KSRrlKRa6BJ51cCIHZvDsXcEdcjDsQhF6Jm+7rkFARARh/aQ1OC57uOn
	8RM+dKeYKIWf+jTtlnAVnncSlsIuxZKNl32ejQLnIQFLSEayCRsxIbgmqoyKEar1blKMtlMtHD0
	adp4WVIbuRlSv1HH6ocHIcOr0DxzY8xvrKIo8nkPIodRzVkFLuPsB3Kk0jbnch9igF6gNH4zlgo
	hTF1zmKsDHqO7zeL/n6gbYFN91pn4xsE3GH46EZK1RvMZzf6rGP+mvYzGbbQiPJngeu80FNmIce
	XfxEPP91no4oaDNqRFXhUq6yKImm3l2ZnJb2HhelMgRcbF/G03vAvkYx09YWVIYL205Ihb4ZE5t
	VE2puSoMHAUintj+L+SQIn2Nq6YzPT18ZwOmztUFAYEwvxxKG064cUPyF//EFauzZIe0AghnOB+
	yeUXkOk5910Y0i/AlrlYpWOHPI8iosbtYH8TW3d6HgoQweoKBKK925FcVqBAhQoceSMzb
X-Received: by 2002:a05:7301:4718:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3856e63afdbmr2767679eec.8.1795180515753;
        Fri, 20 Nov 2026 05:15:15 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:15:15 -0800 (PST)
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
Subject: [PATCH v31 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Fri, 20 Nov 2026 18:44:04 +0530
Message-Id: <20261120131404.976959-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
References: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
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
index adcbe15851899..ece06af788132 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -738,6 +738,7 @@ config CRYPTO_DEV_BCM_SPU
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

