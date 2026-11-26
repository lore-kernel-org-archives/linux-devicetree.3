Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721615;
	b=23Vw5y4YK6VJ8fb3GaDakBlEFTry/OUNsJoHq5Gb+SwY4PVXM5gn6hJU2E+dDyLWPGyV
	 idJfcCIWZXQbjzeigBHtqWnTpnPWEhtJYdSRStnf3So853u9XNshVVkRYp1RQWWcfHIhJ
	 kvmes3XytVDCXN5vkXLdKkriD4v6zoo3K/pWpZS3JofmofzagjTk2WkytmUU9xrOd7W4a
	 mffqj+u77hag8RuWW+I8+pIJdEC3bZ4YEyXgv6A8XbnweCoQ1k3nN4Sj4gIOUOCami156
	 kBfPdX0hjAv8v1w95XinBO2NX+IEav+zZyay8AfIrCzr5hZiF8BiWvIAIMTFAs5M9VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
	b=b/xeGDVsA5qqkEHeZYHrULJ4k7XwilChdOhm2gJdQ8Upj5I+1FLjDYgvASF4iZkA7kRw
	 O14fWTvQN5GjT3R7qtG2x5C5XXcrDqstpfetwp6glLHzrk/gUpxCJBpzmnCloCuAPU0EV
	 GPG5w95yhfioG+XNiPaWh7Jg1KcYmyWQ8t0qf9siGdyl3GKAOZFpvxXaxoGllexBgBqrN
	 ZX6xjKfzpSbMh3tpGqBmtkIbMnYPigmHYGBNov1uCnZarC4PoxA61qR1pZm8KKUBEVIPi
	 d3hKxtPOvMbagsTGsI1hAwNlRqoYnKykttGfm7MBcMzSxuwxb1HQAOi318DM4lP6nvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJ1FmaFp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3A606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E3A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJ1FmaFp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4982081f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721613; x=1796326413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=vJ1FmaFpnk118PCeq96TN+1PXccFqapM5JM4d5ZsDDKMoVoTC7cSr6ILqP3LoD795o
         w727Mu7VRyVjnihbwMM7xdYkoNDicyLqz5ELci3GerL5LeT7WQbxQL8bH+0BXT3oVTup
         INB3r6otoR9HN7dEupRQ657nIZGuAGCxaJmrdhJ00/EoZMBHAtSmVM+f1K87Ao8jPXTX
         rshd/VULn0zJCv3vLCef6u0B/EBKKFP/7z75EDPlh5TXcmYUZFf1VFud1QY+AglBXKho
         kxLu+RKZ681XnSPOtQs6hF6V7iyUENarjZLdCHCAJh4+bTkumEo9+ajccFl1l8Mtt/MX
         WRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721613; x=1796326413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=QJJPEu3BwidjFSCXLucz/Gg3NmkURawDXP16R+CLa53C60/yi598/2d7rS0siAWfA7
         qaAHOmjzhEvRGrOMh4r6Nhfwq49WaX/KUQrUgaPH17t9bhrIuGEUE9Z76XRKI95IMuu8
         jnhfpWloUdLU7bofC7bzyyZwepL/Ds0QHp/8Y38W0lp/DzcjUF0Ds5n14RUT/+DAgVmV
         UKK6gFiZxT69thWFK8E+vcs0Uqhg9srL6UtOm3tkWRvY8sWMI3Ax+mkJhuIOTN4VeNNY
         xfYcfXGhOTA3cUWLPsmOaAW+hnVMOvQ40cRZq00G/IWFtn+59pVQe0yPLxbrvgyivVWZ
         3ZXg==
X-Forwarded-Encrypted: i=1; AL+hErGaD0mHPUDzp0JWnp/M6Ukb97kLxA6RzkXgCL2KmBryircKeJ7oB5i06g0aRIb7MbrZH1mO2AxL2ZuE@vger.kernel.org
X-Gm-Message-State: APuU4Z/VR4bb+Sog3RWgw4Ap1ZVPYzJhBHYbjWzPVnbmJowK6Is08pou
	YELtEjDTG8qKtOJqr6ZWoU3baY7X7n+eieKsAVy/2rrF67KmTNmUjIXM
