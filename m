Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780887;
	b=r0B+Zt89vFfFlgMr3vumDGxZwFhP2g+QfCIPMG9kYTbvM30KMglcu+ETdKnxHhKPYO4B
	 bPp7tpnKUXsT5La5Z/BkcWnfbrynb1ADfEzAUIHeT5zZJ4ismSN99XHngwHA4UHp3Vnzw
	 HKs1YaI/R2B+DPLDXlPbXiX5dTVYig2bcz5gGjYL7QGFqX20PTHOFG5OQjF0ykC4/Z/vt
	 nH1zvkKLyXSQS+y3uJ1TP33H+X3skyVTZBlnuOeCg5Azbf+w8UDDmLNBVrCOpjND2rzVg
	 KXnL3M7AvucpyueuVXgpd+enm7QAmiCkPZgiAwhRXTNavIeTk70wiFe4hgQzIR/X32w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
	b=KVA+lWevXpgmcPBXycWIjSmOJdaJ+w0suFnEc5xqrP2puqrBxBYEFVphEAXKtvdOKoot
	 4RjCs2tu5btGkvZTlNBSnzAhyAxAguE/XVUtKu8PXN0KAYs8Hgi+0RYzFcFsSbI2jTsvA
	 O5KUCHHoe8nRD0tn97KcMvIBnvDbDE3R5ZIAIKBJc7ZS6wQmfaShMpEx6QVxQS4retIFj
	 sTaypoJVihu+bCyb2D7D8zIEcUiXrjfhxQFD0Ik/RguBAETqb2NzAtNTSaVxnj5fwvrhY
	 GgNjXLtS87/XkCTFPr73e065BbLu2yS4zbvoK25qt3gRHY4+nv2v9hOJetecBggNcHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmvBd2rE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A1606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmvBd2rE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so73187805e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780885; x=1796385685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=hmvBd2rEJrxmd9LIBu1zPmhNdiS8GN7FqWnzJNp9wnqsDtykYcfNbqPjWpU7gJHnhm
         0lowOxWSUMLn7zEIsGGTD+bhXoVCHHNS4F6sC1God8Q4wPOwkuewWJTRHlBJWfnRUOQM
         6ndyzeYX2uPWQoAVZttxaF+Gb6nilx7mqmabq+US2xooQM8rWh7ZQb+De6vvoGMsf+z7
         DHCsyNrV0n4kquGnBoxTZskNsaMr30Om3l+wapAP9L9VjkV5qtW3rr+HrL8H4tX+i6es
         i6sSHGlg0+HouA/VV1qcWRKNPbDntvDLHWaBGPGnMHxfAkSig/2DBb0WNBEm50d/OADc
         A9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780885; x=1796385685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMyqFUlA/AvT12hLb9IrqwnM+Bo9I2ifCE4zJcXn8o8=;
        b=KXwEO4DHr8sMt/kM2yl0ZBkkiKEgfr3df/S2D65ZoiwFcoELIDhn42MLRnu3GzB3/X
         GPrkMtHBGiP/7k3ddTaL+Ko4XfrqpOwR0onfFufE5c1c1eoa2tfOtzMSt5jBEBzEQTPX
         YtNv3CZUxE/lbKyjba1eMqbJfqo5bD0HWuFnjZ/RO5fj0eHf1QluMw/hK9yuPZ8CbkK3
         95DzMrlRs9r+IbtlGvq4QRWS+48CFojB2PQ8sDGxqk1cV5YkhIXrF7Vf0SZAPa+SHWnP
         +C59HhUmmko5GiarDdahhI2mDNmGdb3yeHysJZDMaUXhoS8latc64/rYlkOfyK+NvWbq
         a7AA==
X-Forwarded-Encrypted: i=1; AL+hErGnSm17eHinx3tNPYozqMM4Ey2qlFXglS8FbO3c0zPQuqKZLb6MhuW93PkBtGlHidNdu0WGKAyLJsBu@vger.kernel.org
X-Gm-Message-State: APuU4Z9vs15r6bWXkmhLzVhLzB4JzaqWmhHPG/piZUW0jpYUtitAynKA
	9PssaR1HyNsFbg+OZPGlQwmQs47QOyM0hwpBbdxfD4SuGRFHZs1OYQJz
