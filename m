Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748368;
	b=Gi6nHRcwh46C7S/VOQujr2JfS+pNxQ6+r8dT3w+f+axJVv59fVKLEdJdRHF2YJK6NqCz
	 aaTzBKk0qh/BDIKr93b4DEBPBpOktlGBIbWRg8UeFUUGns3UxRWdc9wPmzL00OjmIMKXF
	 I6fWFQgM31rlRmp7X9XqQGO7sqUo3usC/rVMTNfMX0B4D4NImucs8BbASGaDg2KZGt8tm
	 Y3OY5Wv/kA27fBzZWnFpeBkAGzm8WIJeaKACNEkuSdGr6Erh+om23eDGtM4RzbsrbtB1h
	 3UT/GsYhKZ9qrVQQKnTz8AclipwPO6ner16YxvDxz5Hk83bG5LMDXwLPiLRTeRXECbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=;
	b=MpmKuwOZ4A013f3W1pRfGNOTYt23uH0aeyZNcaiLJLpQiqGHtrCp5VllAGpe/mtqIB4e
	 NvmU4WuwYs3W/0nGms/nvPuYAZs7Nqa6JAYNlxn8fR0wGDbgq4i0CBmyGR2F7BWp3vmM0
	 fDZQv7A/e112vDAOD+Tf6CxH+3vNjIGt4JSiFHkkS4GzbDSH1pBRIkh+uROONXSJ5diSn
	 /v8Xlo/xu/dtfV0w8r7yayuk/qMJKsCUp3RAUg/GPE55IUnSrQpDhOTtlKLGt1Wdy4Dev
	 uRHxZHAmQ1KdsEczhNtJMXiHriMhabqELXPSdkbNTesXjwCUYL9YkxTvb3ocFKhN9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqRH47OM;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8692606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8692606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqRH47OM
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b563e32936so3467163c88.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748366; x=1796353166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=;
        b=zqRH47OMl+egHdme8o4AoEc057AOP+6Gn8M9MhySGtfrATp4QzpwYcmG0gaHbUxXNa
         Zj8dk5pR27oNjFoBjoN+v9CuJSMgL1Qj+i65QGDyeHVEm1z4D83orY+IXtlfgr0ZSuXR
         U+iDRTOEc/bhBs7PWPc/+YZC8x5d5zyzvx1Oqft2iwyjih33ux11XW7yQTDGF3+CmqjD
         AFlslOaYFv+sjw7OlA3ohgg3xAfOCS1kqtQW8zFC3z/LG92BvzGW6r8+TctzHiO4ocgo
         lXpI2okeKo2n7OusfG4HxwuaGTkE6ngqF8icoEYsnBaSHtfKsv4XwgfIyVo2dmvY4UbV
         AN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748366; x=1796353166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vk8QAimfppOVA6mWM6XoEd6S6tNQdHOsmJkxKjoB4U4=;
        b=NT9KBlCna7Qe4MMXWbVhHAC7Mj0gm27cnNFXaAvE92DQnzd4Rr0W8wkYE8S4gaYVuD
         EZzTY1kdFNBCeZvGXYY+FkCeFDMnuchd4KRfB8CHce2U5Nt6fU/HDgv0blGFeRMO7M1z
         +DrnQMdupozC/t3oiRiuvOcx9zjKd7Vz8inMcLHytG9pjPRUiXi6SojME9H2HqLvRm+I
         mCiOZ3K0UUfZSN0GL7OS0gPOtZQDIcbWlOJ0G9oth0VKsNT3AlncUHxEz3TrF1eR6OXO
         8JWmsVrsw7zZdLchit07J87w1Ion7yUrFwNk19q0PrbZpnzID/qnJN47EvbVkovOZfsY
         k4sQ==