X-Gm-Gg: AZFdTZezJhpdV6sM6d3CqdeOb95aPDg/kdcYr+HyrQbl0YOe+bNvCw6p5ruK/zTwe0t
	hF1E6cy+FbCOovTS/LM/9Ib0a89FAWyD5dsC5xbTzFisJxY1bALMCxV7E+Tv98PbBmgUmj9Wn6G
	LXKm0edJArolTo5kScIH7ZkpdFgTvo6DlWsZeX/3j/CmplT078EoSUamjSLmHo0F95Bqy7h1WIs
	UaQl2QsHxi4P//oiFOS2zWmDfhXMsS6fUr8xx79pCSTk41wounI5g+/0vYafxt5mKfTTTszLbhQ
	UXcn/f1JMfuMWadzGUCzd10PB6vejwhlqeIbrj50SAGwU2GOOoeHfibFXZRkjCo52LFu3TnXvqM
	LZm0cIzYdxMRVyXNr4qfEP+NRU6rzfIzoKwiZ6WCZoiKJjw2pvrszP5Z04Ztx152GOy/tRzAkhP
	6VsUpoLG7YgnkSPoNuVeC1XLIVy3VdY5gG/MH6f6KsxmzLNTcFTtf5WZ8wXL8ez+HDGkk7WJole
	pvWw5NMWcS0RCMllEG8PIGTkDM47ldNmAyMep7DESVsZUmRp8JzBZQ84fAWgAMsoJZeAq/q2rFd
	4kgptWtUsMSYHQcP1r1mjCI7cfS/CbVn1VL3jsHMbzHDeJ+FdlRmV8JZJSpR0k89FUM=
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr548704265e9.5.1795721612906;
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 20/25] crypto: amlogic: drop unused field and stale includes
Date: Thu, 26 Nov 2026 20:32:36 +0100
Message-ID: <20261126193241.1471372-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
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

Remove the unused meson_flow.keylen field, drop unused includes in the
cipher and core files, and fix stale kernel-doc field names.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  3 ---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  2 --
 drivers/crypto/amlogic/amlogic-gxl.h        | 10 +++-------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 72892fdcd55d..c11ccbaf920d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -9,9 +9,6 @@
  */
 
 #include <linux/crypto.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <crypto/scatterwalk.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-mapping.h>
 #include <crypto/internal/skcipher.h>
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index e79175368d8c..90c817e412ad 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -19,9 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <crypto/internal/skcipher.h>
 #include <crypto/internal/hash.h>
-#include <linux/dma-mapping.h>
 
 #include "amlogic-gxl.h"
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 3f1ce6c05558..9c3df0d162b9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -69,18 +69,16 @@ struct meson_desc {
 /*
  * struct meson_flow - Information used by each flow
  * @engine:	ptr to the crypto_engine for this flow
- * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
- * @tl:		pointer to the current ce_task for this flow
+ * @tl:		pointer to the current descriptor for this flow
  * @stat_req:	number of request done by this flow
  */
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int irq;
-	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -90,8 +88,8 @@ struct meson_flow {
 
 /*
  * struct meson_pdata - SoC series dependent data.
- * @reg_descs:	offset to descriptors register
- * @reg_status:	offset to status register
+ * @descs_reg:	offset to descriptors register
+ * @status_reg:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
  * @support_192bit_key:	indicates whether platform support AES 192-bit key
@@ -112,7 +110,6 @@ struct meson_pdata {
  * @flow:	flow to use in next request
  * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
- * @dbgfs_stats: Debugfs dentry for statistic counters
  */
 struct meson_dev {
 	void __iomem *base;
@@ -181,7 +178,6 @@ struct meson_hasher_req_ctx {
 
 /*
  * struct meson_hasher_tfm_ctx - context for a hasher TFM
- * @enginectx:		crypto_engine used by this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  */
 struct meson_hasher_tfm_ctx {
-- 
2.47.3

