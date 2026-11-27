Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780918;
	b=NY4GBMMo8q6M7QKRYUxI4iMUOeX9EuYMfQiCHp6QoxJaGsfVmZfqDi+tzlS+IOgPZ70O
	 7rhxLLPTODikHMR0QfEbKT1RMTtVq4jSHTIKk+gTsWHqdGqV5Jlg3K8gntEWcXqbMZmCn
	 PRgQ7LCBissQnShRCZxmY0nde4aMyDPdnYKLm/ztgrWLuu6SBcBK3O3ZcrVDWakVXaXnc
	 M1WevZ+GYI8xXtCkBRfrrfZXAxYckpbLYTch9Is7aUGlq5BjF4JqFleEXMoKJAVV9EIZg
	 CNmHxb4YsY7T3+z6GKlNFSnwHprhrTIQGaOpYqKapqFN6tyn49p8CID3R5AgWsTInQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
	b=re+GrpeNNiYjYdgf5Tt2WKOwHOMtfRk0l6y0UmL83Pkf2rFG59bByVkQxfsE06MgrLwM
	 +bBGXGVGc1B/R15fg+MluiYlFZ7YGaFtStUjXBIJefvUZ0y5Qu+J/sgkulwCkYBFSFc7s
	 jbtgyATpP7gzwp45W7d/lt+t2atP1Ltkyi+7MKVbpMDuiMszrQiDrlfZEoqTpad/s3LtP
	 hdFe0fsi+v1LwSPYXCSxYUzXSZZMBKylIAjp6lD248j4seKFSxQEv/Bu48E1FZz5SM65O
	 5Ppy7KT42H60ODYJ+xjaho7tV2hCdts8sqZ95FalBP4F6fkjLTJwxCLLzZeZBqr9x3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL1VGL0h;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5C606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF5C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL1VGL0h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so24930155e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780916; x=1796385716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=AL1VGL0hkPX75OCRXg0YznDdFMteUJOh/tMaD9S/64LQWYS2a+CpWhanRLTSpmft3l
         y6TaTfqMPYKe9XZOnZi3Mlq6DFqOfHDRvFXNJd9Ki9DmXbr/tqnUmEeUbomO+gh8fQXy
         TjOv8xBZSGb1Lzn40oRgWXFEMJUYCjEI4JxCsWnVWjUkqGf0WKB5Bio5++/gygZpBAvP
         MwWFHkc5ODtyrjNCMbSjUfbXv37gxDjCAVxYj1Xvm1kvJHPga5ktCi0aTw8uzkEc9UPC
         Cc+Y3pOctpK5xpjvcLO2DZ1npPGy5nGvfIo/emnZB4qhWcqI0BPR1C8UPAw0DyTlKpFy
         OBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780916; x=1796385716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyu2YD+0JiTqu9p5NWdi6X2hohcRvSGgQozAHaYtXMQ=;
        b=f9iIQ8OgHMD4zDtf9TdTOEgnFWv8qLN3WNRb9Eng6UGAiwEB7eMkUr0B0eebZCfc0P
         DWDYIJj19IXsMBwu3N2sft40xIiejGmCLjGo2MydTliZ9DaJ/zcauvM0514R5eAUaaa8
         qVZxYrpezHIj9cXqt6rHPQsSPsMnxgQXTxtqoC9Woq7FAYwAFI1XZ5wGHTEtcpxkiPaF
         ClIwV5jUOj61QDhmeeiucaO8sWJJNNz+sQGWWtVXCdlb9zPA9cWLZK13nx0yYtO2NWNL
         J+EWXfQOGLHC0MtKspzEpYMpAxR7r1Mxb51wsXDh9iwtAbdbvEclBWHZf3RKun1RdDBf
         RI+Q==
X-Forwarded-Encrypted: i=1; AL+hErFS2OJdGoZqKzWqhLN8dahzISRl7Bl0HDXEOxwEb9XmJV46Ih4CfU9meEkAOjofN/jpdyh6m41rZ4Ik@vger.kernel.org
X-Gm-Message-State: APuU4Z8bKUPd6H3J32LDLOIe2mOlMRlZDdt6xHRwSjNouGIPBiaKJyWm
	FhDOIlAZOQ124GkcXR2xbJGGpgUQZyGXSA7u/0RhkwiIDasdy34ALxrj
X-Gm-Gg: AZFdTZdaRSDMd1IO8DcsTPNvZPdgxXY99dirKCMvK0oZfmJD9elOzsFEAKcUfOEIC5w
	UThr6I6kyPLhMl3zPevSuxxqN0oQqnFb4/lW8OqMRP9dLRiDXzULk6LYzhJ2pBZOI/7xxrYcnM4
	BSd5pZQCADykFGQda3RrqXdmORIhF5Qgs6F/OBshutCXqTmkYUrgcAgMgEEf2WqUxE+Ztlaw+Ce
	de722HLb15zWW+SnEZxef83Gau/GfRl8pvHH7h1Mw5HeCQZQGZTIwT3mOIJQ1xbw/gWEbmHJItq
	njxWMDSKCzqLRh7UCFm4BC8DjzZF00jbt4weEaCCFRp/d1qAHmzbAlu/elQsGFSwFj5N7gX1Mes
	dB+Bo/9Lj2dAqlL0gCUS7AY/6Cuamk3RZBVkQQ8sm/+pgt7QknjR5V8H4JYaYgyjOaR15M/+hxB
	Z5VSeK9HDvDhJ4aHbyXiWjgex3Tay94fBx8KG2/QX+cNRu+5Z0v1qUvXcQ/IbN96hopaXLBkMkJ
	ZwQeboOYfHhVpCZnVGCtBEwZxtxpITFLLj5kCgJyhRMAvT1M21qDaqtDDyh68gMuL++tKAeCAMt
	+UtREs/xh0aMmYqG0HpqlSXAuuK5vIdkOLxZoq/uVc6YgVQ=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr517059715e9.19.1795780916248;
        Fri, 27 Nov 2026 04:01:56 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:55 -0800 (PST)
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
Subject: [PATCH v14 20/30] crypto: amlogic: drop unused field and stale includes
Date: Fri, 27 Nov 2026 13:00:53 +0100
Message-ID: <20261127120103.1532882-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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
index 38b9645386ae..8ce3f6640753 100644
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

