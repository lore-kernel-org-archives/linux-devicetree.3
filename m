Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191893;
	b=mMOmd/yMvnXTXNrLWg1uqy9rYspgfvP6XFZwGNYzDxftQoDuRTWbG/j+YlTII6YWXvVN
	 u7tB5O6IPWrYIIxf/eHTZkiT+rnhDb7udYM55hkgRi5FxnXJMLIO73xaI07VK5OuQ7YfZ
	 Ge9fmzAiw2lllsJLwmiagCXo7X5gKtvFRK9K6x0KDNWQP9h1pSIq+t06cNNxRvpXJBlCy
	 upMUiWlOYJuePk8kKaa1S1uPaH+KlLLbIPrN6RcTR5sZyPkJaufctOkiBg1hhPdKXtfr9
	 Ffg3t/UAa8Wb6t6M3Ax71CQweVrvuamtZkr2ikqWYGNT2TVEeSu2emynuMBjfAYNktw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
	b=m3eNvKjcue7DT2tTgMCVH6bloye7uouUqOpxngGyVwdQ4W9iAmlCymxEk/4oq/Y3meIM
	 2OkGkNEUuewRjiM20ldChzf7GsJr8hSWkh6t5//eOjL8nA4ETJwMEyNW9HnOKkqj2/qVw
	 zM4aO1q+Z2Aqy1Rixq5ZsW8iAt3iHiH03n54aK+I237oLGW0PDXOuK69u2yjKpD0swSvi
	 pRBZppJb6cZ4h98Wez3MOZ6FVmj2i3x8/dOhGVwicwPw+CqoGTmetHWMoALroFMfKpTvD
	 8840mVTOqtsgRb3j312fmUVzKRZtRgVD3WvDVJYANHhwmRl2OPsOTqDxM9L2bT2tPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92498606A33F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92498606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso7860395e9.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191891; x=1793796691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=HlqpEYJY6SeU06ZVjmrQxi16ZthOhhVqapCxvG8plybQOMFXdacYpjPCirWx6S/WhV
         06xLJjJphsq1welDkMCCYQ8x1n14sv5suP/3e3s6kxRLzPc635UhxyOtguaV7pMlnt9b
         qEaZnaY1dcdnSxHk81jERJpB8JNJYq++AUKOqJOKI0/94sIhEc6xy0boIKnE7MZ74wlb
         QBnyRwjIrjKI/qgZoRcCddF4V8W/z4+3w4zIcS9+cjd6YW3wBYJrRza/rubCCfCmA6Nq
         iPEX6NLW3C3pShttrghSoks5t/B9WDlR05ooYOElE02svDeSLae+F96GeKGebGJKReaF
         ynkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191891; x=1793796691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=SC0s5VkE/x3c6yCTdR57NkeXc8sP+v995MystfjlsoCSGIesPoJoGgMcmKx1QCEmpF
         EerDCaGCvcNRP1cQCEQ+Y9ukgolKhrNw4hfXfNesHKLzPllQmfyuSVa63HBVnIhIsm9T
         VD0KuDnDQfsNzK6/6pEcIoZZNMNtLOup5B+g3YWhadwX+oIU/w5nQPc5rAPKWkZOzc2Q
         q+jG8xWINMuUkw3bt4goQqIdyqp6NK3eL7oL24e+mYuCPmxu7sXsuiOYsPqqRhFDTv7s
         rhDatcLYO858U03IzqsZMlIVj/xt+a+rupRfPDG1GBNqAK3WvoSDXSzruAG57SXaWrHW
         uANw==
X-Forwarded-Encrypted: i=1; AKwUvBwThfeBDpP+WD96cz1WS9AC3VTCyZPsw37U9/Vqyw0RZRuCJTHpjftsFXWuHL0PENbe+z1/ORGuSfJU@vger.kernel.org
X-Gm-Message-State: AFq9FYIrnfahT67q0Y3yTcsjzzBrttpRXexTPac8kGFO065ui7Q/k4FW
	vHZ2DV2RLErBtqCBKVKWR9/GlgqbY595JmMYddbzHalZudQD2MAi2LbT
X-Gm-Gg: AYBFou25RYaNJxeB7b42b0ErXEkCRwoJ37BipHdmp0QuaCxZgRbXEsyglD1onjv8bR1
	GEYJNjto7/R7c0e7vod3ZJ2tHhJrYie0CGdOW1DkUCtkcj62JowffT67p+Pmdjil4O3bTRyEHSu
	1CCLfvrxiaoWsfOudqcQ8SlIt4971UiySerXxkvMgQw+aiGk5OqTxDQLUX5Ggo4+MjmeU6l2QyT
	S1hsnpygSeADctpwNsMJgRRPj0Y6aUo4QKqPJGWyBDIjqdnVFJ8lslRMfYyYKX9xs1pvH1rxVaG
	9SaVfEtxqazsBJV/XXirsQDqZeT8Fs4Y26ktz6/T/4Igh1wL5AKU7NnDXrGayu8Rg96kAah3s8g
	Su8I+v3lCTrYNqyHiEIx4cD/fB5XyvzDbEm8PUCgHo7IEmIbZDI9EoMD9NkFIoqxQWZ6ejH7J4p
	gtVU3rrRAt67xUjKg7SQTiT/ACpljgcLYANoNJ+hP2Vt6+ApYZ7QbuM1K45hBhYT2Zp7nwnVzvn
	CmyPjFxRU1VnfVoY+4ogAhvHQ2bkCOWoGslCowsnl024WEbVX3cUPO8H7o+V0BxpRMg12xsBxaW
	72UBIw0ej3TkBI2c/RP0lIvoOGeKIkyxDRZ1luOBRKusWwkHELe/HJsKLiSWGO6YmXk=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr51619735e9.15.1793191890986;
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:26 +0000
Subject: [PATCH v25 09/11] mmc: renesas_sdhi: Add optional axis/axim reset
 controls
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
Message-Id: <20261028-rzg3l_sdhi-v25-9-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=4251;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ofWNQQh7eeVtC/0QxqS6eNcmDhEtAhULNqUDYpDf2i8=;
 b=2dB6KGv2VbGSis5Wl9Z9RT5ZJKhkOY9qnEpDRZN3gUjWTX2kjJPuVV1agZhObhLJLBnRJol8P
 qQOj3U6MYJnCurHjqiuoqu4n3rdjZVM0yfMC7WdPgi1puLAPAtFDVIo
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Fixed the ordering of resets in suspend/resume paths.
V18->v19:
 * No change.
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 3c991f6b988b..4f8ed1d8efee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -102,6 +102,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 3a1a558bc98c..e897328d5b70 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -632,6 +632,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1151,6 +1153,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1404,13 +1414,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1422,15 +1437,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }

-- 
2.43.0

