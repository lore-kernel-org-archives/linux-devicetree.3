Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C93D093C
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649579; cv=none; b=liZQ1OT2Sab3fNr3Vvj8x5d5JxpmI8VcTM8diPrygmHLaCB3aYopqjFGQ9p2ADuK1P+8sNlPCBXnJkXKwnUieID6zAeljiRj8dvV9DgaxotzOwSxn27r8Po3/uxu0jDr4jB4CPCIrIcV26+9BmsUOjVsWSYYCi2glJqVJQZGmh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649579; c=relaxed/simple;
	bh=uNst4wFXLs+ypVn4MIocWwRHY+8OwRVsZ3rpweDmCq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTXdeMNSg0d3FkIKn40BhNV4DuGNTpn8B7v63ZalIBfklzS1JghqWSjwtHsrdnJ9Sjeqg3CI5LkufZxeBsEdfI8JOQ8gcKjDtbrmtjeIvsAEU09AxvZaIpIkLQPkevz577nXUK6OSs2OJHCdivSEESdcUqtVJ7Wg6LDxRUjxG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5dXpGMA; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5dXpGMA"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cbc593a67aso177298185a.2
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649577; x=1778254377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=G5dXpGMAKvBaH75ThiprhSLIAMpnbaK3hGr+P4SUaycP8zW3JNgI8jGxPFHv6SSlSU
         P2IeQjuvYKECLOSc0taYPqwPGVfU6iT2LISm2v3vGlI668UoH5mBE4VaNsBnstUB1Noc
         vWVr9N8R8IYyx2Jeh6XSZJi3NNOItLr2T/PjMJWzFDXBT4O9umkCx3I4avWShyyjGbQg
         hviLKzR4Fv/BXrZJTLHiyegdA4uhmCtOoG4MytbD02hsKreI6c9V1zKd8i2NAwFIOL6A
         od6uNQ2ONzcB75OoWQT4Pk2j5QYXLfxDyq1cI7GjK0Eetcux+k+OjWX6UpmwWCuL9KnK
         b1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649577; x=1778254377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=HBc56SHibCOVp0T2pmOjJRv6Afk0Z3fHwUIe5GYCrWbatfUp7QJm7wkG1p5xbqDNG5
         xGnTWnJEUxJMqp/VSiwGGx+f8jp4zI0hgVPKqwcVw4Cvjve4/sb7TqU0+HqeR7SX7lR0
         qBL9OYyalVTCXLqzJbPgbtzz+vT6D1NW97tiHEYLm9rtvWcclw+Q/64BJsAiIeMRofST
         48zwhPev5khSWiN7bE4pG0TlwY/JN2vAE1dCYlyjgpp6yBlZ26Oe9gxEBAa9NX+20FYN
         yvL+1Vwrn6Fc9ocTPxw4SLEjbk3NU0jHHpdzeWU0E0A3ATcNG3/+sLK/at4Bm6K/KQ8L
         DZRA==
X-Forwarded-Encrypted: i=1; AFNElJ99xPKjBuO7UG0ncD8dCdJdCBnbQbsJRlzJU8nAVXxXg0JsW6qwmuuLl5Yj5nIru2E386sXMGJYx0FY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBY/xrDw/BMKFs0ygtUDUVaG+cetu+K/2qluOlorv3Ab0AB0v
	ndShiKWmU0gu9RCc+3s4/jP7ATFGZzIKeiivqdY803mk9ybRyAgAjbLn
X-Gm-Gg: AeBDies5noxCB69w5qqAN8c90/1gFFV8pWR2Lqw7jCK5vtap0FYvCie/TJBL0fQFmuu
	3kp+tIzS8XaBppBxUWVFfnxUwAorQCLZUw76WUNdMaWtqBPRQY++hXwt4btmzj8/3QsPRMjOLag
	zsbYQrTbyihFHCt0U4e4H0yXu3fE3mXq7YvCWxuUXPwQH1m+0cbrjap3j5d6FFEE5JYCslxRvvM
	uglDJpWinHpUnZeWw0MagcjIOARF6QqSvCmNApgXxsFfsJQisve5Ms1HE7o9v6/rb6e7NifhMve
	bNfdpYycPr6gXOaJYjMVxy3Vbiy3/JHl+XBirT99GQZnIwAZ68p3MHstgZKJSqae1kVxeU1gHLL
	uLHBwZVkwmLTzmPaeEv9JbQOKrAJhTfgymyfdShpIfGeQ/B5IGOU7L5Lc4QaYTBhZGYoLUib291
	xh+u8pN4odTAizLmY1uUsCAMC8lAI6XkGY9U3bluPmLZW/f0q/lOPKH7eFy0vd9d3bI3ShNk4Bu
	QOXnI59Yk+16CZKaayyDh4K0BwqzIpDLuwH
X-Received: by 2002:a05:620a:2982:b0:8d0:3add:30d8 with SMTP id af79cd13be357-8fbf3c332efmr494881485a.52.1777649576778;
        Fri, 01 May 2026 08:32:56 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm201804785a.36.2026.05.01.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:56 -0700 (PDT)
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
Subject: [PATCH v4 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Fri,  1 May 2026 11:31:27 -0400
Message-ID: <20260501153128.8152-15-mailingradian@gmail.com>
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

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
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
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 
-- 
2.54.0