X-Forwarded-Encrypted: i=1; AL+hErH8nh2KPfgJhxrA6yXlPT1oFrOMpGc+6B7IL9JwdafZt3qHf0S55Dm91OqUKqzCsRG8jKCrQRU8xfWc@vger.kernel.org
X-Gm-Message-State: APuU4Z/j/D9oYqnrdtQk/FkapY1CTczTjyB3I19gLnQ8/9zj3gxWnsp/
	bihowjfu+j9r8GKmlaN4+L7RYTFB8qUlta/eedBPKoAzhXq1/Boa3LmV
X-Gm-Gg: AZFdTZd8grHsKZC7JZS9RChmrr3sOCJMmdk4PX8uaMr5hElZNitaIe3Cm7wYaCqZf3g
	mX3eHnf3SZGWAFlr+gevMYoX7/WFCK6Afs1zUct86/CPJGJEPHUxXBUhweNt6kHS+uaD4RDr3A/
	QR66wyGxG2UV9RnjmDnF0NBH3qJRU0vTfHCJkhmxTKl8I1U/rOShDiDBdKU5c7C6MPIwamSVsps
	ZdzP80OmP6tvFMu/lUf7CXW4QijSnozhv6tUl92h6DfEKe5B6ggojHBi1W6sW8DhpTB4rUkIFir
	eY5cAOXHN0yANB6RM1LswQrfkNdH0qP9IWCx/tDH0Qa9RhJrPBETIkfJUmQTCJRQkwTn5owi9LB
	qVfX/i9zINSJyJxb1HL+kSs076lp38tt4U+Ia6JPKOZfO2cxx+EL8XtR6qX7lKhZjYpH2EPaMpk
	gloDWM/X4HNbPFND5J7bpHwmWrkKVw5sR2NsWM6tNZD9aHxn/Q0JnepSUQYln2UU8Tidmy+kaQM
	gUNovUgxLDnwX1HnAHxXVgI8uEDdzoNIDYYK885Ox8vEQm4IEqy7Z9jWRWwdVwDflnMuNX0cGWf
	C+IKMADxySOtCB9LnWEoK0kyTI60nIp0r0Ny4p6erPAThr4=
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id 5a478bee46e88-386e5715040mr2828954eec.13.1795748365932;
        Thu, 26 Nov 2026 18:59:25 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:25 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 27 Nov 2026 08:28:17 +0530
Message-ID: <20261127025817.20090-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
References: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
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

AST2600's secure boot controller provides an 8-KiB OTP data region through
paired-word commands rather than memory-mapped storage. Expose permitted
words through NVMEM for privileged userspace bring-up diagnostics, which
compare raw OTP offsets with reference reads; no named cells are required
by this consumer.

Earlier firmware may leave the OTP macro in programming mode, so Linux
must establish read mode before using it. Programming protection does not
prevent reads, but the configured secure prefix and SEC54 restrict the
readable region. SEC54 can increase until ARM reset, so a probe-time
snapshot alone cannot describe every later read restriction.

SEC00 relocking does not cancel a running command. Since there is no
documented safe retry after a timeout, stop issuing commands rather than
risk overlapping an outstanding operation. Normal reads take less than
1 us; the 100-ms bound is deliberately generous, not a specified maximum.

The read sequence is adapted from ASPEED's downstream driver.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

Co-developed-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
Changes since v3:
- Drop linux/mod_devicetable.h as requested by Uwe; platform_device.h
  already provides the required declaration.

v4 validation:
- ARM driver-object compilation with W=1 passed.
- Strict patch checkpatch: zero errors, zero checks, one new-file/
  MAINTAINERS warning. The existing ASPEED matcher covers the driver.

Earlier v3 validation, before this include-only change:
Tested on ASRock Rack B650D4U (AST2600 A3), Linux 7.4-rc1:
- ARM zImage build with W=1 completed.
- Repeated 12-byte reads and cross-pair/final-pair comparisons passed.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched the saved ASPEED-derived reference fingerprint.
The kernel was RAM-booted with the working OpenBMC DTB and initramfs.

