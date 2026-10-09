Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1D442138
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551641; cv=none; b=Hq3865XzC4DCqZnaKVL8sx33O8a4BK/efdLT4G1BaSpIlWst2Th2/4qFxPjeyRK9g4No7MU9/BPlB3piz8Z34GX6cG/u5GMkiCdKegaiBMtk8k9yDYmibmZ45PbxlqiQm6RYJ9MkKmzbwHj3GKA3yAgIHCqwhf7ti/eoTxrGkds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551641; c=relaxed/simple;
	bh=j1VXmQNiRWauxnpIyPN1/TUSctGaoJcGcJxlEEYna3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+M3KpCUSb7sXsG2H9SZ/0ot8kjvWAPhwRvj61iMqOcjXy62RR0Y8gkJ881aBtkiC4PsRewdU+KuMNLzBQWBIfgGaLMOzLAqGvALS2uzxu0Vlu8vYshPFEUhCpLzD5Tm6IMAeGEG3go3sYYjPB4L4A+V+M23Crdtt78ikFoxSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsm7UsEH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFdcQetY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsm7UsEH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFdcQetY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KMCk1223194
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=; b=dsm7UsEHmpMe5kN6
	dthcj8b7UFGXF2/6ivPoO7ilqr9+xMKKMEEFaN1nG6U3XngUDBsANl9O9ZJzDFVc
	yOAvHpZNcmTOuhbYseEDU4FkEKUYvhFIh7jo7iCj5QFAO+9CQyAJ9SlGeOr1FlaX
	qhYn31DfeTkKgVJ3zH6O2kE1KUPhl+JnJUk0kyfnU8Y+F6QD+DoKJPV693mlbCNv
	bcxppPFV/+DEMrehilc1ALyAGvLzEFydLKN96S1RhQ6vrJO4y+5BedVv6vdPAoY8
	kAIH3VbCO8jOiKUFZH1ZZGpy8xa9ybknTsUu4joIiIf2Lu3GYhWDUuKv2SWZH+/9
	7Y5sJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkbmft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:13:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so3942284a12.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551637; x=1792156437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=;
        b=dFdcQetYWGs7lRsbGENn3r3gSidMaf4ywOiE32ZC4SpSRfhJ8QteLM9eeXVltq/EsG
         1K4Sj7YsMqKurYFG0SouDtX0JEIF22w0LgVXOAov3A51QDVYQUD8bZi38KCcJ50ZZaUU
         XdUy6EfChhTu+uGxqRKy45bt4PiAdmRlUHoDLks1XJ5gnVYhZfGcBJFW84KWqFjcLv+G
         IVTqWpZOuuWVxTLTU5xlXHTXCW4Xb2QtaUFIaXNSR17aK3N+5dMngxo/3KxvZp5/iArW
         BUAwS0DzWRnJu2qZ9ZSByPG6BDjrXm1Wni7MOEDAlLKNe8Aq9Xb4vMug+fUyOGCx/t8P
         UYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551637; x=1792156437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+4CKmmHaBQGell1gEkmu/EW/Ql4lXa15xojCeunB3U=;
        b=yhVpNp0YOlPph2XPI76HwtWF9JX5OcpbzD7oG/3OedUtzlhzWz77xBTv5PIinBzTLq
         KfH/s9Fo+n/tcEV7dBg8pH6YJdHtv4i+4MOEdMF5rB2ri5EnWyBI5gDBTyXlRj2Qnshd
         qxQ7qz7i7n4yxdNAjhthpBQ13tZ7HG2V4QIJ0rfY+JnpVZ9db60sNyx1DWM0HSYPMcSv
         4rYBdlljJFWHi9UQ4MyvZnLQsi1XP4150P8Cz3T4njvte9sCatGuYeyvsIH1LhuR0CCe
         qeyoiQW1KPC+9pp7cGIi1uc/gIKB4XqazIjCY3/MhNtaTnHDCMpw8D9GBuLihMou3SSq
         XoyA==
X-Forwarded-Encrypted: i=1; AKwUvBydG86iuJ8yxlFE9fwYkvQhNUNXj5+Nc2VhD8W09ku2ixzOsGCDFUGUdeThWwgZxFLbUEnIuWmcqh8j@vger.kernel.org
X-Gm-Message-State: AFuF++kmzE7ulP9cbezvfOK25/yPbfEpEH7HDhiFJCwc+bCRnV0fIAff
	bRZBun3ppB5IYG5SvdySA93tcHCJc4kTZWrSD9CVqjxv1xXg1kS0lnb1EDsq/xyQ4/tkN1B/1Me
	107NUbLsaaBfLB3uXOxqF5d50SIEdub5Kmv3qt5brmk5+MXnP2R57JeyDBj0cF5rj
X-Gm-Gg: AYBFou2rexEvU6NKb2Hdt3LBpLsuJdM7nNbsw34zBn9K9JO22fU60gNk53NWwo/GYsG
	e6TcVQrO+lRoYULgytK1aDdgqkq0sgJloWXsWy48H1yI6KW3WiQEYbu+BdZ5gl4sLXk5J2j73D7
	PMV2EOQwmkzv1H07BefrbQc7Vx/UDBmlqYycJQb4Y7D89lLddIx1VZXPD3a6Xq3qe3ouiKJlg/5
	2GF8Xyrxa1FCReirtJadIxHPJwqZKkFihT/UuC1GQd/rdDz+Q6yhdrMBncs/W1ZuYbvHjcOLZTH
	ETYKr2t5n1yWWrBYwEsXjtClbQM4UjtqEPMeBvMRUgzj8I5zHJ3Fk3N1JmHbpV0bUdL+Slb0Trs
	hKq1u2kpoFDQXE+hEzekXYzJC9nW9hKd95qe7
