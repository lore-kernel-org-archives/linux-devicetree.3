Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427170;
	b=n12F9iuPhrqR87f217eTEoC8dq1jaoryViURpu7/Lv3FgyoVkjIC7X/XQ1TRiZ9EzB4/
	 fko4wETK7D3oHNPN/dkIJ5SCcCW4YIgfHXu57TdjJeAIyEfBnLG8YbvSzMi0gfP8tYYlF
	 aVimynrrgQrjsY4695I/805lEg8ejKhMvIo9WOT5Kp+K61xaIeem2EFw4CLLvpG8TF/Xo
	 yeRZOWwiYd9/6UBJexUfCcG+4C2FEs/Us4Mt4p2vmlK7r8foroyiUhyN/OVvdu05Ricgh
	 X0ldeYOsk4F26UjSdq/jBHAS/FUmwHhY+CdyE8c427zdbcOYGfLhvRttf7m97nTvIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
	b=IQ4bEFOy6zqilbmMK4dE8AwMCXtISba2KpHTxmVC/xIxEGWhlQxOtG+GfYnIg5cNtPxL
	 /LMPbUdf4TyXdG40eo1yGYQMiuIt52O+j65i8Qg0zQCUoqKvJv5sPKwUXdDmztUO1jmGS
	 KKk5QQMjT1WQloFGzE51EuAxPZ137NQLyFBOiTyaguch8sthq03ahcbbFsvhcqEEB2q/y
	 r2jvdx+HpCDkQvwqlHii3HJ5y5xNOUNpnS8YkjYAIS/SCbfSXx809iCSQps+L9cgSmMLY
	 Ginx4F2Jifk0jW3zKx5fdAlCb5Rz5bHgzIi5EKZ2DmcBBpY82iux/6tCd23q5zsQ8iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=GJm0gref;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150560A3822
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D150560A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=GJm0gref
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35d7fa491deso2786133eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1792427169; x=1793031969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=GJm0grefAxiKvDAd6m9AgqHUQj4RTV/yJB7OnXO9S1cadFdhSqy+D/Uwjmpifz4B/s
         xyTCLsoqDYeTxA4v55mDBmPcRQNwxvaTloD/YwmDs+KyzIcZeHANhUVz9x/xA7EWZ8Q2
         H+XpleDqWrjM3S64MO/2OBODkcIgMkKEiS1CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427169; x=1793031969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfdZ+27dsteNmPPWYcAlJOh1CClxN+nuAUGat2n+hNU=;
        b=W1Fykay8nGWJz9/R+AGKqKaqxpA9bG+56GI6epCq2B9Cp7Pb20LgMcYS1IFfSPosp2
         J9ztjTWmM/ZMwMJufjqcpYvf9u6tx+057cxJal9k4XfCh/hz7HGxsXTCT1aDS2et2WQR
         zMGHmzjrmJbNzkCN9kvMyxNw0We/NGvnt3gpsRmBJN9e5ePlHNsjztGt7u5THJIITYgl
         f1LEp+TdPq429XGmOM5B0hbLhVw+ts4BWmZxnjdR5s1SdteRQjbvgIStGOR75euP5+Pf
         siMcD7ZQp70ZqDWEspINT9H+lKuarc5X3sp3xQvIW2XDKRFs8gmFfSuU9uZE79is8Bhz
         R63g==
X-Forwarded-Encrypted: i=1; AKwUvByPEk8jjAip+PsAFIewhMrGXzkRppw6ns9ncEZRMz9FjEebLgxPcGJ7jn8FDCuPziCzs4fYCxgG5BwX@vger.kernel.org
X-Gm-Message-State: AFq9FYJgp4lc/wkGkeSqDNyGpryzAf0WMKFHgEM4j4SfIuEzlOmIWpmX
	cM+dZNu3bx3Kc/x2J8Uu0738N3AHSb3H5tmizIhr/zBGHp/lP/YnT37CaUjQ7Fmj/70=
X-Gm-Gg: AYBFou2g7/BA1gEXw9SkoJcdaVKa+y6K1SDGUcW8CzX/Sv9qHmq9WSdzassdKWS5PWf
	4wzQw6PFcfmsroQncOx8DKjencTN+H3Yb1z5qKRtnkGVcNxW7sUH1sV/Fi4A2wNTJtQI1NN75lx
	pdYTDUhNpVOVKKGz5G6FO8ABDvcsFJHeCTqxCdL7Hr+pTrSwQnlGs37whpXWN9RLZKpa4akrb8l
	3T7ZWTw6aGUs1FlleXE1BTX0lM/ujP4glDZ6deaqauiZmgOjK8MwbQJygaC6hxdxqo6dIUifVJZ
	6e7/y0adEfmBZiGJMdjJvMetUeEC0d/Dj47VxmiborNwCeANyKQeCKAjdEW4z1/tnQnf7RHLEnt
	tr2ZHF7ayYSzrK6KtY1aTameWuLTVnDg+kHRkInbzf/cFSYTDYBQz87xUDJAj2aOJf03SgoLQYH
	J4V+Tsk8S7fH1AednHOwc2WZVBxogbS7bviNUdc49vpP1skvCx3ibsmEhMJjdLGx0vPzMICgGHr
	ilmxInzLDn2t4xcarZYjSKvm1GS3GZxN5dI/B5gvRtj0ItveDxrpXPZnWR2Nw0ikXyCP+hzVITb
	2rhFxmBeOTwDbmjkp/2GM8z3CsdJG8c1rbk+QA==
X-Received: by 2002:a05:7300:e9c6:10b0:351:606f:2832 with SMTP id 5a478bee46e88-361a16689d6mr11727614eec.3.1792427168698;
        Mon, 19 Oct 2026 09:26:08 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm32218885eec.11.2026.10.19.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:26:08 -0700 (PDT)
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
Subject: [PATCH v26 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Mon, 19 Oct 2026 21:54:57 +0530
Message-Id: <20261019162457.1000115-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
References: <20261019162457.1000115-1-pavitrakumarm@vayavyalabs.com>
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

