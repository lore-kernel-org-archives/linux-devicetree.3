Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FE452120F
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804644; cv=none; b=ZB/AXut1DOfoM8R6x9Hba0npm3Dpr69ebZahegqGbvjlyqAKVxDhAaSq1pYF+a0um8vN9lRpO39aV2BtAmxfJQGP/uW+KiCQH/frhKGYavIgC6ZnRgwx8fSRajuNQUK9d/PivQ5VjJudY9ZriapUD/Fc1RDJBXhIm8ultRtXLWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804644; c=relaxed/simple;
	bh=73h+DbbxpUAv6EeNMsT8xfj0daKPyOQsqro/0eGtGvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEFV5N3hQR5hHY5akqEfphyS8ivYHXaR+QmWLvJxtFqmIIzHUDU+7gqyd4H0i9hjD7NLfRRrZw+7IpyXOs+VfmMpBqBRjkDPwJ9ssejEG205Q18JxAft346fPc/PKu7tAKIrIKgb0xTwEyNtKqpf3YvPrLw3O2mDG2AwBMnpxTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMAeuwml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CywrfhGR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMAeuwml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CywrfhGR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HXDew552593
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 18:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvYb56N6DVFPH6GxDVV+eaPUGauCJx3U85RjHAJTnuk=; b=DMAeuwmlzahyKate
	EfWFj0OR9V69Zl13+N0+zFz0Onl823aT8itQprALRf5JKLRYWDHBCtlI/5FcEW7O
	TN/uH7eqGQuaMtmDHqZoGkDtneFXXiaN0ILWz4uoRMtHd3T0VcCHdse/SERM2tPw
	LhnZK8YYyk0wRaDfxVNllo/Wfnv1BfvriXHfx1+RtHS1MEl5mNPPAhppanJwVhm+
	g58bO9Wx7C9GZ2w+cbPPVVYoFjP+9Gm6BYZLWrJDvcxG633qGDO3we1dwI6uiYMl
	Nj4UzCerrBzvjJoHO0pGCobqlrnKtenfXh/dn/eX2LT4zdFHXTialwHkMCcu0on9
	DkLrBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwg43w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 18:10:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so47056405ad.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804641; x=1789409441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvYb56N6DVFPH6GxDVV+eaPUGauCJx3U85RjHAJTnuk=;
        b=CywrfhGRjJv/mZ/Nora7TR84c0PfvXTl4J44sasRSAjUDQ5kyO9K15YOGdX7fU/5ah
         dHwuzs4r14hx77GjYmK3Up6ljoa8vGMEpEQtW6kcsU3cWQKCFWfMdYFMw9ouEcBClY9B
         Pw1ySFPk5MGLBTsCJSVInqNabQdrkoxzsaoZq5LY0AeuIgpEi5Sq2nGodTZcnVaxw2wG
         AspkYiEKylvHw23AOQtaNYbuRvbzdQwuvtdBCXAR3auTYgiFxmFL/E5z8xgUi+SNHrui
         /CQko1ZDytrQz//nBJkOrOFshj7+tNsqfGtZMAi+1Hb269joz1PCvedJgsHVF9UNdm6P
         6vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804641; x=1789409441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvYb56N6DVFPH6GxDVV+eaPUGauCJx3U85RjHAJTnuk=;
        b=nvJztdF0/cdo2KVFPmEs9yJoIEg983F08wx6EMf5CpVB3ARKXBamGuW0qt7bcFxawN
         omJyEnXyJN9CMLuQi3CBwDy4UbhMzu9YUg2+65S7YZMkK8elh84T/N/l7H3CiOTKFh+c
         G4tuB1K67YkqbYrUmzUOHeQWbFj7WlP48ZaH1dkInfZfK8tpMm0EewU47D5F0BSmIMfU
         p/x6jwdWE7+grEEBf/Rze2A+drsLfrH+CezfGblotMDhLvwKGHWuJ8SwJhbRuRI+8zf+
         lZDb/OakTbdvApQ7FLDt5NwLMVUORAHJcDc9sGMQbyk0HkmYlnMKSzmLtdu2PYdbxNba
         ebDQ==
X-Forwarded-Encrypted: i=1; AKwUvByhatkJWj9J1G73SOktmAb5orCxbUmVEGR5Qp37rqXSDNCX6AhRsxLCgVvj+P0JQDage2TgfvlSWxr/@vger.kernel.org
X-Gm-Message-State: AFuF++nb3m274UnSwiwSMKcFjBhFHKZ2ez/mPoMPSSxCbGrookF9Nc0z
	PKHvEJ5DrAYUq+OmJG04mObsbm8fAqaZ5yllCTyq3uq2HXnjT1VyQjDNJtqYnp4Jq+lPT2rKiWj
	h1lXbnqFJWVNd2XsSxQEnjuIUJYW3JImMuclOGsqWi1ZDGgdcKxzuLS1xXHm0e4kK
X-Gm-Gg: AYBFou0ym9KU2HG0e2Ueq5+ab+Mvo1wol21fqidsxlVOIHcpsRpmUNCoDT6vmctu27C
	uXjpFTsFfZOaaawIj10u75EUfBbd6XqB1TqwAH4Mr0pJb3KsVzWGlAW/tQ7oZ37XZdFYQxTv1D0
	FjEgRl5+k5DA10nXGFJQR0Rcqvj+9VansXzNxupi8i+LDDTCIv8k6Zika25PtdtpSSOIC627UrL
	CvVJwNfLYvHtgaaOLovbQ7EzLcDPsn49q0cf88QhHoDMn6Uy6EK55VrPNm/KEGojOTGDH31gOSh
	Jn1BbZJIbWN4lD10XE0nHh+yU7k42uIYf7o9rSRcoiCxZAy7/Dt1aAIG2bhfM1SRbULL6Ramh8a
	SQHuRGyX/wteD9npBXxL1NOp5VljACXRonGOM
