Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDD48AE28
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040809; cv=none; b=aCqgnVR4kMyppLTRXcoUV2JdtnEOUBjD5YWed4M920/ek4yiY1yGiOjcrc8nmEgOjnzSSINaCJ1TN6LWJfdP1TZdeoyxT2os10zFBb8LE8+qac08+df6LCYBjAhXvnTavpl5wwsYidwbLTRfW4QbPAT7JSh1jtS4iNetIXc6BFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040809; c=relaxed/simple;
	bh=hdw8J2ZBOu0nycl3TGkq3ROoRnkzek60WiOdlSZSFb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6mJI/2WUSUV6KVAkwP/empWDC4kkWRlsurmfDKNvthSVqD7BWIEU0477HOy3JshcIpsoyYvvX9D2eLBDAiZ5E0EDOS3uqGa3/wx3usg0K5UIElv0Ry4nYHykau8mT6N/A6a/6YFVAwK4L3AzsZjF9I2hRnrfrwI8rtlj/KgSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcM52aff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkMeFcJT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcM52aff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkMeFcJT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcU6M893522
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bW+BJeB73TL
	QniouiBJuhbKOq+WyLzgtTosYyjjnXP4=; b=CcM52affUgkF9QHe7jBEIsNY5z0
	HTGwV1vewqoKzpKPbtGtdSTUVB6mRdqrT3FbxoiR4Qf9uCoLEPbfOKkikkmoPK85
	Y2UQ/H2JpE99odkbnXt37N+YfRH9SdP2/hR6+foOsf3enUBC4whqrLnEwBEfBtI8
	LHjeKtaEA4+h2+ta7lDFTzWTHA2B5Xtnuh5g8dFwf0hirsxobXrtLupKn8jlRnf4
	DiHBdod4oBEPLqMAVsCiZic4D+RppMMI0v1ISfCFLMpso7lGEv2uY/I6gQYtqnSh
	zUF2v7t3cRz4je1J2hpw7J+SKQf6EclHzdBXsQtc4a6SbcXlWEFiEqRvVdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqrfna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:53:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso169883a91.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040799; x=1784645599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW+BJeB73TLQniouiBJuhbKOq+WyLzgtTosYyjjnXP4=;
        b=AkMeFcJTQ4QCTTPDX7i0wvaQzhR6RzB3/mGLZfBypjyNIFQHjZ1GCdU0Sk2iwEBr0B
         jGxAcM9rJxRa//qV4ZAvALQBuUe8ZGNYx0mA+H50tgOlgKXs89kojXt3tTj+clAQ+9uG
         3buIBxEZNP4/MVRp8RdhwyTU8gI4c9IaF5Tu5cxnwPLVJDX+wPU06l34rGtX0yWKgmxw
         DOZ+8hbHUpO1lV9Dou0vYdS1R7oMnpUHk0jgdMMxOwG+qaHTRhE4VQUqyDoSvtif4Mc7
         bgc6fkaJVs570NO/7qAJvOuwRgKCxL5ZbN0/zfn8YXXdWOMAorcBr07rAn+pUtGn3NEz
         CB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040799; x=1784645599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bW+BJeB73TLQniouiBJuhbKOq+WyLzgtTosYyjjnXP4=;
        b=ntTRDPDu+h1ezUyQ/fIZRIp0UzumKbgCLoqoYRGS3hp0HviUS3o0+Y6Ltc6PtcGruc
         gbu30CFyB5leCnZ3c2wx3bWIlv8rb3L3qhbRG++8V+3F8ViicflXhIGlaGtrLl+nLErb
         rsUhoob8qIOhkXzLUfePsYVtPNmcVk9xoDOdCiN6zP+gqrS1be+0lwfIom13c5IhHUDF
         dL3YefsfyYz0ftEBL6j82y5ecwrX837QUYauUJ8yAend6B99RRKEb/hYJZY2+dIkhdXc
         Vz3IE6Ldn/2KjN2gB3Y34aGqNzcxFG53Z5lMT+JpmdTCWV3mTHfjJR1jvg4XTwzo+IiN
         MmnA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8aYVacTsjL/Z01SsFo+fDyOg/dCVVLnyrDT814so9ZSzuFOaRAIBnufeSdoS6dEG94ouXCqrJx4+K@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRK6ZueD75SmJC897JaEiWL0Tf4/JdqnF11UcWBFwNrdY921h
	z1uIRhrNbaVzn/eBB7LC/VQd8Tv7eux7VZNDc+zFpkvMroCNV5aDBjlu4fbUUtadXF3daMbeEV3
	M+egup5fC9T+V4E0cognY/Sh7/pL3M+Z+FJvPILqVq4/EiafNfh699HLRGOg/cRVz
X-Gm-Gg: AfdE7clwTDBEfnGbBKzj+fDjsoCNTnuyGAEICKKP22++Qucx8pmCznzBCciniH3+Wzh
	y9oIIyvFUPTnNL0K8w1CSL/6KcBAF3T0jzNrFZjVdMcAsPTDPFv0jTWbXj1tpZM0I3ZtocFRMRX
	18ymvFcKM4AIPE8ODkllDzK+CxIfaaXFbB9k/jcw0FnA/mAJk4P6xR++fGuQgeZHskMnB1bHdxp
	h1bsawSTnMlFuhXBINE7k7QUSXph3GHFw1uLIKRAB5Mnt1c0kOpGNHgHqDobKz51yZ9oP5YbbF6
	VJA4Jlv8PbvgftRkluBiwYXrluuWe5V5qnM5QD85M4Tvnl8hgxuzIJSe/J1c0gmDiEBuNCS4pLa
	ZARcUJgY8Mzx3368Wo59xMT7DIbXDPDxwOIOWBM7Sn4/fvxQ=
