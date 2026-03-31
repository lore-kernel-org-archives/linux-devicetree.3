Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DF3DEAEB
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985996; cv=none; b=B7YIXMCnqybUNWEJMtra/RADrpA/oZ3T1vTmqKfFRodB8+Bo5fTl9hNZVC/NH59Y+qLoO1ZAn4I76hu5WwEnm6vKKLnOWt3e0DI7jh7P9Jr2FnRAaWtQ7W9SrZLOlBEfGjK88ad7ulUXxOB8C1DW7tuxpDAXgrut/Q/bAsOMSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985996; c=relaxed/simple;
	bh=0bo180biKBnfOCqsVunQ5Bnzei9AzNH07TMj8WXExjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9JDcVuUpScGAFFVLWDTR6MCiVr6CbSGy1Y2wGLZw6nycPSI4/fmQ0hXUfkTvZY3NjiFvHb3Zr9lOivsu8tTFg1vduhxB3Q1MBqxSuBreAx96ulcpTkZvDaEQZJX84Fr7S5lbxIH7uAX9v3YUCdGt7Q/9UJpvjrecStbbYWfNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrTytoZV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrTytoZV"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cd7284782dso370286385a.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985995; x=1775590795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVNRywWQq5QAWWSzQU0VE+vfO8CACut7y7L2DEhMqBk=;
        b=SrTytoZV+OFKnkDTEnL7mxcl9ps/OyGS9YkeVlH7S5qItrsMp3GfuwTcfCA7TeV9mh
         9+kKqRVLLKZ2H+cZxO9ANxt5SeaIcfAsOX7qrNoEfz/dkZImm9XITLiNTtBi2UCWxpqV
         9r2WLXY0groU+MSWCocvxqXsaJ1OyMI9e1uWtR3kqiygmcUaXM6/EvmXvoCmrLhNgf4I
         xaLHiOKtPaQyoWXw1T2n8xLA7YXFWHzIFTuRaz89MF1m9+zj/3pBvMhGxMSm+V+ktYwl
         bZ6bkf1KtwMOOH1d+LfQ6dGU9shm2XdlFrm2ADddoe/YjizrMkV2Ee5rk5aYmnASj71n
         fBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985995; x=1775590795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVNRywWQq5QAWWSzQU0VE+vfO8CACut7y7L2DEhMqBk=;
        b=jfsMCHk9sX0no5mT3AV7OAbNL8ye04PUTqMy/pDnG/kcqeNH29EjRN9xKMB8XEbmtC
         ksBqXF2E3/99Ff1ffguMQ6I4dMk96qijOczjLnVuqHOLILZsSxwukVmasHXAULrcuL5n
         YIXATtzf8UAiVrNybhRRepzBWnV+3U4XuBarNBkRKSXwfghrMLN8u1oyuRkkTYe8vEXs
         EHsnvXWgAMCtto6PjxgJE/ejHkZyw4boNP7e2CNGJZoAaZdlzMJgNDSQGkLJxtRy3v/C
         r5leCJDmtEhA+DLvbR7xHIDozy7u6hHpmJT1ftNNXNrm+IBGDFyjo5ie79vqIC2jQ8LB
         zlng==
X-Forwarded-Encrypted: i=1; AJvYcCW8WrNMXI62rpas3Rz/EOoJI2DfNnovHsWi8I1EPMGe6rgpCX1cxQXa7aJ/hKlUqYIfFFC3cdTYsGqB@vger.kernel.org
X-Gm-Message-State: AOJu0YzEteZEI1mQmgfHnsObScbNLxPwC9XUj3SJ54cpX1Ebf08B0lFn
	uIWIzs+WqLw2Qz4aL+QzPwYZodEVS5oXDSjN80TnBCJvBGD5Wi01L4Kn
X-Gm-Gg: ATEYQzxTM/ARxTb4G9VX0dnfS8vcI1XjihnBIshKsctHf6CO5xgzooEo+G2ddYLpA7w
	2hUtw3R3Uae8CmGuWMdAUHbLFhMtBai5j0+IFG5CHcH1YGmHh/YS9I8pcu4fcyl/bUYrz+GaUDo
	U9qpuv9K25kgvWgPTU+yNDT7rixMohgcqFpwsNTlUKmZjryq787peAKyKcZJaLQH7+cm4P24XPW
	ddX7UVwBFNDO3NH1kxdDslMh3Z9eak7wk/PrETAeNhS52dNfE9NxxC2TWBRjQB0gAwdpK9GAInh
	ycMZBfS7zKfRP+3OohcR0XnBYNbccbvghg2gjAFYuehYb3ZUN7UrHU63bZVQvCNc3J+ybj+cvu5
	jmPJBG62LSTeTWJX23Svv2c3T4+xrhz+lncsXoL9cTsNIm2aDFWuvkwmyp05Y0ECaPN1fFo0LWl
	5uu+aOmRos9E9sowxGLg2032fJ
X-Received: by 2002:a05:620a:170c:b0:8cf:dd4b:8a53 with SMTP id af79cd13be357-8d1b5b2436dmr156991785a.30.1774985994711;
        Tue, 31 Mar 2026 12:39:54 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028075135sm947442685a.38.2026.03.31.12.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:54 -0700 (PDT)
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
Subject: [PATCH v3 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Tue, 31 Mar 2026 15:39:38 -0400
Message-ID: <20260331193939.40636-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
2.53.0

