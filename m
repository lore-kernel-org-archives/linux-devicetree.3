Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268412;
	b=SwQtAPyOsxPvKAEiNJFxB+eRg/KqcV0rRX1KxJuNVgD3k22TyXxiVdnizrAan6Xjp49l
	 wvYMAm4A0NM17XbgXY7E8l5O/+kzu+KYtSDugX7qxOZsoJrU48lhwVs7XoB3hzRcXcZXd
	 BYiCWtT9RLXJslFDcPa2A8BfIwp6G79zpjzeTETZw+OS1bIl2G+m3kMbxfzQQEFEqELzu
	 acpwYxGPet6i9QxaVsfJKQ2P8kXLw1zejHzW35nQuhdHSQBLeK6jZGqxz1+5EWUKTK0/F
	 nXG4l0oWDblLtLuEUGx+KdjLPyP7C1Gn4PobcCfThlSHVJ4yNwxJ3T2iGDPQOkyLYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
	b=VSYSSKwoOffAZiuaobqjBX8AMGSTXIdFtBxZeb8IfmgdpL0npdq8QPGsdrxT0Lq9t7V+
	 YPon0l3X2Nc+Nn8JO3R1OtGuFpXrhLhKk2LxhteOOUFMwebTxt4VDa1XIRLb4aPNDfjNs
	 oO2fCKSGmo3OyHCyhf1dFwSDh5zR9ZqY0O5aW0SQwWQuUDzIX1lWgKqhm7r/gU9vcEfSz
	 79fDN6twxNxxMqa75AQSvxNZmOhHmtNYFRf05zWWq6h/fGoHAI683EcquzJlJgXFFLMk/
	 Zbjj5SDb/l5EuwJXA5kfbYf0/PSlxlRxMgcQAzsydH03S/J5pEqHtEBpFKtzScX02eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8DaMXRq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307D606A337
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A307D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8DaMXRq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so17166205e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268410; x=1793873210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=g8DaMXRqXQHsWP5RYCoTjKZb6HnLyosxq5FmZQ6TeA2o2vjrOGausXQlCGA8o5RIlP
         XdOmZMBDPrjelgWO0XWrx49n21MX0gDLWqVDAFhjxGo0r15IHn13A1mWYPdH+kVGztbq
         Z8qz/A/Hw53ImmLdKYUvs3sriEtQIJyP0IW7cUElV3CEyarGrhLy1hHYyR3PkH4WFtDd
         8fXoCeOVpKQcVDV9q3cMYUl/Pyyy9hNGWE71pyj5KvUrjyKGt1m4yIejFzBtNpiFe0ke
         ik83SaomozZ4tJRh4YGa9jRSEtvLy7RgOMnB0gPl5tYk/nDkXcUpVcnDFCM568NVcauz
         EErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268410; x=1793873210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=MDvfC+1/yqSZqgS8WcTkvh+8612P7LfUEkaB1LlWeim6xmXH5TxWq9Qvpa2KLhmMO7
         5Ejq/BsaCgylGEQS+H+kkuuUcTXB6qwoKDuSTz51vKf83h5EavraxLOcETu2Nzrbn8QZ
         bUNMyZAilyOc6eHPW5ulutHmDRthao3pWB9bzwNXnBC444St2C6KoFVCdA4ZxaVGECh1
         W/qCtPmcOr6iIedOJgx0uSyBKNIxFAhdF1r5PduMLrmFMvH4zZCrNWRSfThakrDeuHnA
         wkrdoxBGSV5ThChqByRIsg9gyqR63HeawLqM59gvn7pVdm35/tGKZxWQfpjxB/2N8xKb
         goXw==
X-Forwarded-Encrypted: i=1; AKwUvBwsEatJnXjD2B1WSpHOAsPEJQpkqNc3D0r2Lr2cy/I2+CeAYxiNw/jU80W+Vcq+w/u4zJ8VictqFfx/@vger.kernel.org
X-Gm-Message-State: AFq9FYLLwHRwwTrylPp9NpzGGigihTFszFCa9MGpmNVBm0W+EzI9QhDP
	KT0+6SyHm0pljHjwZ0mRWfahLCtD4PYAnSoYxJnccrP9PO/ZtJekouGM
