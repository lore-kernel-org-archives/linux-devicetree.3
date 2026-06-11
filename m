Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45463E44F1
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177415; cv=none; b=nyydwjp5jXJhCDSYsHfLYjW/b20zuf/8TGvc6BwlukqmeStj8rPklzc4X7HCcGSRT0w7FSj+nIvJbinrzMXy0o14/prGqlaJn3SVQbbq3Mmy2UAjLeiDII9scHvSd4JRp5UteDrDqBVjuAPzwfxNzoiMXnBhIropVzImA73e7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177415; c=relaxed/simple;
	bh=JxydoAK4c/x7mitXawfZI4XQhQgJPPm7W+ijBGuaEZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJsqgeoDeXpfYUsWigkgsinTCnjba3wTZQ5XH6iUGu7JmEkoCbOnsW0Axg1UfZrpFFkKJvF2UhfM5nNtlfrqIlU9FNsJXbIkqmhp6Jb4g3nAv9IEodjtY0twAjqNELq1QMUyx0smmYW2H9JWKOHsuf5dGio2KMRx7jRUFrLGjgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoWBbeX8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKRWQjZG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoWBbeX8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKRWQjZG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x5QW267506
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2ymPIOvipeO
	RT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=; b=SoWBbeX8lbujDAgZ74I0WDKQdVT
	hDSAFKQvm73YPrcLsecCpb+hDv4OBE0hKMf6GXlAHjY32J/Odq2mMfQKlBenzL8b
	wYMUP1yFXCpXlOXykaiQ+7JW45ErwyJsxYofMMsj6oq8+JFZNrtd6vnO9dZ3GEaZ
	haIginipou/bYdZBAkLq/lix3DzMZxZuqLkbEmKNXygwY5JJaogxUimsLVaU0DF3
	dbTkpOyIMrW/2n0RVcsWwJ5qOKr1G3qmCkL6pwf2l2coTo42zzIrY2SkMJ3zXsiO
	yiM3gnZd1u/9VqbipePGHsspKmSPx2c9CLh/GEgOm/KV6zVjZzO9Q+AHO0w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u35b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:30:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428384f31fso5707014b3a.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177412; x=1781782212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=JKRWQjZGPqTro066yQQBPv00x9Lmteua5+5oJqPy+JylxJPR1+yXbZH9x+mRRdxQjP
         vV2Mk4NfaHR8GehyQvKVEg8o5txUDh7tcYbfWDwt4ccsTS2Gl21ZuO1CsVX0yls3MNyM
         5UMyX4N8+IpN0NMWpjroElBdXJyZ+PEtzIpTlk8lC+7GKKs+ICdj1lMWkT5b4ZmE6SLQ
         RfBpIpRgNn3joDMdybUwPUWqhskNGPEGNWkDVDAaZfatrv4dTLlirVpfWouJx9on7wik
         +QS8kZD304MgT+RL5Ed+eJyIHGq97vSnzbjs2TFJu6aYiZsQxTlTSCrHaDkkByILRTQ8
         DxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177412; x=1781782212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ymPIOvipeORT0yrOudYUfCdj8iM0kkI2XFwKKa8BQo=;
        b=N9u6RApzcVKGBjhsWGbrNxCguDyoh1psb8m4+mXnB09P92lhP62kGVZMVZINupaeIt
         7dlY0UvDpNo8sDKl0hABNKyMmIN5Tf21gOyuu11czeyWCdH0eJUC71IJHtFLYA+Zdnuq
         PDh+iC8HlVOR8YPGRXVf7YhiaQJRXJv9Vd3YkjFPq9ZkonUCOwsvO295NwlhRcR06wij
         27S30HD6LLLwNT7M4NsPr2r6nlau/q57S4SjsgPMUqssB0MYg4TKGqsferOEDwt8njOE
         F/x/4K+kFx48A13stC2mU5Gxyc19XgsrbCO4meVvWyf7hWDhNjk5PjHTcP8fjIfMgCV/
         Qx6g==
X-Forwarded-Encrypted: i=1; AFNElJ+M3yWj9SdIRHlrfmnuvZ/2nu3jnSQVEnaMgxLkfxusyZRUUFnqmkkk/8t4+3+sI0InaZ9Zjo/q6suW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6UR2KBF3BRzPNAoAtlaHG3FDcQMFrGTEBMLmPoX20Ppw4TCv6
	GcP3BW0pwctn3PH+BJxWMqt3HpIuoPN28bDdbEcxinXWsRediozA6igd1pVDzBndOd9AkporxMF
	n4I07NMLJAL7wRBn1AXMDVMMxeSCOGhirIsO1XMDKw5AIHSxTQY6RJrk/B3FbLlN922fddptz
