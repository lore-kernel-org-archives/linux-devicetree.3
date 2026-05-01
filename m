Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2DC3D093E
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649581; cv=none; b=pIFfAAPuFqRv/JHdZnFV8zKgXmohhVSZmXgCM0ivvj3xClPT90rghHr8kKHkJHiqd0BYTqCtyZzmSAsmv1zO5qz2Kp18qymZ1SlNO5pRk3DsEQKcK+4KeJiiRd5OmsHWgObMsBN8G/SKmVx2pXV4KozJSShqQPcCoZRIgN1mE+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649581; c=relaxed/simple;
	bh=lSUFMq9Iap1rdJNlT3oDAV2LcIWyyogUVtvmIuYB+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/PSjBvUtvLjVolabopZJdBQ2QVoZ0sRD20HXZP1HZvlNENvm1wCXjSgCdycNZb2yJXD1UNeeWH05yAa+N5OYdngT5/5Ielee1XRuRUwLgJ/tTMCqF9Qz8zOhSg7DAaZzefH352Amb70HLz5+XuRzJY6Avcxq1bHDJod/3CFETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0agkG4a; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0agkG4a"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50fb8e9a4edso23555521cf.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649578; x=1778254378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=N0agkG4aoJWXLc22wgN7sojkUTwyxhc2QBkLSJA67Sx7fivlkVyvfuopX9/JtkytXM
         //ZNzumgluO39NXCNQ47AJZNhf6sst/HxXl6YlJlYCX7QdE4X/PWyOggrbCECQUn3CkS
         s579V8DsfVdI9pNaXoKIOEdZxVFTAkxxLcrC8dkGtvByz/XLrtPNe/3ZJfgPyIzbaEPw
         MVXHyxMolAQflZ6rpo7d6xIYEHR3sX9AjYRw5TQtW/6oxhmRssIoThiu8YMruWXEKnoP
         QjUVMZoOePuPpGwR75gRkRlsUZTWdtU0IAzhWeg56bOzJ9J0/IgTfcCAcbgZmvbl8FQd
         7V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649578; x=1778254378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQauIJKMkpkl88TicZuiGE6oI1IQBcGG5Fit1zxYJvY=;
        b=N1YrC2xgD2ZHmJuN2YSUvaNz3POL5QntSV9mQrmMFQdBCzlBwpJuil81FkT3+/mNRb
         xg35Sj1Um5VfTMx2qW5V/mPtFFQTFJORi7uxKGZ8CpZYR/bDbFmjVoNS1ik4WxcyJ5oo
         LqJHVmkzfu01FmgXqEMjxwrNZ4zfy6ciB0pYzjAUfafuafvbFO5iyB24jN+zdFYkUALO
         XtMnPN4Ns7q7lIYovNRK1nmtoYN0681F9GMF0Br+/FgZRbzqm84JUSJtWdwHIXuHp8ne
         6r55tREvzxJPcBM8Qov3o/lWi6fG8taVO+mWHeO002484VEpUrlG38baRvlIfAy5MWIH
         6LUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8G1+XNawnE/c68BP+zrxAMJPG4beuYp7iAW6ZHgd+TPAAEySQeRntCcqugq8BpdWTi7eNQmKXoGTSd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgj7LnO1+XxJU5yMVJqs78nIqOFgPFESo9l14Y2nHqpGxYEi2o
	xUX7WbqTOaYPo7wH2vmo3tW+2K52Z+WxtCmplCorFZRJSpgPXf6xiu1X
