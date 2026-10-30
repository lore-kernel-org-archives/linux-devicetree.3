Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381199;
	b=xlZ/kr9WMSligobvKWsR75/wCzrcvy8BNhXbB9GgSlOaFY7SqAKZjttO1FQMzT1KR/R+
	 /t07i8gTw2c0ooicBqV2BzCA3IkfYuP649yt18Bmo0TifOMvRd0S1azVrVG6lKUbAtx+f
	 PMg5RPBSJjLOLtrlHTovgKEH/ykktjfQyks0tsIuV1JI89mmoMmrWaGMeQCTX+Qr33EGs
	 bV5/eydF3M6JESRGSwrmqZYOS8eTIVaWXAj5E4W/muYFMgxN1oBGic+BYOQohVxW46Dli
	 wMOPpq4DxHn4NemfswbGiwsv53dOjERoyRYGebuqdoWhOfKQPPWeNJfvApjDfqeyp5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
	b=BRmSseAd3tP1I7QzuVBYbWVxy4egc9BhwuHFOJZKNzo+5HJY383drWOW+Nh9lxzLtbat
	 cp00GFAPtwWAM8G2IWoCZUz31wYDAEq/aWorXPkGqWKS4BAl7VCqQS8gkgEzpy4MMs7vF
	 OSyhmpN8WXDVWv6C2tJVCdZnlo5k4izhmjYz9Cg+nYNfLJRXs/+OgUDEDNR/aQyDH7wMr
	 S8fqRkxz1zWru19BYnfiAlwVmBKIyy//NjsSgX5lnUPNzlg3nA+3NKEm8FqqFS+2jkUPM
	 3M4PTChM4Y0pIxCnHf0ZSQ6Q5h5DI+92W01zx40/Gd8DbUwiKVIWNhml2RlufGmu/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=exTwvhbq;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D67606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=exTwvhbq
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36661f953e4so1500641eec.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1793381198; x=1793985998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=exTwvhbq1wSNUWxy4nWY0ZDbRBFEYpa9zSH85Fg5666ChEWQxB7CrKdbnHZMmff29T
         2ocTxig3Sz830hBimiHlnInuIOmRe03vkN/upDiKeCL7ZvtZGI8mbljfVM+Jd0k3o6FU
         BmGtyYbZcsPWNIl5J3T25wRnI4yq9Wxhlzocg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381198; x=1793985998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W7YU0nqnNfpCHH55J3ba3Gg8nFzbCN2KphX9SzD9hg=;
        b=HI3y1mBKCIpJR1pVgtl5Co/w5oJOjjXKu5KXzcCQJU1uNgiz2KBCkMTpf012aHVYfb
         ba/045h7dTp8wiHDsw5JLVzmXIgqht7xne0A0AvoPXFIMfSMRwWA8BI+eq2wTQmI8eQb
         smHzsj2GP98XChkp/DzjHxbU8IsWVxCcZuIvub3dx9iHF4P3hM8qQdFXrD66x0kzHpBM
         wQ/oY4g7rNHxNXl2L8rSacWeoL9daD5AlLhAQ50NGTPjuHX4piT7i83mqR14ZwaEzt8S
         QAJHRWYCdqmBtwvYWMU8dah5iD+z+3G4bxdhncsZDnRrt10rWknHfT5HQ8bjJqf22zHD
         ToHg==
X-Forwarded-Encrypted: i=1; AKwUvBzAezXZ0qwl7c6/aNEkHZH7Jm9HoCxvq6a2TizLaTblIZT5WI62KxQdGKIRi1hkA4qHLeSEoBh8jlWS@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ2n6HiXL07bebGxWSMorY9GqZEmWlKzBNrmdxVOXyRDBRoUIh
	9PH7C3q/wPr94O8zDCAlIwWZajnMgJ+xVp3wl686hh8/dXmB4hoD54I87P9OA2n/xww=
X-Gm-Gg: AYBFou169HAKfKy4aP8/sgwKRLY6bI5ToQePaH8F5ajGN1Ml5ReFp5eUdJFkC1W3G6p
	xiASOd+GjUn5qDgMItkxgBIkJFPy94c2MyO+4/aLFp8BnKVXxAObaJ20omrsAbbktjXCoNsB3lc
	J8v4g9y8FkDZDmNZaJU0WmnQNscdTqBEsDOjslyfwVLgKlEsd0EXIYnfRItn8ODhzVeHVJlB8dY
	vm3+IY1VNn9U5S1MFUn8FoPTpz4clF2RDi7z5v3YLjZrvlPN+cTFfpY640t5f4zytSY3dMqGYOC
	qocQ0Nc3wZYjfdZjOqom6nA6CxcZoBfgChgV2mYrrBUVepVlAb7Z4lTfis5jZBh+Zt5+KxGZUY7
	X7PaCbsB7fGwN6N/0ryShNkvNNGqO/SbJ4rwwonOGgXMHnuFdCv5itiXDawmfoAlCQnRQN3H03c
	7Po3/lynSJjqZWuuFLkAfSzq7ooG8pj82HQ/aD30VUx5miagtiRkoeWWs8rJuE6pUcTPf/BApRN
	fYsQ8Y3N9+StcjpaDr9ZaGK0EB2Hh8HgekueUDWVxacs8qZzt967m5HvYo6Fr+2QLwZaN3lHZN4
	hhyJBvocZKaF8KVwzgeNYzzA2vG1GZzvucY4vts0auepJH312GpedtwM6QINXimtfU7mp3nVBVE
	zjDPbVxl/Dq3sUsoFoF6hVRlZoSSOrMD07ptq8qyIDGiBr7IjrM5vGK2ZWrdgJcTvo8VU
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr5123560eec.29.1793381197701;
        Fri, 30 Oct 2026 10:26:37 -0700 (PDT)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm7641152eec.10.2026.10.30.10.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:26:37 -0700 (PDT)
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
Subject: [PATCH v27 4/4] crypto: spacc - Add SPAcc Kconfig and Makefile
Date: Fri, 30 Oct 2026 22:54:56 +0530
Message-Id: <20261030172456.274744-5-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
References: <20261030172456.274744-1-pavitrakumarm@vayavyalabs.com>
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

