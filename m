Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0944E027
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808191; cv=none; b=WyEh2AQnH23cnb85bz+iyG84c0RwwoHawQ3i898pmGSKDT7XDCG3+6XFDdEuIT73K9YoDmJlrK0bCKD+vc+T0sfHJ5Mypj9lrSeDNegWIZo3/XPTJl7noWKxa0pYwBHbFPsr1Xk6/95pr/OS5axmbfLcnOp22RRuDZij9m+FKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808191; c=relaxed/simple;
	bh=UIW2ukgKIySaDQTv4socc1nn10xiRiOnSqw40FjaZ8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1vWtRsIL5Gqv/u4uyaPUv9j8Gx9nnLYhjvuZ+groDIeGr2EE+8tvQVMpLQG6hSN0E/l7BiLM36ezm4RbKARKQYNDhWQAcgSQCrHyF1gWyIpeVLhYpTWTe1dtaUBqgmJeiwVMzQE2QL/hXFpvqP9WsufoE+El0FqlNEs4rB0aBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com; spf=pass smtp.mailfrom=vayavyalabs.com; dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b=g/9py92s; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.b="g/9py92s"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so556807b3a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1784808181; x=1785412981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sZV4euPXFPzPbpKN0UebnOT4DNBz+cy1h/z2qNpElg=;
        b=g/9py92sB7patRKkYAYV2ks554dwtpI6fw+Tetn/dYgLt8QqwlxJw6lDhCtVQsvbHp
         lArqlU9okVW3L4DctYrzcXPR3puO4TNfBwfHMXbB5SPCfE/oduatR6L+VxauaLZKfM6C
         o5vLpgdBhW8YHG5wzkuzKcvU/PVClHcM/PeCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808181; x=1785412981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sZV4euPXFPzPbpKN0UebnOT4DNBz+cy1h/z2qNpElg=;
        b=Pa82H52+M8GEvdberGFtLnv+e/RnuTmQ5EPjQnRq5Mn0Y7mxBiqpJMvFA7iHQH+yxm
         OhBy0RZhXK3QX68H3M+DDh4o6B1smQMJBYY98lla/exx0vqho1zhOdDassTdLH+jfpXI
         tVnqSRQ4NIh7kY338ck00dj9c88WXlb6coj7LaFoILReJPM11za7GOEBvdo6F+nOrYE7
         5NkYQD1XSkcXC1FGvJObMan0V3LfYXGAZwD/xP83cwq/Z5OvP+LVTIPXjXx29wKGDuO9
         7fV2+ez9NYM/6ogEjqAFoz0ZtDqN59jQhQCoUYlmkjwve+BuiSoQUdNDGcpZkQ33t9Ju
         po2g==
X-Forwarded-Encrypted: i=1; AHgh+RrUpBavQtiJ4D0PwMmx2e0y5Y2c84/3etiJYaBSc54Srm+sJBbsgRM+JUtGtAVM9PlfhNOKWnEXGWT6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4QaW2Idm5chVo1Hel8Rcpz+yicl6PAwQ5ZCoHaZtSkUumIDF
	stK/QevNGXZP+01OdpezVJDJ4nCwGQxg9La3f0tRKXqz9P9xqpwlJ9uUAIEp7GFB5bs=
X-Gm-Gg: AR+sD12rIGSs+566k4jO2E5HASraRkphLRyszjc4nrwvFHkoqWfwasFpT5JhKDXUtXs
	w217v2ikdILP1ezJ5UDmbNufTZzvVTetxM4ySFWdBl9zUJ55NMVXTJacYogfpkLd8jWjdRzm2+G
	PW6RNetsSoWuQBHcSvWTqRmJztAZjdpsWPjpTBolEDp6Vl+lMYmTos93OlMNkvukBCaHEfaAnTP
	6rJqSIY4SxVKBQtaUEPZCYvkeKPmj2sI5HvBfXSJeGvsu3O49Cx0xtlRjiFOj3WNMHsCuvqocVF
	oaQ5jXNWACOtSuczC0pNtw8Ep9oxh/QXXwR5X91qKLaMdkynGjh+9fEA6/IxjKYEejTsOvTa1Ec
	LJBuwqHRr9N9tvflq9L3y4BngpH8UDhHqa6a3qh6Luny35VkPuKkQu8dWPwJRfcsjYkEAwNQ5m8
	4lThiVt0hv2iPecoXGIrv6mJg4nbquchvmipvsf6VlnJvPh6a6MF36nr+VAUutY/eIAJrSfbF+3
	O08vdUgMAydrYCCA9MXCFekLBJxvs+TLZj30lXtG3RZ8w==
X-Received: by 2002:a05:6a21:2d46:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c44b25397fmr3017899637.63.1784808180993;
        Thu, 23 Jul 2026 05:03:00 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df06864sm19359125eec.15.2026.07.23.05.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:03:00 -0700 (PDT)
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
Subject: [PATCH v18 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Thu, 23 Jul 2026 17:31:56 +0530
Message-Id: <20260723120156.285270-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
References: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
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
index 0000000000000..bf70adc1a2084
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
+	bool "Enable HASH functionality"
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
index 0000000000000..0bcd2705a60cc
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