X-Gm-Gg: Acq92OEfWOdoSP9ZRUnRU86hzBNPkXgMSivKrn3V3TITuPdZoQY+DnCWOQqLzrQaQuh
	xdghZaTVyhpCqEu0OVS9QwNyc7MkiJWNwxxhISoZMUf8ClL61nT3yzpCwohxFuVGbuVjd+GvszI
	OVEj/g5cVVEXnWu0t3rcjgY99Ew94LR9ZHVwbflqG32Zebd3Sg0OjCe0uwYW0oJHsvu9b1AWpPr
	rWOI1PNXiLdaI7Ei9AlK/HsR4YOdwvl5PWJVB/67Lpdofcn2oGRRdxk4tUG7s7HEfOzWKxqfuWW
	+6r6ufMsDyEAFAFetoxEtiUu5bx7p/wwloLE4sydcYvGo7vNyyJcpNNTmERUvyZcloYxZbVEkzI
	VjskZ8CXslmkYszWoA91cyybvOg4p8yDuv1abXvAUJIwuDsani/2spoj6Obll
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783311b3a.2.1781177411949;
        Thu, 11 Jun 2026 04:30:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e0d:b0:842:5bf3:c53c with SMTP id d2e1a72fcca58-843367eb6e4mr2783265b3a.2.1781177411306;
        Thu, 11 Jun 2026 04:30:11 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337b8fcdesm1837301b3a.9.2026.06.11.04.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:30:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine variants
Date: Thu, 11 Jun 2026 16:59:46 +0530
Message-Id: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: p38xcxP04djm0-P_eF0honQPgnrW7eYv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX42DPdrYoWUkF
 r7NZJz18Q5OYc9+DECiAjGG4zbNNZiP2mI4shG2f8ZY0WJYrBZBPJKODHWrhzuHTrzpNAT5gG8P
 ilcoAUd1mKEVtsqa54Zt3sPez1I/geA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX41hiHXld4CVJ
 ZBbqbWtKseJZAECfzB0DmUZC0lMpI3DnUYB/EpQIr/hvOAS4zsK0d64cVrgnwOSXrOE5CPEAmEM
 6s7Mozg8o7Floq+CmF6mmPWGESlyyiGMYQceGH5dEV4GWYDDSBBl6l/tfsJ+gSQ81uk1VTeWdoI
 3fVIeP5RFES3xNufGNMUCHnp/GKzNbV1nOzaziUSA3Ge4l1O8wWs1FcwvA8NaLP0fo/qGNHM7V+
 CKlTfqqGikmLMewblIoBBTfV2jDiZUZnLLG4q3hnZVeTQPJs+f9TVXoZjp/6hJFwzl1s4bXLTub
 t4m+mssn+7/RJGIQLIbwe7DEcqDzJ2Lce3hOnBQUAqgMYXnqo5nDGyc9Drfzaj1D8bf57wupiK5
 wUZznmyWLzGICg2V2lTj1EnHXCZq+V2cAP3ofu3w5EHorCNy+WCELRVhdq/61IuC0xvqLeXFHus
 0ZIvLBl8VgSyQ6xlEdA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a9c45 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=t_tmAbmC07WJz_vCYN0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: p38xcxP04djm0-P_eF0honQPgnrW7eYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115

Add machine-driver support for Qualcomm Shikra EVK variants by matching
dedicated compatible strings and applying board-specific audio behavior.

Shikra platforms are available as CQM, CQS, and IQS variants with
different audio components and processing architectures:

- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQM runs in DSP-bypass mode, where the complete audio pipeline runs
  on CPU only and no DSP is involved.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

Introduce variant-specific handling so codec controls, DAPM widgets, and
clock programming match the board design and avoid invalid clock setup on
variants where it is not applicable.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/common.c   |  2 ++
 sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/sdw.c      |  3 ++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index f42c98ded..32d6c09b2 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case QAIF_CDC_DMA_RX0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e5d23e244..4c985f81c 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+};
+
+static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new shikra_iqs_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -49,6 +68,7 @@ struct snd_soc_common {
 	bool codec_sysclk_set;
 	bool mi2s_mclk_enable;
 	bool mi2s_bclk_enable;
+	bool dsp_bypass;
 };
 
 struct sc8280xp_snd_data {
@@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	int mclk_freq = sc8280xp_get_mclk_freq(params);
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 
+    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
+	if (data->snd_soc_common_priv->dsp_bypass)
+		return 0;
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 					       SND_SOC_CLOCK_IN);
 
 		if (data->snd_soc_common_priv->codec_sysclk_set)
-			snd_soc_dai_set_sysclk(cpu_dai,
+			snd_soc_dai_set_sysclk(codec_dai,
 					       0, mclk_freq,
 					       SND_SOC_CLOCK_IN);
 		break;
@@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 	int i;
 
 	for_each_card_prelinks(card, i, link) {
-		if (link->no_pcm == 1) {
+		if (link->no_pcm == 1 || link->num_codecs > 0) {
 			link->init = sc8280xp_snd_init;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
@@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
+static const struct snd_soc_common shikra_cqm_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.dsp_bypass = true,
+};
+
+static const struct snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
+static const struct snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_iqs_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
+	.controls = shikra_iqs_controls,
+	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
+	.codec_sysclk_set = true,
+	.mi2s_bclk_enable = true,
+};
+
 static struct snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
 	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
+	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
+	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
+	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
 	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
 	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
 	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4..0be743cec 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,qaif.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include "sdw.h"
@@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
 	switch (id) {
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_RX0:
+	case QAIF_CDC_DMA_VA_TX0:
+	case QAIF_CDC_DMA_RX0:
 		return true;
 	default:
 		break;
-- 
2.34.1
