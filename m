Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721589;
	b=0od0McwyHQmvvKfVauxczy930ks/Hh2sDuAAhi3U9mbDxJ1rcE9XkL6NXRRocceV7YXf
	 iQMUANckcH8CrhyZYzd23pyneTxw8TYtMpKi9t3jnstOqLSMr8dNY0xH6xyWYxNJumwDz
	 uPPmEov3SxZrJZT9x4Egh8RJ5D0tai3vts0fk0Z3yntSGjiwmkSbhKXwIstMq9YhZaWPu
	 sIuMlXlLrx3c1kG9cZ/SxEf3i2jIUmIqEKLsRk+FZ2lW5LB1Pf73XauOyotoZJzLZICJr
	 6a+8xcC+ONPTemtbGfRdzLmlbx0CdOL3oerIrmLN6WMid2ZA6HNi80bPkIZUOY0BH6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
	b=lnQ1LBmDgufglr+rnyHuoqSgOL7zn8o6AQoWYJAIWEkOyXM3cUrxKGR/nNvu2qdVBWFw
	 4gzqdd7g+5+hImjXTTxyHz6O1Rxg5gNndSwj7G7jhu7bDTd0rgqnNyOcvsLB2HYX+Bmkd
	 0jT0MbBGV/lCZxuBRqnoghX/bue/uFLCvtyDBHRRbtlfJvqerjq250lMMqt4XC9y1NfVB
	 jRodN4B5GMRg5f/cmLC6w6l1D0HjF/2rHkZbxHXfSKhWjlFdXiwmyUfVXpl1p+AXHICqd
	 BoxAooeEZjMo9nxstjzep0/IL1kL+ETS9vnjhCVOjD4qaHRqG4MwBSQg0IZRtgwPwNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qp/xR+KM";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DA606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qp/xR+KM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so45009455e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721588; x=1796326388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=qp/xR+KMn6PiVlfwtym8sGxp4vg9UXSjfc/ep/eUwq1Zw5TrgQrRMvp4uK3T4ptcBz
         HDfcb+uaIMoJAYTe5PqBTEOLWbswacGcS920H1vlvoSxD2oY09LsW4IdqeRB7QyMo35+
         2hc56CzTlJ/4MzTvYhmhxN5Z+dHxvcF9RWKBTH+LavBJueIo8X5Oe9LnwdHuUanMvTXi
         jKNTB0LXEsgPpIw6WrJYxNQQJirlqcWP0+QTQJmxGCQU/nG+CSOrKuUFHpMNvIWB6/2X
         HwIjvqQD2dO4GEL6InxTZTDDMFPmPva0u5JVP2RwCbe9Jc1C0WSerIJcQyyalnhkxjba
         zq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721588; x=1796326388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uthyLmx54eP91qPBkkIsXEHnEP4gw+2z/PB/gcG1vQ=;
        b=oeC+2+L1PBZQ1tAXBB45ngFulvuilEnl8sXcxkTFQDmSRIdbCYwLAfWWS58pmCmTTN
         mSZ/AJSVbTRAwq6NGxFX+z+uef6WlfkL2n6kuMAHL5TZGTThxhVo5wS1CPDImF9ufuNe
         /qo81vowmEIc0QwXWdFqYoHK5GUH2+X0cb6uvHMRYAc6X5HWsLPsE9UYvXdkHfsQYhrW
         Z9pgY1nYVIXgZ/qeTVjs9TRgpb5W4B0RAAvmkiJJGzftDORD4wBuXKuYFGsnwGfzqCwr
         3Iv3XVtt/MPv+8pDp765Abb4qQRHy++jMZf/r/MzqW8l6e/I7TnKs4QNXc5E7hb/15L3
         s5oQ==
X-Forwarded-Encrypted: i=1; AL+hErEhknrU5JiUCIHuGn5zGKPE1zCsJ4NMNOfpBnGYNP4D4orXqc5dTHtXW0JZj5M7+OnB6BqXY443+7lo@vger.kernel.org
X-Gm-Message-State: APuU4Z9D7QzMN/Y6WSr7nXkns7/zpMXh6AJa0aih29muge3nl5lzBMZr
	ltIDwSeXn8roqBUosnbobMM1b2KeLTxTkuruzbIVOaCTLUKpuDafxQ/r05VSgikslTg=
X-Gm-Gg: AZFdTZe+g6xn4MKFYtzP0j4PNAZZbSTLyMOolASEU0UTruGhWO2vTFdZrhwK07X4HVz
	xhsWIXtgF0/NZ8Lflmats/dgUwKGm2pSTcaUC24gO8udCB/+tjQW5LgUOHl9RbCTa0WTrQHzWHS
	HGFIROAmR0+8Tgu4HxTqX2y2DLz4+Mw4xQA4FvPESO9LwP7kRh/wANtEdy4qtphzmx1csVomOIL
	Ws94hixRaKOXlpZsrbD4IhM1PXtVYHSv0og5fyaq+Drf3TjeXunxxTu+o5nP1ElOuIRnNUjsq4C
	9l08hdN4xvl+v28NtBnhOfP/kHlk+REepNnB28ztqyrEzgGnHxjhl6AIoW9XBiLJjAClwJU/JJB
	Ie+v7soE1iCxfPypObOlg2/GSJHvrG8WFQtCvNkjyj+qjupPcY7V2/f3zXLqPcrTy0M+4wqqZL9
	gWa4WKxf3slxxBVMs79+vhu/Jok1YcvzHkZT6bw1wtHlhudwGZWpxnDWCVgnxympunbwAsYn5tI
	+He877t6BL4PWojidBb2u7/V2DOc/628RPsHzsENQ4aAVHKc7zPjfrEpd7+lcAdj5C3nO7Sd3LI
	WispRO9gn4vAZBBUR+gFY9cJXt3rkb/14tztoRHRnua91g==
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr457062975e9.32.1795721587613;
        Thu, 26 Nov 2026 11:33:07 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:05 -0800 (PST)
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
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 05/25] crypto: amlogic - Remove clock input
Date: Thu, 26 Nov 2026 20:32:21 +0100
Message-ID: <20261126193241.1471372-6-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

Amlogic crypto IP, which uses DMA crypto engine,
doesn't take a clock input.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 8 --------
 drivers/crypto/amlogic/amlogic-gxl.h      | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 24ef7d5a5607..37224d75edfb 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -9,7 +9,6 @@
 
 #include <crypto/engine.h>
 #include <crypto/internal/skcipher.h>
-#include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -267,13 +266,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
-	if (IS_ERR(mc->busclk)) {
-		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
 		return err;
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e0bc5c39bf2c..5149dc6e9f60 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -91,7 +91,6 @@ struct meson_pdata {
 /*
  * struct meson_dev - main container for all this driver information
  * @base:	base address of amlogic-crypto
- * @busclk:	bus clock for amlogic-crypto
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
@@ -101,7 +100,6 @@ struct meson_pdata {
  */
 struct meson_dev {
 	void __iomem *base;
-	struct clk *busclk;
 	struct device *dev;
 	const struct meson_pdata *pdata;
 	struct meson_flow *chanlist;
-- 
2.47.3