Host-model checks passed 4096 protection combinations, 200 copying cases
and 24 timeout cases, including unlock-failure cleanup. Strict source
checkpatch passed. The existing ASPEED MAINTAINERS matcher covers the file.

 drivers/nvmem/Kconfig            |  13 ++
 drivers/nvmem/Makefile           |   1 +
 drivers/nvmem/nvmem-aspeed-otp.c | 298 +++++++++++++++++++++++++++++++
 3 files changed, 312 insertions(+)
 create mode 100644 drivers/nvmem/nvmem-aspeed-otp.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb2..65f6a88 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,19 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_OTP
+	tristate "ASPEED OTP support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Say Y here to enable read-only access to the OTP data region
+	  on ASPEED AST2600 BMCs through the NVMEM interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-aspeed-otp.
+
+	  If unsure, say N.
+
 config NVMEM_BCM_OCOTP
 	tristate "Broadcom On-Chip OTP Controller support"
 	depends on ARCH_BCM_IPROC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad..ca62940 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_OTP)	+= nvmem-aspeed-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspeed-otp.c
new file mode 100644
index 0000000..cbe05fc
--- /dev/null
+++ b/drivers/nvmem/nvmem-aspeed-otp.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ *
+ * ASPEED AST2600 OTP Controller driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/unaligned.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define  AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_CMD			0x04
+#define  AST2600_OTP_CMD_READ		0x23b1e361
+#define  AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_ADDR			0x10
+#define AST2600_OTP_STATUS		0x14
+#define  AST2600_OTP_STATUS_DONE		GENMASK(2, 1)
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+#define AST2600_OTP_EXTRA_READ_PROTECT	0x54
+#define  AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)
+
+/* OTP macro addresses selected through AST2600_OTP_ADDR, not MMIO offsets. */
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define  AST2600_OTP_CONF0_SEC_SIZE	GENMASK(21, 16)
+#define AST2600_OTP_MR			0x1000
+#define AST2600_OTP_MRA			0x3000
+#define AST2600_OTP_MRB			0x5000
+
+/* Normal reads take less than 1 us; allow a generous bounded wait. */
+#define AST2600_OTP_TIMEOUT_US		100000
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct aspeed_otp {
+	struct device *dev;
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	struct nvmem_keepout secure_keepout;
+	bool failed;
+};
+
+static int aspeed_otp_unlock(struct aspeed_otp *priv)
+{
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1)
+		return -EIO;
+
+	return 0;
+}
+
+static void aspeed_otp_lock(struct aspeed_otp *priv)
+{
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+}
+
+static int aspeed_otp_wait_complete(struct aspeed_otp *priv)
+{
+	u32 status;
+	int ret;
+
+	/* Wait at least 1 us before the first sample of both idle flags. */
+	ret = read_poll_timeout(readl, status,
+				(status & AST2600_OTP_STATUS_DONE) ==
+				AST2600_OTP_STATUS_DONE,
+				1, AST2600_OTP_TIMEOUT_US, true,
+				priv->base + AST2600_OTP_STATUS);
+	if (ret) {
+		/* Relocking SEC00 does not abort an outstanding command. */
+		priv->failed = true;
+		dev_err(priv->dev,
+			"OTP completion timed out (status=%#x); further reads blocked\n",
+			status);
+	}
+
+	return ret;
+}
+
+static int aspeed_otp_init_read_mode(struct aspeed_otp *priv)
+{
+	static const u32 mode_addresses[] = {
+		AST2600_OTP_MRA, AST2600_OTP_MRB, AST2600_OTP_MR,
+	};
+	int i, ret;
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	/* Earlier firmware may leave the macro in program mode; restore read mode. */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], priv->base + AST2600_OTP_ADDR);
+		writel(0, priv->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, priv->base + AST2600_OTP_CMD);
+		ret = aspeed_otp_wait_complete(priv);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int aspeed_otp_read_pair(struct aspeed_otp *priv,
+				unsigned int aligned_word, u32 data[2])
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	writel(aligned_word, priv->base + AST2600_OTP_ADDR);
+	writel(AST2600_OTP_CMD_READ, priv->base + AST2600_OTP_CMD);
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	data[0] = readl(priv->base + AST2600_OTP_COMPARE_1);
+	data[1] = readl(priv->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int aspeed_otp_init_unlocked(struct aspeed_otp *priv)
+{
+	u32 data[2];
+	int ret;
+
+	ret = aspeed_otp_init_read_mode(priv);
+	if (ret)
+		return ret;
+
+	ret = aspeed_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR, data);
+	if (ret)
+		return ret;
+
+	priv->secure_keepout.end =
+		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, data[0]) *
+		AST2600_OTP_SEC_SIZE_UNIT;
+
+	return 0;
+}
+
+static int aspeed_otp_init(struct aspeed_otp *priv)
+{
+	int ret;
+
+	/* The provider is not registered yet; there are no concurrent readers. */
+	ret = aspeed_otp_unlock(priv);
+	if (!ret)
+		ret = aspeed_otp_init_unlocked(priv);
+	aspeed_otp_lock(priv);
+
+	return ret;
+}
+
+static int aspeed_otp_read_data(struct aspeed_otp *priv, unsigned int offset,
+				void *val, size_t bytes)
+{
+	unsigned int word_index = offset / sizeof(u32);
+	u8 *buf = val;
+	u32 data[2];
+	int i, ret;
+
+	ret = aspeed_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	while (bytes) {
+		ret = aspeed_otp_read_pair(priv, word_index & ~1U, data);
+		if (ret)
+			return ret;
+
+		for (i = word_index & 1; i < ARRAY_SIZE(data) && bytes; i++) {
+			put_unaligned_le32(data[i], buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+	}
+
+	return 0;
+}
+
+static int aspeed_otp_read(void *context, unsigned int offset,
+			   void *val, size_t bytes)
+{
+	struct aspeed_otp *priv = context;
+	unsigned int secure_size;
+	u32 extra_read;
+	int ret;
+
+	if (!bytes)
+		return 0;
+
+	if (offset % sizeof(u32) || bytes % sizeof(u32))
+		return -EINVAL;
+
+	if (offset >= AST2600_OTP_SIZE ||
+	    bytes > AST2600_OTP_SIZE - offset)
+		return -EINVAL;
+
+	guard(mutex)(&priv->lock);
+
+	if (priv->failed)
+		return -EIO;
+
+	/* SEC54[5:0] can only grow until the ARM cores reset. */
+	extra_read = readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
+	secure_size = FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	secure_size = max(priv->secure_keepout.end, secure_size);
+	if (offset < secure_size)
+		return -EACCES;
+
+	ret = aspeed_otp_unlock(priv);
+	if (!ret)
+		ret = aspeed_otp_read_data(priv, offset, val, bytes);
+	aspeed_otp_lock(priv);
+	/* Complete the lock write before handing the mutex to another reader. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+
+	return ret;
+}
+
+static int aspeed_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "aspeed-otp",
+		.id = NVMEM_DEVID_AUTO,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.word_size = sizeof(u32),
+		.stride = sizeof(u32),
+		.size = AST2600_OTP_SIZE,
+		.reg_read = aspeed_otp_read,
+	};
+	struct aspeed_otp *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = devm_mutex_init(dev, &priv->lock);
+	if (ret)
+		return ret;
+
+	ret = aspeed_otp_init(priv);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize OTP read mode and secure prefix\n");
+
+	config.dev = dev;
+	config.priv = priv;
+	if (priv->secure_keepout.end) {
+		config.keepout = &priv->secure_keepout;
+		config.nkeepout = 1;
+	}
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id aspeed_otp_of_match[] = {
+	{ .compatible = "aspeed,ast2600-sbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_otp_of_match);
+
+static struct platform_driver aspeed_otp_driver = {
+	.probe = aspeed_otp_probe,
+	.driver = {
+		.name = "aspeed-otp",
+		.of_match_table = aspeed_otp_of_match,
+	},
+};
+module_platform_driver(aspeed_otp_driver);
+
+MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
+MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
+MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3