X-Received: by 2002:a05:6a21:1518:b0:3de:7add:653f with SMTP id adf61e73a8af0-3e16be4ec16mr1489838637.44.1791551637460;
        Fri, 09 Oct 2026 06:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:1518:b0:3de:7add:653f with SMTP id adf61e73a8af0-3e16be4ec16mr1489803637.44.1791551636972;
        Fri, 09 Oct 2026 06:13:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:56 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 18:42:53 +0530
Subject: [PATCH v3 7/7] ASoC: qcom: sc8280xp: Add Nord sound card support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=4331;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=j1VXmQNiRWauxnpIyPN1/TUSctGaoJcGcJxlEEYna3c=;
 b=aEecCV+ziFwsk0NApKOasRiakOkDR+e7y9XyL7O+0B0GjXaz0PX7o4XYhge79L+vj7/1C+1C0
 D/OFopQGaWWBDh+x9RIKpxrVVQNUiwf6LoLdXLu/Y8ztrjFzm11GJtb
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: xGVYulmS_qV66gg-jmCvne3yZLBt8-wy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX1cf2+lkgnPxl
 xc5owyfEEK/Vw4gV2T/OoScz0MmPt6E0PFZz8t3gFWCU63L87cOuaes+bWsp1MipIdKXiue2DtZ
 GEhsGJJqqr9SHpex/niRLrq61lTto8E=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8e896 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EcOXNZcWnQqa4qozP7MA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX8lvzuNnn4jIc
 WI10MpXu9ztjBfcyZk7bVuLI77iluNF9ZnvvXnfYNqKtWWYfL7UOiV629Xozzmvh+TgfaeDfxmh
 Ve1LiuN5CuuQTUvktBLlU8xQOJBV/cuITHxiz8XvvcIEbadWdmKjc09TX+hRo5Tr4RnQfmjlI/n
 7bssszpAHs81twynZESrnGV3dmPpSJYyqpvh6pbKhGgvdG/JN9ZSa2YfB6otoIOY+cZ1n/duoq0
 CDFwU2JB8hIziUiEzdh674RL/Y9EhmRrVBm2A2Bz4A4V2Untx3q3MqixYByF/3UeyH+0KiZtsBd
 c+WAw12+5dWWW2hVGhOtVyQ3vC9e8X3U0DyHrsmN7KkzFuukZnu01F2bFNb1ofapbbbM1bnuiC3
 sQHT4ZiivD+KxZ4d72rfg1YEdI4gtWL6CX0/35h0S6DQWwx8En1eA3a28KrNFgSV+aCyMF0Hrge
 pBXfILmmrpQGGmBl5lw==
X-Proofpoint-ORIG-GUID: xGVYulmS_qV66gg-jmCvne3yZLBt8-wy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090052

Add support for the Nord Ride and RRD sound cards by introducing the
qcom,nord-sndcard compatible and associated platform-specific data.
 
Nord uses external codecs for its playback and capture paths and requires
board-specific DAI and clock configuration. Configure the codec DAI format
for DSP_A operation and enable MI2S bit clock handling for the platform.
 
Add a platform-specific sound card initialization callback to configure
the ADAU1979 capture codec to use LRCLK as its system clock source. This
configuration is done during DAI link initialization so that the codec
clock source and associated rate constraints are established before the
capture stream is opened.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index b5d367486..a759ae951 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -25,6 +25,10 @@
 #define I2S_BIT_RATE(rate, channels, format) \
 	((rate) * (channels) * (format))
 
+#define ADAU1977_SYSCLK 0
+#define ADAU1977_SYSCLK_SRC_MCLK 0
+#define ADAU1977_SYSCLK_SRC_LRCLK 1
+
 static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
@@ -92,6 +96,7 @@ struct qcom_snd_soc_common {
 	bool wcd_jack;
 	const struct sc8280xp_dai_data *dai_data;
 	size_t num_dai_data;
+	int (*snd_init)(struct snd_soc_pcm_runtime *rtd);
 	int (*snd_prepare)(struct snd_pcm_substream *substream);
 };
 
@@ -224,9 +229,16 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
+	int ret;
 
 	dai_data = sc8280xp_get_dai_data(data->priv, cpu_dai->id);
 
+	if (data->priv->snd_init) {
+		ret = data->priv->snd_init(rtd);
+		if (ret)
+			return ret;
+	}
+
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
@@ -305,6 +317,35 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case AIF_TDM_TX_8:
+		/*
+		 * adau1979 PLL clocked from LRCLK, no external MCLK. Selecting
+		 * the source also installs the PLL rate constraint, which the
+		 * codec applies from its startup() callback, so it has to be
+		 * in place before the first stream is opened. The frequency is
+		 * unused for an LRCLK-sourced PLL.
+		 */
+		ret = snd_soc_component_set_sysclk(codec_dai->component,
+						   ADAU1977_SYSCLK,
+						   ADAU1977_SYSCLK_SRC_LRCLK,
+						   48000, SND_SOC_CLOCK_IN);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -552,6 +593,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct qcom_snd_soc_common nord_priv_data = {
+	.driver_name = "nord",
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_DSP_A,
+	.snd_init = nord_snd_init,
+};
+
 static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -677,6 +727,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
 	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
 	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
+	{ .compatible = "qcom,nord-sndcard", .data = &nord_priv_data },
 	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
 	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
 	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },

-- 
2.34.1

