Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196767;
	b=Ia7AgHGxsuJNz3N7HKgmhZ08+uU9Ho4CGQfEwxGNHC0484p+9xJYmAvkGXadauAoKcOW
	 Jf5j/vwHcq1zLSm36Vq190Dc9DGIlbclJDbFxAEt+C2oj2atkJC4M7p17o1JUXsJl8V6P
	 OjpA2z57J0krUSebvJsD5GXtmVuMDNdxiJpFb2xWYFRzY0ionRRM51UFZ2yunfjghKFR5
	 bIpdy5K64ueTn8+iDD0y55DOVgyoMJ7ah7UgOOMh0jVLvl8MK/dusDgZJyrp3C2GaYWAj
	 SyRkJYPbJ/uY2AJhIgvtu8len7SISC7B4Wo1F+L5fkcxcYDsp5EdgoOPJng4Ao/twkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=;
	b=D66UMX3TL5IaAiVjTdFyFN4CQ9U2Nhu9c93NGHECMH9M/OOsohgaR/lSJ6wALg3ovZNo
	 cLlvtBFTTMF3ZrMOwnTLVhrYw7v+MOqOGrS5OVCz8ZJcP1XSClHn6zqIcXcLGM8CliqPX
	 vXIdVMvgwSSeD3BFD93hWgkDab9k7pfo7q1hG2Fi2LBQtlrD6+zJcBw+zNjFzwb0y3Orr
	 evQ6Iu/+ozx4dh0j004lrwQJFQlLyzw00ZhVEffKkWeziv0yeqyXBBgUExOYjccwsWY9Z
	 GUIaiK8tAcruix/C+SMaxXI6ckk31ueWML5MXkmT0kz7dJd+cgRKf+ATaa/Eljg1buw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byUXVs2t;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8160A262A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB8160A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byUXVs2t
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so665339a12.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196765; x=1795801565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=;
        b=byUXVs2t1c8P9oTR8+3GOSkGC1vUkjvJbGsl6gqfTr0MOxPtl/UJnUjQhUKuNFoQy9
         tkiEt9YpywyDCMJoO635uxGLsF+l0Yw8Qh9HaS0CSy1MFlBJaes24pYqIUV9L6ztZdN6
         gTMPwnW3UWx/iwJh1KJEXXdI9ikwCcphYjq1u6Kkm+P4k3QWcSSCacw3fBEmD4iIsw+K
         LhdaAFjI4Kvx/h5fgn9CXpFAbOhU4+7LCxgdHI80KaDXGdoZA+x3ldB5PQ1OrZ4ghw+v
         4qm3pto+rSb2zMn2vgj43UkEDPMaJQCQBNmJ+IGraVZ97bbFb/11Y76DFhS0ja050wbI
         psDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196765; x=1795801565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSYfrYFiyiWUa6vglkKUJH8L/QpY4IKzTr3jG0NxsxI=;
        b=C6z0mgP0nwKohi3y6tgm/KkezrK87BL0uxVXidQYe141ZRzrS6+dNDvigljVerA45d
         bQyVmzhaTdk0X1REc/1JoFukfthdiS7SCMher2FNnWGmHPyNWQEwp59HGs46sLDl6Myr
         PEv149vm+abN/WtRQY6R4W1nHarJzqTrzLXPg8wlzCcENJTzSOHdLJPl1YkfcxZdvKTB
         u60+gGt1yjYTOV2VIzmAI46p7chpiJnWOZrBgn0ArzTkI4bQaB6muT3EUn6RW1N7ZRuY
         99Tj8xoDVb1KxCwYNmKTMafQgQIv0dRwgKKqVTYsoRN4yQpV5bDDi/47NEtxRJa8jJaa
         5GDw==
X-Forwarded-Encrypted: i=1; AL+hErH11INZKyPVHO0zRhm+2MAsldC3zPzSgqZb3qPOcEGyU/nIOzUAoPpFJqMbwQF1MTHBOg7j52jch+wD@vger.kernel.org
X-Gm-Message-State: APuU4Z8KDKsGNt0QQp9JH4FjdNDmoGymNMwsmooasVQrToqMd7D5etc7
	lTGPvSs9DwSYU/C5OKfuPNTz0XNugCP+Sx5dmghNB7cWU7eGsJt/vJMo
