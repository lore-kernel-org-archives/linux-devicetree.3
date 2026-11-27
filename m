Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780878;
	b=SCgrwtIIsbDka6W/0YMt2TK6HyIZgp/H8FgQu/Xq2fL1JNPNRBt4jePzJUNmA8HieUzK
	 eeoI57SSogkJgJ9lNI2JqbFFW15C731f0FQytE781uzBzfTcbx+MRjvO9YpWP8FJtIYMB
	 91JhPTpH0/75XGY/zzJL4DWazd2zkxW/x82bDxSslkcWKF8kfO4aI5GLfXjy9wFRde/EU
	 O3uZvp66Wxa9SG8we54+rdIUKh2+fRC81QnQErL9IkBV8tioulshJ6jU4CuJ8TQM71Et9
	 g2VN/J7ah2/qiyUDgV4yJtJcKls5wClQm4171h3Zcit/Ez4Ur8EMjthahSAGPCT8rHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
	b=Mic+92W+pPvlr7TpFzyq45HJitSglyAfp/lgdHbAeeW7cmtZLNuMKQnlnq+6vGTxSl5R
	 HzzL3KLyvfYFJpCzGr8X6JTveHPs71zQnLpSZUVsHmZ9AndPVsKcCPyWncu36vUX0JAPG
	 m1xfPRBB7gpNWbtBZMKcbUsalkOWSl4uHU/9/Sri9rxZBEQfXJQJb7M3ubYPpOA3gHKio
	 sa3J3qEOfmifVYq813ZvaJWzw8ytsL91CBqWsgVtLPGr+z4oIA25J1j9o2731ijVBtzXB
	 S68pIpHIf1rmFgFuYnnE/mRX+mWgxuoGCO9p5ls55Nxd2v7gv/tNKeJ7vSV9T8n+eyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkhB7vx3;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB3606A32E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FB3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkhB7vx3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4693887f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780876; x=1796385676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=bkhB7vx3loPUDwM/bGwj9HiTKx2gwiwQjFUe7endffATo9+j/nhSk8Bh8H8CQFrO6x
         Isphqb6mJgX1SZIkqzlwm+516f6/PhcwlS8V8cBbOgKYRtkBybNVOnPwSlC56JNif2E1
         zTCttU1IB384Ae9hPx53APRLqTwQKU8p8cbaLJPX+D+iN1rzo+0Kqqh953qWAVa5j32Z
         5COJbq2POmamHR8OO8Wiv22FKxGYyjysck33hZdQbEmCgbDFouZaJrBPk5ZrOhkFKaAr
         mGdw+r4Ef6Zvr0joa7/XkjX5IE3/YsYenSquM0VdGGh20XYOt6xYC3R5tGyhis5mFmHq
         15Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780877; x=1796385677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbnehnxFa5VmvpfZVJ74/P+D94YlubLC2LA1THJEzhg=;
        b=FltqPRui5J2xJ8GdbiPxL0QB/TSHADbfmKqpNQJN3QMmwWM70Z0VXDck+yV7jYfR5B
         VharqmSOCK7FQDUiSK8kXFcZTmRaQWutiWZrrmNzHqx6wb+0jLXXn8qHZRvGY9z9fKs+
         1imkoeo9wKYwDn1VhuYZTAvqL0vQt5K0Ip45tUtMf9nF7bsXZLYQ6ol5Gpp9eIU056q7
         QVqW6mDuCfL8+dEWzgxpTQckr7hYc0EtC2BE9pc2agj88T9MmyqHT6cGxyLeZUwqtGQ2
         +Pio6J4BoYiXafUVCtHIuSzucR7Obhsn1UGv88cT55gWFhaGoX27s4nb6qC1VMXE7gLO
         8TOw==
X-Forwarded-Encrypted: i=1; AL+hErGe0HBNWOmD8JkvsrwyVNjp58OoYij3ilKQ1zYUCR1JPoiTrw5Z5e0P13TOU9V9Dlaq3oVzayK6PPRH@vger.kernel.org
X-Gm-Message-State: APuU4Z/7StOF3DqHiCq+lzVj1OVgEv73+MH4pqiqQY95AnRSdAJAKtmO
	R1Z00R8qYiRjwVp6jmWM+kZW+yIDOXTL5ulu7vFRzsBXsiDOuvJqnDf2
X-Gm-Gg: AZFdTZcHqqenrmjfMJHuhrdES3XMlIUBlFtSmXT8rSecZqz0PlXSrLnKntET7luz/5F
	AtZqJaOwAkDJtJc+P+kR4S/OePcG1ykNtX/EKbGSQdQnc9XnRTxw3JC0rtScxRD6uEnnLHBSbNw
	vJqWNh3+FCSUboRh6A1JvXjBgBO7HdEU0YsZhQyXcsQEhGOQzUGlU4FOc5PFZpLGnjVTdmsEdu+
	j+iQpvLgBbZJkeyFP8xF0oVH/H/Imz4W6Sw2y2z6RWMA8raanbxlH4bIcMlCMAndV5xbKniKQRH
	AaNA28IISdFEUS6PZFjt0THqtWgR0x/+CdTdb+uXRswk0tpulQhCPDquT/sG2Cb+/MyiyBfYC9s
	TqFqEdX9lvcdrdqlzx6PIrrM4dfvK+4uWPIukg+wDagq9ML1t/ln6LJ+53G+V6XhFiMOhQMoXDb
	0R0aFViOexsdMs8sd05zFo/3Wj7dM90SayXBQsRXm/d/qgB2voZBbraSjx4nZ+bIFV4OMNz13Hm
	ZsjswyKcd2ZdYffCCs4DCsWVniZtWnCykW4qmXk6O83cXH1ffLjVHaCOOFRtpOPxeSuN2IlIZ19
	i8x2lpWzb2uW2825QMcyowv+dDZRYiHTGwsxIwlvLWgvlOY=
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr366615295e9.10.1795780876315;
        Fri, 27 Nov 2026 04:01:16 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:15 -0800 (PST)
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
Subject: [PATCH v14 03/30] crypto: amlogic - Don't hardcode IRQ count
Date: Fri, 27 Nov 2026 13:00:36 +0100
Message-ID: <20261127120103.1532882-4-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