X-Gm-Gg: AZFdTZeZxUzERxrvusPY3at0TMRVbAEgdm8Xzcaews/xddk6OlcHTO3HDUQtUTMAYgk
	JPVWXqiYxY/O8NbtjJISC+PSxN2wzR0M3YCgpAjfHQbwC3ODapSfqwvOs+7WF+KwCJcjFTEK/wZ
	RYI9VLpt9tWyRWQ7MH9x63t10iNEaf66LxHtYJ+kUgBjvQWbIqMn0yXxjyosHS1LI1XCDVkNWyA
	sTygufR9HvvSWs/KaFYGK2m4/ZCvSwIbyhWGKrFruEOpHZlpm2CLigPkxMTV/2x7kwauaJUOAdV
	ALQ72pCSxriDcdBwPNGYr89/2I1MIS2TV2kg+YU7TruXXmMUKXmvmbe1NKH7lfoADZYwtTCeg4P
	sTY8f1YJkyEUy5+zr4qEocSmmrpIbkVNZauiQfZmUCYwk5TT0fp8JFH7E+1Vr2KyNKTJGQ6P+Tv
	txGHIGP6f7aenE2LEw4d8ks7ulDiPLHcfoPuKdAJng3vOc+kVmfD2MwUaTqraSAFrE4YdW+ZwGO
	5N88TVygvcooAMLFGwdcLrvJBLnc+Z5GdFyIZo0Vk7m2qyAs2RCRP3mFwk7LaFRtf6IxfwvDRJ/
	ftJMNLzO4+cPNtI9DZyvRACftkU70xOCicuyC2b1X8Zz6UsYoto5CUuD6vjrowixx/FB
X-Received: by 2002:a05:600c:1548:b0:4bb:7347:d5df with SMTP id 5b1f17b1804b1-4bb88814405mr505901515e9.13.1795780885387;
        Fri, 27 Nov 2026 04:01:25 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:23 -0800 (PST)
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
Subject: [PATCH v14 08/30] crypto: amlogic - Drop status field from meson_flow
Date: Fri, 27 Nov 2026 13:00:41 +0100
Message-ID: <20261127120103.1532882-9-jnieto.alaber@gmail.com>
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

This field is used only to check for timeout. But there is more
convenient way to achive the same goal.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 13 +++++++++----
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  1 -
 drivers/crypto/amlogic/amlogic-gxl.h        |  2 --
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index f6c13d8fcb47..cd94296e4d9a 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -228,13 +228,18 @@ static int meson_cipher(struct skcipher_request *areq)
 	}
 
 	reinit_completion(&mc->chanlist[flow].complete);
-	mc->chanlist[flow].status = 0;
 	meson_dma_start(mc, flow);
-	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
-						  msecs_to_jiffies(500));
-	if (mc->chanlist[flow].status == 0) {
+
+	err = wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
+							msecs_to_jiffies(500));
+	if (err == 0) {
 		dev_err(mc->dev, "DMA timeout for flow %d\n", flow);
 		err = -EINVAL;
+	} else if (err < 0) {
+		dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
+	} else {
+		/* No error */
+		err = 0;
 	}
 
 	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 58d56f352dd6..81d0e8731ab1 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -53,7 +53,6 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 	for (flow = 0; flow < mc->flow_cnt; flow++) {
 		if (mc->chanlist[flow].irq == irq) {
 			if (meson_dma_ready(mc, flow)) {
-				mc->chanlist[flow].status = 1;
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index e14cd5021add..cf07c5fbc5bf 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -59,7 +59,6 @@ struct meson_desc {
  * @engine:	ptr to the crypto_engine for this flow
  * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
- * @status:	set to 1 by interrupt if task is done
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
@@ -68,7 +67,6 @@ struct meson_desc {
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
-	int status;
 	int irq;
 	unsigned int keylen;
 	dma_addr_t t_phy;
-- 
2.47.3

