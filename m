Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795232515;
	b=RxNBQ7NJQ8upBklgRTS5j3yAf6RbT03ecYOqVmzmtwFjBKhqKq0c4UpqEQItnnCNx1if
	 C6UYxn2n/Xyf76msOwJpb1NWjBQnUOI1I9hJQaVH3Gr5pRnaTaRI7aWJ3MBBz/cGcv1hG
	 dfae72fXvdWE77J3BtiD5vgQU0JCZek0CM9QRrNXY5LmyaMyoVDeAHdLjMWGzx2gDg3Jt
	 E8qZV9q7v/ut2SscoCbtfl5sMW+uEneFQDv255++OLD7bndQXUKovzKczBysxx2YIPL6n
	 T9o/K1EyMmxhtLWVH2G/VeX/qnSOMXlpbs8/aZUPNNAWTuN5FHBpidX602yZdHJNkZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795232515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kJZsEvQkjwtM0z9/dpxgzPf7D4sJ4j0CFIrJuHV97Tg=;
	b=yAUq2rGmVWxKPyIUOdD/diJadLdje18G6CGRG/Fp/II9M9KL7NeXW56afs+8DKjok2Dx
	 Vi3Ud3yKVge5laHsqUHv1ySeqHfAiSNMtOk3/cacvvQeWD3GehkRd56S3h2TluVe0LZXY
	 55X1E3LmqctTZciGDS40DJKvpvRxSQoKbrFRSQR+HCetACzc5sJlIR5MR5iBgzDipy161
	 h0gQuJ2+JoQ4F82Dd8020Rz0FIuFMf+nvb3WiJ/WStQkg8I+P5F7TxOWYwWxjCMilKRJu
	 cZw/UqpwcNZUjrQlAISVjGtX/Dk0dIts8MGkzVd/qJO9KDs/VaJeOGy77RrvKmwXA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ti5sirnI;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A7606A69E
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 03:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8A7606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ti5sirnI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-380b40319bdso2032862eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 19:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795232507; x=1795837307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJZsEvQkjwtM0z9/dpxgzPf7D4sJ4j0CFIrJuHV97Tg=;
        b=ti5sirnIz52T84qwqQD2AQa2e6xW/U2SjRKU2YGH1H9B29TKkrz0Y+JxUkudar1/c/
         AKNNSzR7BaD6MCAkIMosqdGGKbNAKn6ydVGKuW1d5MfUsjGsLCMLMEkBtJdyrtjpn0EC
         WgrGTGsmsBJLc2xH0VkWUd8SLMTlIuFIe3zxODTrQY4FYPVa/IeQ4C2TQUDhd9ao0mM9
         OCwYZTkuMk6am1zanzyz2SKwpxFYctKL8Ut5QSY25fO+lKY7cFXZm8Hf0F6XxA3U2Iqk
         vmY5FuYA/t5T607wfZExATFr8TZfI76Xn9OhyenVvWKO32BpqkoH1VyCLVsZPFykiFXh
         9saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795232507; x=1795837307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJZsEvQkjwtM0z9/dpxgzPf7D4sJ4j0CFIrJuHV97Tg=;
        b=k0WDN3N10oKCQ4itzPtSYR1g8ycctJAW1l9uGrcjocn4gFMq2F6e3fBK8FuGA61G65
         yOtl5JeAqcLbPII6MTuqxQ8IeI495lrYz+SgGiSdfNTcdaPC1lML+kTfLMEFNAIwURms
         TMookofzCfLWcEfYK1ilmod3Y1D6XMPOUvB2huhLoPP8/Mfoljib+mpJITOmyK8EH5Ty
         xJifRyvwbODDE+5x48q09SS4GCWuxuIFKAF8QiR1d0KMDDRPwIY+zAbQjgQBq7y7rFKI
         QTl+DFWbLdKqpoaEqelHA0oPyfQ5o4wL8Mp8PGQTGevTZKAxa7icJecLp90gFyU+f3It
         A+3g==
X-Forwarded-Encrypted: i=1; AL+hErHI9Fb3kcUy8UtoQlBVPRWvq+UMOyKICTWYviY4EqLmU2elG/D/5ErHHAwCGGM2hNsWLArrZSIFqzC4@vger.kernel.org
X-Gm-Message-State: APuU4Z8Urqmv8UgvUJygs7ab6TJHKT/vr5Na2UyXU7SPRVVlgmbM9PH1
	og/9bJbc3BSMQ6Hf0TXbfK4hZUSIpvvw/Fc9hu12kKsBvANFwlSp9Gfp
X-Gm-Gg: AZFdTZepBFVTnqBIaLIOUBcHfAsRej3Ov1KwpRirN0qM0VtJtjV/WsNrCnZo60uIEnl
	mOoDOCThmlSMZSL8fj7H+sFeR4OKAIz0f1S+Qpcr1ctYDOjUuWlyJzE3iod8yoPXPYtxBZ61O/d
	4yC21/VXO+0p/Vg1hKlTr2jswqkvQoj/+nokraf+jFbnV1FzUtjDhYMAFTva7cXGt1PLnigxLya
	qkxc2SRHG4GBer/Iw5Aj8gufMoUUoE1xQ6BYA6N92YFEHT9XSbb8eOh+DYgjV9pBZrmkGy32IEd
	ae1gS6MPVnEhDllbgz4EgYfwDAuSl0Qo57OljoJj6jG0IvngEwnEMNC0MuZJax/cN1Fc1DOgh40
	MEwic7Iv0pTswy8Tp+W8ergtThWWDV9MMFZikKWuG6XujLYns1b5sWj50K3EbWXzik2bVE8W5Yh
	sr4aM+yTw8jLYgphWtmqrAnawThXzqJlk4mkGbUNP+iAUGI65HGBOdcCZL4QxI1bRc2N3i7Q/zu
	4o2EWnAyAJ1JNIqCunbCdk2TVscYKSXP4BmaNny548lV5ht99u335BHJ8AIDqn5Zgk/Lq7vDh1X
	3b/aJZjKt8GhOSfa5gcgUKVBDQiHgibUaq17rUj4zPBU63g=
X-Received: by 2002:a05:693c:88c9:20b0:385:d556:1c41 with SMTP id 5a478bee46e88-385d5561e1bmr4081752eec.16.1795232506657;
        Fri, 20 Nov 2026 19:41:46 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm20891464eec.3.2026.11.20.19.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:41:46 -0800 (PST)
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
Subject: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Sat, 21 Nov 2026 09:10:53 +0530
Message-ID: <20261121034053.39878-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
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
 drivers/nvmem/nvmem-aspeed-otp.c | 299 +++++++++++++++++++++++++++++++
 3 files changed, 313 insertions(+)
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
index 0000000..e4b3a8e
--- /dev/null
+++ b/drivers/nvmem/nvmem-aspeed-otp.c
@@ -0,0 +1,299 @@
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