X-Gm-Gg: AYBFou3MtUoQzMw1TROY2dDlD6FNKV71J9SnV92tpZVCUsoCO42Lz6h832+SJNnWQk9
	gRMzlpqLRkn1JjNRpHCX7AWZVQ8S2dBuFEp4R80q+n2pGuG0aJEKDiF5begiX5j+OXUyXN5UX1X
	0+lO6uki86cNGw7fhQPv/JVLsod0qvORoGmRVwQ/cdBMbSnAQFIKkTqKrS7PO6YzQwwUpmm3wN7
	aDx1KwrfkIPrYJW9x/khpmpJSgUevz21F0BDJWUlR2aDwtBbc3NXyLvs2sanIfkddHv+ZisCu3W
	C3FXb/E3QXEvUCleEnk9Mce7wbiAZ0xaZSF53rfToklFAIwriJi5P3XyOw/O34MvOV/l3KJ5uC3
	6cMqJWZ7USEAmUFlPokt+IouZe0LYpHPOfQL7BqFn3V8szkNNQhkGiFeHFWH6pP96BTI1jPtRpz
	1qY8g0xKhEwLGr2upDXkDtZz9w278Pcg4bhNYH7Pb2eT/pJhD/jxkwguKZBdWzR6ZGTPn4B3Ty1
	kD/GN88g+YF7u8P2BTJ5RzKiGUf39TXS1Q5wQhGRTgGNW0q2WFfTckJFzxVr/cbDEfoAyOTrZwG
	MkWigohUXmQ20BuQZa2gAtloTCwZAUycTEq6kHWjKedrOPtacIWn1CWpra09152y1oWpYaGxc+H
	n4s5w1Cg0
X-Received: by 2002:a05:600c:8184:b0:4a5:1c2a:4bb6 with SMTP id 5b1f17b1804b1-4a967ab15c5mr99622405e9.32.1793268409952;
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:24 +0100
Subject: [PATCH 2/4] mfd: rk8xx-core: keep the PMIC interrupt disabled
 during system suspend
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=2691;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=L2myRTbrcpVngJZXrNjm8FAaUWxZTcJOyBmmVMEVxWs=;
 b=5roX3q8fy0xNI6ewi2I12L2R2JapjPSuuY5TaRN3vlegp1g1Oc3/GfvhvCPzLXeWV3msOj/r3
 ynNr0KDMGwyD0+1RWAD6ZSNcsvIFpjK3KJMTq3YCxA49RRB0C9KieTE
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

When the system is woken up by the PMIC (e.g. by the power key), the
PMIC interrupt is handled as soon as interrupts are re-enabled on
resume. At that point, the bus to the PMIC may not have resumed yet, so
reading and acking the interrupt status fails. On RK3588 with an RK806
on SPI:

  spi_master spi2: noqueue transfer failed
  rk8xx-spi spi2.0: Failed to ack 0x79: -13

Disable the interrupt at the end of rk8xx_suspend() and re-enable it at
the start of rk8xx_resume(). Both run in the regular suspend/resume
phase, while the parent bus controller is active. If the interrupt is a
wakeup source, it stays armed while disabled, and the pending event is
replayed by enable_irq() on resume.

Store the interrupt number in struct rk808 for this.
---
 drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++++-
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 21182df45d1b6..2ae9107fc5161 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -851,6 +851,8 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	rk808->irq = irq;
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -929,7 +931,20 @@ int rk8xx_suspend(struct device *dev)
 		break;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the interrupt disabled while the bus to the PMIC may be
+	 * suspended: otherwise a wakeup event (e.g. the power key) is handled
+	 * as soon as interrupts are re-enabled on resume, before the bus has
+	 * resumed, and reading/acking the interrupt status fails. If the
+	 * interrupt is a wakeup source, it stays armed, and the pending event
+	 * is replayed by enable_irq() on resume.
+	 */
+	disable_irq(rk808->irq);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rk8xx_suspend);
 
@@ -938,6 +953,8 @@ int rk8xx_resume(struct device *dev)
 	struct rk808 *rk808 = dev_get_drvdata(dev);
 	int ret = 0;
 
+	enable_irq(rk808->irq);
+
 	switch (rk808->variant) {
 	case RK809_ID:
 	case RK817_ID:
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c9..1255de484ab51 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1461,6 +1461,7 @@ enum {
 
 struct rk808 {
 	struct device			*dev;
+	unsigned int			irq;
 	struct regmap_irq_chip_data	*irq_data;
 	struct regmap			*regmap;
 	long				variant;

-- 
2.47.3