IRQ count is no longer hardcoded, and make it part of
struct meson_flow. We need this for extend driver support for
other Amlogic SoC's.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-core.c   | 48 +++++++++++----------
 drivers/crypto/amlogic/amlogic-gxl.h        |  8 ++--
 3 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index d78815b0547d..bcaed2f413d3 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -19,7 +19,7 @@
 
 static int get_engine_number(struct meson_dev *mc)
 {
-	return atomic_inc_return(&mc->flow) % MAXFLOW;
+	return atomic_inc_return(&mc->flow) % mc->flow_cnt;
 }
 
 static bool meson_cipher_need_fallback(struct skcipher_request *areq)
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 48dbdf452034..b6933be39a37 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -28,8 +28,8 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	int flow;
 	u32 p;
 
-	for (flow = 0; flow < MAXFLOW; flow++) {
-		if (mc->irqs[flow] == irq) {
+	for (flow = 0; flow < mc->flow_cnt; flow++) {
+		if (mc->chanlist[flow].irq == irq) {
 			p = readl(mc->base + ((0x04 + flow) << 2));
 			if (p) {
 				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
@@ -111,7 +111,7 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 	struct meson_dev *mc __maybe_unused = seq->private;
 	int i;
 
-	for (i = 0; i < MAXFLOW; i++)
+	for (i = 0; i < mc->flow_cnt; i++)
 		seq_printf(seq, "Channel %d: nreq %lu\n", i,
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 			   mc->chanlist[i].stat_req);
@@ -154,13 +154,31 @@ static void meson_free_chanlist(struct meson_dev *mc, int i)
  */
 static int meson_allocate_chanlist(struct meson_dev *mc)
 {
+	struct platform_device *pdev = to_platform_device(mc->dev);
 	int i, err;
 
-	mc->chanlist = devm_kzalloc_objs(mc->dev, struct meson_flow, MAXFLOW);
+	mc->flow_cnt = platform_irq_count(pdev);
+	if (mc->flow_cnt <= 0) {
+		dev_err(mc->dev, "No IRQs defined\n");
+		return -ENODEV;
+	}
+
+	mc->chanlist = devm_kzalloc_objs(mc->dev, struct meson_flow, mc->flow_cnt);
 	if (!mc->chanlist)
 		return -ENOMEM;
 
-	for (i = 0; i < MAXFLOW; i++) {
+	for (i = 0; i < mc->flow_cnt; i++) {
+		mc->chanlist[i].irq = platform_get_irq(pdev, i);
+		if (mc->chanlist[i].irq < 0)
+			return mc->chanlist[i].irq;
+
+		err = devm_request_irq(mc->dev, mc->chanlist[i].irq,
+				       meson_irq_handler, 0, "aml-crypto", mc);
+		if (err < 0) {
+			dev_err(mc->dev, "Cannot request IRQ for flow %d\n", i);
+			return err;
+		}
+
 		init_completion(&mc->chanlist[i].complete);
 
 		mc->chanlist[i].engine = crypto_engine_alloc_init(mc->dev, true);
@@ -230,7 +248,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
 static int meson_crypto_probe(struct platform_device *pdev)
 {
 	struct meson_dev *mc;
-	int err, i;
+	int err;
 
 	mc = devm_kzalloc_obj(&pdev->dev, *mc);
 	if (!mc)
@@ -254,19 +272,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	for (i = 0; i < MAXFLOW; i++) {
-		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0) {
-			err = mc->irqs[i];
-			goto error_chanlist;
-		}
-
-		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
-				       "gxl-crypto", mc);
-		if (err < 0)
-			goto error_chanlist;
-	}
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
@@ -285,8 +290,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
-error_chanlist:
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 	return err;
 }
 
@@ -300,7 +304,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 
 	meson_unregister_algs(mc);
 
-	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_chanlist(mc, mc->flow_cnt - 1);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index d68094ffb70a..9f1ef87333ae 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -22,8 +22,6 @@
 #define MESON_OPMODE_ECB 0
 #define MESON_OPMODE_CBC 1
 
-#define MAXFLOW 2
-
 #define MAXDESC 64
 
 #define DESC_LAST BIT(18)
@@ -62,6 +60,7 @@ struct meson_desc {
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @status:	set to 1 by interrupt if task is done
+ * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
  * @stat_req:	number of request done by this flow
@@ -70,6 +69,7 @@ struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int status;
+	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
@@ -85,7 +85,7 @@ struct meson_flow {
  * @dev:	the platform device
  * @chanlist:	array of all flow
  * @flow:	flow to use in next request
- * @irqs:	IRQ numbers for amlogic-crypto
+ * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
  * @dbgfs_stats: Debugfs dentry for statistic counters
  */
@@ -95,7 +95,7 @@ struct meson_dev {
 	struct device *dev;
 	struct meson_flow *chanlist;
 	atomic_t flow;
-	int irqs[MAXFLOW];
+	int flow_cnt;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
 	struct dentry *dbgfs_dir;
 #endif
-- 
2.47.3

