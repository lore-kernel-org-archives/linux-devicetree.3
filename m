Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666221;
	b=s7/GEDamRT1NP5Pgiv/El2LRJEEH6pUpRITVLheP+iUSBgTXVKCQkQR8UHfkp38CeZUe
	 OfWF2C7AZjEbKIM6bjQMbo4ApUlSYL+y+/OBrQ0Ijc6LAPMDpAmBk+dupLsy7nbanEji3
	 qQP5Xv/7gVHACnDtiGYa1WPxWvpS44egeezDKnyYUQLKoDFbK4qRiEOHkPe293OHd6rjN
	 ZJgOyqxj3+yWQSBTFIwduyF5VwXTjVEg0m+o1GxsV2oUlPfKWrU7H3Xy3Xnm2mNyrMyTm
	 4qqCEO0+AltSksCcgEAvi6RIYjOnfBZXTRXufp0S6gjIJeD6MGYixfbsOesTJEnASFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=tZgvxOz4YU/H0u2tCkTum1gKhKwDed+uOF6VbmpClISmMgoBOhKi4VMw1uolFNNRJ9aO
	 naHsP8cmvBfjl48McKbvTaAwFEpCRClCJILmemse3PoFY6lVLB5NcDBQrL5JVfJ1a4loY
	 oK45cJZ3t0KN8RkHI7oqiu8gqaNFxzCxF1qBIG017CuVj8yACP78BMl8gKPgG4uNol/sP
	 965+Ae+EPEB7tr/ULW7Ma+gYqIPlXstr0XlQw6Jg5EvIKyQd1YuktsGp0HVrgIQoWDawt
	 NaAbL2dfzqdgr7aghe1R53KawWsYxxWvkzMrI6TeAcs8edQLjvmU44+iAmt4IDKnBuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=TYdHSwT8;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEABE606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 14:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEABE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=TYdHSwT8
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so2885930c88.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 06:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1794666220; x=1795271020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=TYdHSwT8Fdi7kBnH+zjEag50KdubB6uWXYmuHAn9YNQ89y7Nx3zUyLizRLtOiwY1cr
         WHiwi+6Y7gCAVmpQ5XZ1DXPDriJIVVBTi0T3aGkTzq1Ek15p46eTkyVwafb9awIJ+KCz
         mPKQ8lRIMY5r7wBd+7sLozRnFt5gkmrRUOcuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666220; x=1795271020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=GZ4GyI1H/maorCFbIAy/9N5XtNeK8L1HjTlvaVVuC+i9yoLk4MlHvUFyrSzxxNB2i4
         rIKQaAwqoOScCTVPlH+4JEnLCGe0OkD1lb374jWF4ttx90LKIo/t6/D9vhw/8jcFYIhR
         NarvDPtcqMinKKbx5GfjgLnJmcsnUChr7RGudzE8klk130Ay7l4mXz2pAWlt7z50iUrz
         m5Mawzeybncx87eaKX+PSoo4AIQ7xu1pNQdrXiUQ41pvEjCfU8VBMTNDE0NoSyg2hHWQ
         owmXdM/fFTAz7H+yMeGeVyVBkZWs4G3VZmKePG+Lml6+8gfIQYjT0CC2vwdwhJBrcrAt
         IWfA==
X-Forwarded-Encrypted: i=1; AL+hErHKUvj5UCFXiHt/Ta0Dn85m52twKQsT1hTFFQBaAEfFyMeqvgW9aKvUTQcUwmqjIAAlzIEXz/UN4EbR@vger.kernel.org
X-Gm-Message-State: APuU4Z8NIX4Ro5wl5XFYYi95IhDFnXHJA0NuTVckAGA1JkC8Y37ncnsZ
	uhi/jskIW5rsRHSru8Tp/+rJbsx/KEJ5TJDN87LVEr68FM5sZiKLt/2B427IDFYUG1s=
X-Gm-Gg: AYBFou2Gfni1JIuMewCS88wTNKunmppMK4F4AMn/b47n7znJ3GxsKwZDa3EsVGRk4SP
	uvEwQ444L9cAJ3XdvbAI3dVd6Z3uegjTjvbKP88oDa7fnLjiyNIfl7vZMV3hBXHZzZPp0LNXRrQ
	PoRMPsc8wNKca9Pcy7CkOHqdeuXYbkO/NGUI3lLn535vYBYKEYLyJmtwLvmVAHgYypG1VYcSRdX
	FK0NYc8R02WjGyKntTJdNRxaBZ78VV+wapC0jNoFwtQr7pxXZG+/6lJf/WqRc4GAa6HbABcxFeG
	kv6Ycs5qWA8/wD+2WLPU/x2fnbflzgScDHtCwz/Z/nV8FOwBOGcjQNicYBNGLTNMSdX0ADDtQJV
	Q25HkXwRfwfOUjMA+T+xBdM9tEE7Wfvjz8l6xOqXOd8OrsQ73KkjMUU8vfB3uNtWIp18F3/R9+u
	DARrY8Ob7PJ5to+kCvikm+jXePW30njd1sY7fXf2b1hO5MYQQbtdqKoyuRNBpW9LT3gXL0oW4g6
	qxYw+FYhbLuuhoRVDh243qLms/Awd02jKG++0snh0k55j+Ko0hKIASZ2ZddaEC5R/h0FCh17QKw
	Synkmw0X6a/WT5k/DqCoR+7yMzgy3Miu3WNIs00ZnLKyE8VLXWDPPbPeU43GOSI5jexu0uALv/W
	GwhGZslWV8pWpMWXPKOlj56Zt1GKSphsrjlE/qaBPkuRMwFeehEbegXM4MDxw5NzMYRYx
X-Received: by 2002:a05:701b:45d8:10b0:17b:fea8:1425 with SMTP id a92af1059eb24-1b50315310fmr6223169c88.30.1794666220211;
        Sat, 14 Nov 2026 06:23:40 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm19376962c88.8.2026.11.14.06.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:23:39 -0800 (PST)
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
Subject: [PATCH v29 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Sat, 14 Nov 2026 19:52:12 +0530
Message-Id: <20261114142212.716906-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
References: <20261114142212.716906-1-pavitrakumarm@vayavyalabs.com>
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