X-Gm-Gg: AeBDieu0IR2r0s3tM/rLiICVl/3OYWofJTKz2tAkMUOt+Tb6Wd60ZKgKfXjxwL5Fhn1
	5ccMjAKXTFYhnb7FyLlaC9ZP1AktX8XNTW+5ifcSL/VLSF5MS/uQVxQ8vIHQapOm7HG75o/8qkh
	VqnHySuV9c2SqLXv8r0oS1yPFlOSV0GcfrDAREp7zc2DCgUjy3RDYfUMVGQnZ9iioneQu9XAi36
	YMs5wJlcZDBnqVlptGWZpKjR8Rr/Vq033/qlPr9PRcLU7vilt2eF4ObsQg37iAd+ZulP/i5Xav3
	Hw5K22TGwyGevU0XzAaMN8u8KUWmmdVjXRgXUC7nelALgZ4LYti8cPTDj/0igso8P0c3bjQyVvV
	Z/y95Fk7EU3bO+2J/jovdHU0zUKHcJmwDRqILaYEUh/Hqzq3So2j538NjQahzUe7ZjZHSNpp+5F
	KkVWXVjMt7aH1N+Hl84XdEJ6RFmaXqQK1SbXPPd9yQDOEfD2TRLUFKGKy88MyMvhXFb0e+2b0ZU
	VI8C/cx/CkJfPYzaywTpd/7lg==
X-Received: by 2002:a05:622a:1f0c:b0:50f:aff4:95f with SMTP id d75a77b69052e-5102ae261a6mr116396721cf.56.1777649578590;
        Fri, 01 May 2026 08:32:58 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc658sm26930626d6.27.2026.05.01.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 15/15] ASoC: msm8916-wcd-analog: add quirk for cajon 2.0
Date: Fri,  1 May 2026 11:31:28 -0400
Message-ID: <20260501153128.8152-16-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The codec version CAJON_2_0 on the Snapdragon 670 requires touching the
HPH test registers. Add the quirk so this driver can also support
SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 ++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index b9325290c28d..87f8a47cc293 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -217,9 +217,11 @@
 #define CDC_A_RX_HPH_BIAS_LDO_OCP	(0xf195)
 #define CDC_A_RX_HPH_BIAS_CNP		(0xf196)
 #define CDC_A_RX_HPH_CNP_EN		(0xf197)
+#define CDC_A_RX_HPH_L_TEST		(0xf19A)
 #define CDC_A_RX_HPH_L_PA_DAC_CTL	(0xf19B)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_MASK	BIT(1)
 #define RX_HPA_L_PA_DAC_CTL_DATA_RESET_RESET	BIT(1)
+#define CDC_A_RX_HPH_R_TEST		(0xf19C)
 #define CDC_A_RX_HPH_R_PA_DAC_CTL	(0xf19D)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET	BIT(1)
 #define RX_HPH_R_PA_DAC_CTL_DATA_RESET_MASK BIT(1)
@@ -705,6 +707,59 @@ static int pm8916_wcd_analog_enable_ear_pa(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int pm8916_wcd_analog_enable_hphl_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* wait 20 ms after the digital codec has powered down */
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_L_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
+static int pm8916_wcd_analog_enable_hphr_pa(struct snd_soc_dapm_widget *w,
+					    struct snd_kcontrol *kcontrol,
+					    int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+
+	/* This quirk is not required for revisions prior to CAJON_2_0 */
+	if (priv->codec_version < 4)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(7000, 7100);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x04);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		msleep(20);
+		snd_soc_component_update_bits(component, CDC_A_RX_HPH_R_TEST,
+				0x04, 0x00);
+		break;
+	}
+	return 0;
+}
+
 static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_RX_COM_OCP_CTL, 0xD1},
 	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
@@ -954,11 +1009,15 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("EAR_S", SND_SOC_NOPM, 0, 0, &ear_mux),
 	SND_SOC_DAPM_SUPPLY("EAR CP", CDC_A_NCP_EN, 4, 0, NULL, 0),
 
-	SND_SOC_DAPM_PGA("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHL PA", CDC_A_RX_HPH_CNP_EN, 5, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphl_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHL", SND_SOC_NOPM, 0, 0, &hphl_mux),
 	SND_SOC_DAPM_MIXER("HPHL DAC", CDC_A_RX_HPH_L_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-	SND_SOC_DAPM_PGA("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HPHR PA", CDC_A_RX_HPH_CNP_EN, 4, 0, NULL, 0,
+			   pm8916_wcd_analog_enable_hphr_pa,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("HPHR", SND_SOC_NOPM, 0, 0, &hphr_mux),
 	SND_SOC_DAPM_MIXER("HPHR DAC", CDC_A_RX_HPH_R_PA_DAC_CTL, 3, 0, NULL,
 			   0),
-- 
2.54.0