X-Gm-Gg: AZFdTZdBYDEWHKNpBvCge5tfoKAmDZlbttuHwFeudSlqz/02AOp7+Ydxa+PkLwnOw0s
	0lQ1MrZyhVPn2eC52If/bIJsd7JLnFlzKSoBWxgVmMtKqrh3yuFk7qCB25hSP+8fMFHDZDcyhlz
	sJDffwgWr0NJdPwdMFHmEmejLZzyEhCmbN/tdT59sldWVpNCHUWrztxl5eYDk9w4dSg5s8IcTuj
	/XnTUlnzZlxnLmcNSyDuHtN6JJTfEv+h9pJ/1MPOAwEQ4mRzwrMeWizBdusYw83cpvhsTwUXuVk
	ey08PDpS0+ehU16M2+bv8WU03sqlsi8O/kGCcaYyDVplNlnAvutbaf3wL8eqKzLAvlrjeyqSsmp
	q/L8yb4voRMnlfR16vkfkfMXy6OAN34A05MzrTMUkJBP0/h1gh0IR6SFPpmb7tqO8uCV2hKOcjb
	s5xVxlw4J29V6ITu7cYh50m0++MTizAJH/wqJqjL0gDHmrPOD9k4AQsF6wclRvNrtx5jT/m0MgF
	7r8CSqPbXaGJFZYcqkzEh5ie3/znR9e5oUiPcGyTAWgLNtyZ/2Fwq4y5u5zO/DplzwVe4P6a+u7
	onQJj04q6h9pxZoYQrhq33Gfa8xPqn7nRR3KO7w5SO899w==
X-Received: by 2002:a17:90b:3810:b0:3b4:ac3:8af2 with SMTP id 98e67ed59e1d1-3b41c9cf6famr3366186a91.27.1795196765314;
        Fri, 20 Nov 2026 09:46:05 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:46:04 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 20 Nov 2026 23:14:40 +0530
Message-ID: <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
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

Provide root-only NVMEM access for userspace diagnostics comparing OTP
ranges with vendor-derived reference data during BMC bring-up. The
consumer uses raw offsets rather than named cells or a private ioctl.

Initialize read mode once at probe and mask the fixed secure prefix using
an NVMEM keepout. Recheck SEC54 on each controller read and reject requests
into an extended protected prefix. Programming protection does not block
reads. Serialize transactions and stop issuing commands after a timeout.
Use a 1-us initial polling delay and a generous 100-ms timeout.

Adapt the read sequence from ASPEED's downstream driver, preserving its
attribution, and add the driver to the ASPEED MAINTAINERS entry.

Tested on ASRock Rack B650D4U (AST2600 A3) with Linux 7.4-rc1 and
OpenBMC Linux 6.18.24. Repeated reads, cross-pair reads and four concurrent
readers (40 reads) passed. The selected 12-byte range matched a saved
ASPEED-derived reference. The 7.4-rc1 run used a RAM-booted kernel with
the working OpenBMC board DTB and initramfs; its final-pair check also
passed.

Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c
Link: https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/
Co-developed-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

---
 MAINTAINERS                      |    1 
 drivers/nvmem/Kconfig            |   13 ++
 drivers/nvmem/Makefile           |    1 
 drivers/nvmem/nvmem-aspeed-otp.c |  297 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315..5415e2be4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 F:	arch/arm64/boot/dts/aspeed/
+F:	drivers/nvmem/nvmem-aspeed-otp.c
 N:	aspeed
 
 ARM/AXIADO ARCHITECTURE
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236..e6445262b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -164,6 +164,19 @@ config NVMEM_APPLE_SPMI
 	  This driver can also be built as a module. If so, the module
 	  will be called apple-nvmem-spmi.
 
+config NVMEM_ASPEED_AST2600_OTP
+	tristate "ASPEED AST2600 OTP support"
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
index 5e70bad9f..f09b7a8a5 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
 nvmem-apple-efuses-y 			:= apple-efuses.o
 obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
 apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
+obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= nvmem-aspeed-otp.o
 obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:= bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