X-Received: by 2002:a05:6a21:2291:b0:3d0:88f5:f812 with SMTP id adf61e73a8af0-3da39d147e0mr35987979637.10.1788804641065;
        Mon, 07 Sep 2026 11:10:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:2291:b0:3d0:88f5:f812 with SMTP id adf61e73a8af0-3da39d147e0mr35987915637.10.1788804640630;
        Mon, 07 Sep 2026 11:10:40 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:40 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:46 +0530
Subject: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add Nord Ride sound card
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-5-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=4265;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=73h+DbbxpUAv6EeNMsT8xfj0daKPyOQsqro/0eGtGvI=;
 b=rb5X3u3ND4ZxYurEafoxHNvbfthl3o/dmRs+8RwKevnVxtDudd1Jh7aWi/FmfDMcK6iTTkQ/R
 ifEQfNPipG3DGx/DRSDxvnA1POnh+slxySasIJoyhdDHJ34f2cOdmt3
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9efe22 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FUwYNvyfLjuJzzMI3m8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXx+2yq32FN9oi
 mrxvNBLSGjWmMoLwbwG64uEodH5Ew07T70qiyJbX8ojieE2ECd+PAvsZCcLgkgbr6RmiKmbf8rn
 yh9i2Uof/kHxWndxzJeufEhc4kFuJi9PfUfMjTSczPXZzW6ToAR1cY4TXHZpGm9w+1TTIh2oTGY
 nxwK/oaTewguIRroP/duCz+V6ypnH0vLCeAMjZuKk2Kq5qZPHJFCbJoQ6DN5/dVm312YTN9mCor
 4ntCOKkBFKxF3NrByD5KS9h+Byle/Ew3PxrPbXB8wul5sO8qA8/q33WMHYBXTym8VC2PGjSX9Pv
 9g4d7zhBXwOR2yOzuyGBxjiWeqwD3eJm5zJxW4Lxv7zYclYuDiucZiO6bdqTRm1uFUTkKefmRlM
 n7GMeYU/Y3lsvY3YIBUAEYOHRToBNHG0tqt5fbAdngzKVFBTRcD57JncxCX3gJFoa3f8Ix6K9hh
 Sau4uO+XRJVaabyuLzA==
X-Proofpoint-ORIG-GUID: fa6R5d_ZaAFt5McYXZFlskzh_VuoXH69
X-Proofpoint-GUID: fa6R5d_ZaAFt5McYXZFlskzh_VuoXH69
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXyyPbi9D8y9B8
 h9FuX82VifKHoySbXh20J7sAIOdnXG1h4N0WNYpv27mGU52L/mvoFv64vVeGhfREJrz0QYP9ZsA
 WqL+o+iLVVSLzwyutcUBlZKuP6UWZiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

Add support for the Nord Ride sound card by introducing a new
compatible string and associated platform private data.

Nord uses external audio codecs with interface requirements that
differ from the generic SC8280XP platforms. Add a dedicated
hw_params callback to configure the appropriate DAI format for
playback and capture streams and to program the codec system clock
configuration required by the board.

The callback configures the PCM1681 playback path to operate in I2S
mode and the ADAU1979 capture path to operate in DSP_A mode. For
capture, the ADAU1979 system clock is sourced from LRCLK as
required by the hardware design.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4d48e1012cd4..4d8eafca4b7f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -18,6 +18,7 @@
 #include "common.h"
 #include "sdw.h"
 
+#define LRCLK_SYSCLK 1
 #define I2S_MCLKFS 256
 
 #define I2S_MCLK_RATE(rate) \
@@ -72,6 +73,8 @@ struct qcom_snd_soc_common {
 	bool mi2s_bclk_enable;
 	bool wcd_jack;
 	int (*snd_prepare)(struct snd_pcm_substream *substream);
+	int (*snd_hw_params)(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params);
 };
 
 struct sc8280xp_snd_data {
@@ -244,6 +247,47 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int nord_snd_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int rate = params_rate(params);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case TERTIARY_MI2S_RX:
+		ret = snd_soc_dai_set_fmt(codec_dai,
+					  SND_SOC_DAIFMT_CBC_CFC |
+					  SND_SOC_DAIFMT_NB_NF |
+					  SND_SOC_DAIFMT_I2S);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+
+		break;
+	case TERTIARY_TDM_TX_7:
+		ret = snd_soc_dai_set_fmt(codec_dai,
+					  SND_SOC_DAIFMT_CBC_CFC |
+					  SND_SOC_DAIFMT_NB_NF |
+					  SND_SOC_DAIFMT_DSP_A);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+
+		/* adau1979 MCLK sourced from LRCLK */
+		ret = snd_soc_component_set_sysclk(codec_dai->component,
+						   0, LRCLK_SYSCLK,
+						   rate, SND_SOC_CLOCK_IN);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+		break;
+	default:
+		break;
+	};
+
+	return 0;
+}
+
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -255,6 +299,12 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 	int bclk_freq = sc8280xp_get_bclk_freq(params);
 	int ret;
 
+	if (data->priv->snd_hw_params) {
+		ret = data->priv->snd_hw_params(substream, params);
+		if (ret)
+			return ret;
+	}
+
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
@@ -461,6 +511,12 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common nord_ride_priv_data = {
+	.driver_name = "nord",
+	.mi2s_bclk_enable = true,
+	.snd_hw_params = nord_snd_hw_params,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -564,6 +620,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
 	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,nord-ride-sndcard", .data = &nord_ride_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },

-- 
2.34.1