X-Received: by 2002:a17:90a:d643:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38dc7822803mr11000088a91.3.1784040798425;
        Tue, 14 Jul 2026 07:53:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d643:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38dc7822803mr11000072a91.3.1784040797943;
        Tue, 14 Jul 2026 07:53:17 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 3/3] ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Tue, 14 Jul 2026 20:22:50 +0530
Message-Id: <20260714145250.2473461-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX7KU1He9az50W
 dSfNhpX4x0eUdacUblhG4yXUJqB8unUgl5XvN75k/tCHxy1pl5pJauwbNQs/OiIz5j4wdYg2m9G
 FwGTJKpW3O+NKHbHAcYIIgA17mgBH5cHpS0DTQ6D9vI9BkqijmfkQ03ssnIPAdY1ntk8FoXbGaB
 GUQTHv2xHSqMk7syU1Q+OyuTMnGvfTXX1uxR5GIoF/PzUQACNHHKUVw0wXtl2PDBxzFhpanueFA
 HuK+zbVQ0tADS8XJ0JyFxzGqG1O8FiwI0OmT8J2aSsKBQerm6YhDgrf2BzlUrCQC14zcYI1LLoM
 cBrf3AiHd2BYYWEcoMBuf159w6I0RBgrWVCqF0DxVrRRlzA2+AgW2sbNhQR8Vl/fGsOh+bh26Ob
 voSXDoGNsF6W10+MauZ8YglF6OnfT6JbS03TOlz1nCUhELGACDf2dPC/hcn1TXUUoNXzDLFHLq/
 90sh6lMzFSGDfOCfhYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX/jHX1GreG/Jv
 WyJQb2Q6Fsxr9mYhRaaxgy2S/fFYkdjjWmERJt7a1oRi5pqC7+1myQrh4Vsx820mMOz49Bkipkr
 jsn5KDs7PbGPgO3RJIY5hlHDQvXVqUE=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a564d60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=T-rPskIIbrx-efRHNJwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B-XyHdazholOAqthB4Xd4JKDYu0kYUc7
X-Proofpoint-ORIG-GUID: B-XyHdazholOAqthB4Xd4JKDYu0kYUc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155

The sc8280xp machine driver is currently written with a largely
SoC-centric view and assumes a uniform audio topology across all boards.
In practice, multiple products based on the same SoC use different board
designs and external audio components, which require board-specific
configuration to function correctly.

Several Qualcomm platforms like talos integrate third-party audio codecs
or use different external audio paths. These designs often require
additional configuration such as explicit MI2S MCLK settings for audio
to work.

This change enhances the sc8280xp machine driver to support board-specific
configuration such as allowing each board variant to provide its own DAPM
widgets and routes, reflecting the actual audio components and connectors
present and enabling MI2S MCLK programming for boards that use external
codecs requiring a stable master clock.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 251 +++++++++++++++++++++++++++++++++++---
 1 file changed, 231 insertions(+), 20 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 98b15a527..109e39b93 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,78 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6apm.h"
+#include "qdsp6/q6prm.h"
 #include "common.h"
 #include "sdw.h"
 
+#define I2S_MCLKFS 256
+
+#define I2S_MCLK_RATE(rate) \
+	((rate) * (I2S_MCLKFS))
+#define I2S_BIT_RATE(rate, channels, format) \
+	((rate) * (channels) * (format))
+
+static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
+};
+
+struct snd_soc_common {
+	const char *driver_name;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	int num_dapm_routes;
+	const struct snd_kcontrol_new *controls;
+	int num_controls;
+	unsigned int codec_dai_fmt;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	bool wcd_jack;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	const struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
+{
+	int rate = params_rate(params);
+
+	switch (rate) {
+	case 11025:
+	case 44100:
+	case 88200:
+		return I2S_MCLK_RATE(44100);
+	default:
+		break;
+	}
+
+	return I2S_MCLK_RATE(rate);
+}
+
+static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
+{
+	return I2S_BIT_RATE(params_rate(params),
+			    params_channels(params),
+			    snd_pcm_format_width(params_format(params)));
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -32,10 +93,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -64,7 +121,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (data->snd_soc_common_priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -96,6 +156,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	int bclk_freq = sc8280xp_get_bclk_freq(params);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -EOPNOTSUPP)
+			return ret;
+
+		if (data->snd_soc_common_priv->codec_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(codec_dai,
+						  data->snd_soc_common_priv->codec_dai_fmt);
+			if (ret && ret != -EOPNOTSUPP)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_MCLK, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_BCLK, bclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->codec_sysclk_set) {
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     0, mclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -117,6 +234,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -145,38 +263,131 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENODEV;
+
+	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
+	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
+	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
+	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
+	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
+	card->controls = data->snd_soc_common_priv->controls;
+	card->num_controls = data->snd_soc_common_priv->num_controls;
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	card->driver_name = data->snd_soc_common_priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct snd_soc_common eliza_priv_data = {
+	.driver_name = "eliza",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,eliza-sndcard", "eliza"},
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
+	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
+	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
+	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
+	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
+	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
+	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
+	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
+	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
+	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
 	{}
 };
 
-- 
2.34.1