diff --git a/drivers/nvmem/nvmem-aspeed-otp.c b/drivers/nvmem/nvmem-aspeed-otp.c
new file mode 100644
--- /dev/null
+++ b/drivers/nvmem/nvmem-aspeed-otp.c
@@ -0,0 +1,297 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/unaligned.h>
+
+#define AST2600_OTP_PROTECT_KEY		0x00
+#define AST2600_OTP_CMD			0x04
+#define AST2600_OTP_ADDR		0x10
+#define AST2600_OTP_STATUS		0x14
+#define AST2600_OTP_COMPARE_1		0x20
+#define AST2600_OTP_COMPARE_2		0x24
+#define AST2600_OTP_EXTRA_READ_PROTECT	0x54
+#define AST2600_OTP_EXTRA_READ_RANGE	GENMASK(5, 0)
+
+#define AST2600_OTP_CMD_READ		0x23b1e361
+#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
+#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
+#define AST2600_OTP_STATUS_DONE		GENMASK(2, 1)
+/* Normal reads take less than 1 us; allow a generous bounded wait. */
+#define AST2600_OTP_TIMEOUT_US		100000
+
+#define AST2600_OTP_DATA_WORDS		0x800
+#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
+#define AST2600_OTP_CONF0_ADDR		0x800
+#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
+#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
+
+struct ast2600_otp {
+	struct device *dev;
+	void __iomem *base;
+	/* Serialize the complete unlock, read and relock sequence. */
+	struct mutex lock;
+	struct nvmem_keepout secure_keepout;
+	bool failed;
+};
+
+static int ast2600_otp_wait_complete(struct ast2600_otp *priv)
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
+static int ast2600_otp_init_read_mode(struct ast2600_otp *priv)
+{
+	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
+	int i, ret;
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	/*
+	 * Restore read mode once at probe; this driver never programs fuses.
+	 * These writes target volatile mode registers, not OTP fuse cells.
+	 * No fuse programming command or programming timing is used.
+	 */
+	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
+		writel(mode_addresses[i], priv->base + AST2600_OTP_ADDR);
+		writel(0, priv->base + AST2600_OTP_COMPARE_1);
+		writel(AST2600_OTP_CMD_WRITE_MODE, priv->base + AST2600_OTP_CMD);
+		ret = ast2600_otp_wait_complete(priv);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ast2600_otp_read_pair(struct ast2600_otp *priv,
+				 unsigned int aligned_word,
+				 u32 *word0, u32 *word1)
+{
+	int ret;
+
+	/* The hardware reads two words starting at an even word index. */
+	writel(aligned_word, priv->base + AST2600_OTP_ADDR);
+
+	writel(AST2600_OTP_CMD_READ,
+	       priv->base + AST2600_OTP_CMD);
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		return ret;
+
+	*word0 = readl(priv->base + AST2600_OTP_COMPARE_1);
+	*word1 = readl(priv->base + AST2600_OTP_COMPARE_2);
+
+	return 0;
+}
+
+static int ast2600_otp_init_keepout(struct ast2600_otp *priv)
+{
+	u32 conf0, unused;
+	int ret;
+
+	guard(mutex)(&priv->lock);
+
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	ret = ast2600_otp_init_read_mode(priv);
+	if (ret)
+		goto out_lock;
+
+	ret = ast2600_otp_read_pair(priv, AST2600_OTP_CONF0_ADDR,
+				    &conf0, &unused);
+	if (ret)
+		goto out_lock;
+
+	priv->secure_keepout.start = 0;
+	priv->secure_keepout.end =
+		FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
+		AST2600_OTP_SEC_SIZE_UNIT;
+	priv->secure_keepout.value = 0;
+
+out_lock:
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+	/* Complete the lock write before returning and releasing the mutex. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+	return ret;
+}
+
+static int ast2600_otp_read(void *context, unsigned int offset,
+			    void *val, size_t bytes)
+{
+	struct ast2600_otp *priv = context;
+	u8 *buf = val;
+	unsigned int word_index;
+	unsigned int aligned_word;
+	unsigned int secure_size;
+	u32 extra_read;
+	u32 word0, word1;
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
+	/* SEC54 can grow after probe; keep the registered keepout immutable. */
+	extra_read = readl(priv->base + AST2600_OTP_EXTRA_READ_PROTECT);
+	secure_size = FIELD_GET(AST2600_OTP_EXTRA_READ_RANGE, extra_read) *
+		      AST2600_OTP_SEC_SIZE_UNIT;
+	secure_size = max(priv->secure_keepout.end, secure_size);
+	if (offset < secure_size)
+		return -EACCES;
+
+	writel(AST2600_OTP_UNLOCK_KEY, priv->base + AST2600_OTP_PROTECT_KEY);
+	if (readl(priv->base + AST2600_OTP_PROTECT_KEY) != 1) {
+		ret = -EACCES;
+		goto out_lock;
+	}
+
+	ret = ast2600_otp_wait_complete(priv);
+	if (ret)
+		goto out_lock;
+
+	word_index = offset / sizeof(u32);
+	while (bytes) {
+		aligned_word = word_index & ~1U;
+
+		ret = ast2600_otp_read_pair(priv, aligned_word,
+					    &word0, &word1);
+		if (ret)
+			goto out_lock;
+
+		if (!(word_index & 1)) {
+			put_unaligned_le32(word0, buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+		if (bytes) {
+			put_unaligned_le32(word1, buf);
+			buf += sizeof(u32);
+			bytes -= sizeof(u32);
+			word_index++;
+		}
+	}
+
+	ret = 0;
+
+out_lock:
+	writel(0, priv->base + AST2600_OTP_PROTECT_KEY);
+	/* Complete the lock write before returning and releasing the mutex. */
+	readl(priv->base + AST2600_OTP_PROTECT_KEY);
+	return ret;
+}
+
+static int ast2600_otp_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "ast2600-otp",
+		.id = NVMEM_DEVID_AUTO,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.word_size = sizeof(u32),
+		.stride = sizeof(u32),
+		.size = AST2600_OTP_SIZE,
+		.reg_read = ast2600_otp_read,
+	};
+	struct nvmem_device *nvmem;
+	struct ast2600_otp *priv;
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
+	ret = ast2600_otp_init_keepout(priv);
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
+	nvmem = devm_nvmem_register(dev, &config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id ast2600_otp_of_match[] = {
+	{ .compatible = "aspeed,ast2600-sbc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
+
+static struct platform_driver ast2600_otp_driver = {
+	.probe = ast2600_otp_probe,
+	.driver = {
+		.name = "ast2600-otp",
+		.of_match_table = ast2600_otp_of_match,
+	},
+};
+module_platform_driver(ast2600_otp_driver);
+
+MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
+MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
+MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
+MODULE_LICENSE("GPL");
