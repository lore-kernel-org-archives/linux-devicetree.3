Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A6042DFEA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022201; cv=none; b=oW51F30sAFAMm8j710o5EL/Ixg6mw+aDyjIYRu+0xwxbU2WGY4dI0yGtWZApn0f2gfkOoIlFdgASpQ/XGJo7pv1vJZUTTJK4dEQTiBf5qy9dgcRpXAiU/wT+zcT/kaQ/khoOi4cN4UxAaHjR4F5MznPZbtmjw0WqnsrCfH6PNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022201; c=relaxed/simple;
	bh=kWzw/voZgkZ9F987lwcQbashORT/zBgp+puHFaAHgP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CE1ZdWyRnjwr1U2H1T0lD4HCLanwIOY0ogpv8NQWPJfvMZSs3/Gqa3y0yvrzM9akWR0Lv3DJIqTAVPVZe+uD6q4X2QA4qaSB3EqXkUqoOTI/uUFAytJmuATKgHcHlw59Z5CPBze8iEdnxVjpVZNZtkQnxQRUlWzg56hIfUHYIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAxk48Gn; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAxk48Gn"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5176096116fso62898371cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022199; x=1781626999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPPYmlM0l3hrpJwW2jPS8aUg+kvVKXo2i1UV0uK9TUI=;
        b=tAxk48GnNWBcpEUsh7m+Y31kRIDbvz66MGku9F5Cx0tMsIRETDH3z9srBoK4d0hTyD
         h3pflhJ2hdaLQ1Wc8412lcaqUmyHlokV3a2A0cJpn82KHCSvumGpfAtG0y46cDxBEItJ
         ltmr5WlfM8qvYKKzL+xCfJjs3MTEl/fRZxz7uBmR56d88ltM3lfNBpr8tlN46+CjqCub
         X4l4kbJ+1oG9uZBYit8AkI6fQ3mMZTLnaeX/0HI8Hj/ZrQfTbUjsHu2Bsr0PqUveuZBS
         q8+yGjzZg4/1maEsQokGlJCHKfBYsDRPrx/LHusmFYCsQnwcJV2HePX4snnSK+r8vPg7
         HVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022199; x=1781626999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPPYmlM0l3hrpJwW2jPS8aUg+kvVKXo2i1UV0uK9TUI=;
        b=nNbedgVk1Y6uhwuLEUt7vCReg/74qfpeJOLZdjWl8uXNKAgnPHlpCsgo7gXrm+7CNI
         DVd5z0cyESB23KRBYu5k9ysXshSVL9BJ74Mq1ttE+OMQ6HAW9AcaD4X3FKMrBL1oTPYF
         d5Bl7Od3PF/4yUwEj+AZtAFcV0rLzOoIwxFEaDjyuE0yhgymBmdyuaWLRNn4EEsO54ay
         /F8jZOVNY27CcYWvcy6dBVvBCSLFqvn4mLaB8sS1ydZD2LkfXlyo76wIn78hoaY5Imnq
         iQO2ZTkSllcNmUN3v6hAOoWZnbd37CLdsio/UcgYZYua4nkNxhz21AIygP1Z311Qq5PX
         tYoA==
X-Forwarded-Encrypted: i=1; AFNElJ/k0BM4xAPy1HxZJjErCSoXyrNSHrcCG/EYcFgl3qtIUmKpkkpEoQsWOwokKyiDBc4RmX3LrkFT6+On@vger.kernel.org
X-Gm-Message-State: AOJu0YxUg00nRd6InrV0uE4CgqyCk2yVnDyjxR5wReOPj6RJCPD6F5+V
	OIKVPpgwJ5L/3t9+dSAggpfxlihKFPWTJL3SETZ28h9/91l5UxC2Gv5/
X-Gm-Gg: Acq92OEONt5gJAAhoqMESaxrWnPDOtlO6emDGEqbNoV91V0vwLx9aAwlliL42wbD06V
	EzvCl3iFFEeJ5JvldO1oj5wGvMcQFo95YZBKKrUOYS27MXeaHUk7h09+rsGhXOpW/R1fcYoUPU8
	Op9+kfQ6OifsLI0ErV3ASmmpw4StH18RqvSblB12ZOOO2dpfT7637DzoXkv+WQ+aXcU3Q6C4l7h
	Xtrtuqtszeo8mqetCFZciLCrNJTZgSRMdUGN9EYYTEQbn4HbfBOwBV4nT42BjwtCP7qXzhqOdky
	/W0QxgXeZnoth1k/TjIbI2xsmYxnR6ycrbw2mHzQRPZC2V4M9HX46KJR/wttkvlsU80ZCkdtbQ6
	EZOailwRXNOAB6Oi5jHZDO/7pE9YvB7mHSt/XSO8lxMtT/4ZtPu5QEYpvf+L5uZv2Sl+KDaCN3d
	ABWixTI9/ghDuAQSDCZAwFzqoRQkRQj7+aDpXdrw==
X-Received: by 2002:a05:622a:558a:b0:50e:a1aa:2cd9 with SMTP id d75a77b69052e-51795ae6d5cmr291655031cf.15.1781022199024;
        Tue, 09 Jun 2026 09:23:19 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dffb14sm195328071cf.28.2026.06.09.09.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
Date: Tue,  9 Jun 2026 12:22:53 -0400
Message-ID: <20260609162255.31074-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Skladowski <a39.skl@gmail.com>

Add regs overrides for PM8950 codec and implement matching reg overrides
via compatible.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 52 ++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..13df60409857 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -232,6 +232,8 @@
 #define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
 #define SPKR_DAC_CTL_DAC_RESET_NORMAL	0
@@ -250,6 +252,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,6 +267,7 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
@@ -286,6 +290,11 @@ static const char * const supply_names[] = {
 
 #define MBHC_MAX_BUTTONS	(5)
 
+struct wcd_reg_seq {
+	const struct reg_default *seq;
+	int seq_size;
+};
+
 struct pm8916_wcd_analog_priv {
 	u16 pmic_rev;
 	u16 codec_version;
@@ -715,9 +724,41 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct wcd_reg_seq pm8916_data = {
+	.seq = wcd_reg_defaults_2_0,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_2_0),
+};
+
+static const struct reg_default wcd_reg_defaults_pm8950[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8950_data = {
+	.seq = wcd_reg_defaults_pm8950,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+	const struct wcd_reg_seq *wcd_reg_init_data;
 	int err, reg;
 
 	err = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
@@ -738,9 +779,11 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	wcd_reg_init_data = of_device_get_match_data(component->dev);
+
+	for (reg = 0; reg < wcd_reg_init_data->seq_size; reg++)
+		snd_soc_component_write(component, wcd_reg_init_data->seq[reg].reg,
+					wcd_reg_init_data->seq[reg].def);
 
 	priv->component = component;
 
@@ -1259,7 +1302,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
-	{ .compatible = "qcom,pm8916-wcd-analog-codec", },
+	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
+	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
 	{ }
 };
 
-- 
2.54.0

