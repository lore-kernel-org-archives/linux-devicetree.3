Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F554A5EA5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052612; cv=none; b=Cb39zpsAdNXpz03CBugEnjzg90RMWs9vSf92yNILQVtYxkium5iAe7ErTg7UA/p0iHd70t9MpB/tM1uOoxEzi7nCvT2mHvYUuS02gFGoN7yHUhOb5z7/YNW6LhQERMMC9+vcSkj7p77kS5IX66LOwBA2JdTQwyWoibDlCBg6Ddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052612; c=relaxed/simple;
	bh=4FjFToH5ffcBDgAlLURcYX7T87RMUw59JYFGuJWakQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KE/dY0w7A+ydjxjUYVDBsd40v75Ty/XVN0xvTvtE4WprXLuUYKLqiSpZ8n9xxgQ18WnvGzL27zugmyJrVxeFSZLSI/z8vK4s+ZlYX4QanPzsU6y4GLw6l9mVn4NqmsZm2CrFiGCAxvTsFYpw6ERLCBml0l/MFed3qJjR/H22bwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsMg3swu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Whp0wMgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsMg3swu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Whp0wMgE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AE0B2k1334179
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=; b=jsMg3swurpE0kiZI
	vbVOYBfJuSJKpDRYV9c1EAEUrgwouKO2KAka4jOLEWQJJn2o2/qWic2aOvMfBraM
	UZr3WR7eBtbLK4fP8L4+ZmRWZkm59IK82ivgW5NYQdbeLzOLdCb4rScoUMUW3EYW
	NHNPZDHj+4tdq6PryoNvzaCzT2D6lvGY3YyLvQuIXVWSdu9rclniEShDCuUyw5U2
	mRA/AoE3UtCGYo9v48S+wgb8YLgxm8NfPsYY2D13vlwu4szjD8dVLBpBQB9a2nOD
	6k+lvQAq79fnVFb+ok2kIaQP2iGuOR9GkOhs+MTuYGjuNG0cZuA0BL4bO0wtTUTD
	xDpvOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9rg9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a880e91f0so727002b3a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052608; x=1789657408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=Whp0wMgEXna+MzjvHE/cqOmnzJm9VSo0/2TsL+yfXBeDLfacIPxsiR21XwGrUYhfcy
         5JSNkBS38cf8IWJz/L5HtJ6TRV23m8n3ziQuLtv1gRtYE4ei4I+gO2vXVYE5qBlUBXM9
         ttMfUiXyrhlovbEfTH78f8ETKjpK/Um3m7/wjikjL6pRuSn4/RFJbht7V2+eB4r9eplo
         ltAJ13/XffNd0Y4go1QuzIyEqCLwQsE6P64BEa0t/TBP1bXbzCYvvz+ZHKXO5D4w4dwo
         Ve0NhxXwB9Xs3p2rasoDj+qrFdMNmMnssBP9zqX9Hlh6ed+0DGMcXLgB6KVvY91d8IYw
         6lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052608; x=1789657408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWcIiqdgBVS1H44AvfP9lVPTjbT1g58XO7fJFATH97Y=;
        b=rSLtLh66Ce4oa7Eewgpt8oEzfudjyXgvlOouwINgtiIvHVHExJy0OQlm/crcNF6jz0
         2TaDHMJCfjsI9zYIsvEQauraHxWO13nTdXkS9hGwHw4TzM2d933xQBC5ujVncOQIDneG
         iwuZXXlAAwlDeb00cOO+6gtXbueG03l5PIYXwRS4uxv9MEiVmSxf8Tn+LtjyrKdg9Fp6
         CB7OHfz9pW8TNBgF+gQHnVUzODCLr8QehErAYhFqO3k6us+Y6q1QEHpVp0HOVd1ukSar
         3FkBHOFSz/c+68s+jIBjFdlxRX+GWhoTqM68XtbHx0C7+kDHw87sTUqYqui1ktB9GPtn
         CrfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOy1ej3vx3eyKivGvDN5kVfn34JwM9TNbOnKjpd/DL+QQuI2artYyqvv6c5EBYACnlHREGmyfXzTMy@vger.kernel.org
X-Gm-Message-State: AFuF++mXoMb16+Eni63O2oOWYuyTSVm+SvcVqEugmj6GW3TpKlIiGXOE
	29Y39I5W4LFRQvzx4VfhgllDwovtpL3kniIf0eCw7GU/eY4pzxaOMAdHn8qPAeSqhie8QJJb1c3
	MgLB5XpspGEBI5j2UgjXuz9mo8zaeUyPGO/ZCvFbj6MVnFIGel4yHVI1M0L0JtFRB
X-Gm-Gg: AYBFou0gxvvm8rV/27rZG9OBWrIyATwQiXD2DeVqkhkN77fcetuvBIRBohqpXJyJddH
	KP4hLcqJLxpE82/LvZQ8WZGZMHLEcwxjrd4C15YeTdC0J/1Kxdeniu1kIXbLCmkZO5O/q5eC5/y
	YFsoMiRzQDD3Pb47AaTmfQCukSCaA7lmDT8IDXRgChzR+W14A5Lg7X8Yl5cflm0Z+mSCABb0tRl
	8x3PEhxJSV+BQ8bGSo+qlcrCf5XiRaYNvIlqZ4Agf4+oVbq1I7j4C0iC/uqGJzQVBWJlemFuwyX
	knzTzUeyINkR4P2OeJ/gi5DCCuJUN60Dv0uUaEnT4LLyTzASGBamazGpo4T2m4GeuFaz1g2F6/t
	iR85VVaBOq3SndWDyLOYhRTftXCc4
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728496b3a.13.1789052607790;
        Thu, 10 Sep 2026 08:03:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d81:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-86947d0a9cbmr7728368b3a.13.1789052606931;
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:26 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:42 +0530
Subject: [PATCH v2 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-5-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfXzuyo4TJkhGWp
 Dr5LVtAeHGDz+2vMNnFvFYSfvdHY8nxwgvhNgRJoETHgUs3kIBa4w2qICBeKIqcxDcvP3o+2BDc
 zBl8Pe9rWG89vBURrte9/Qcm0jaab5y0Wr6jv5tEKzFPoUm9dnZHjYJKaLzkzB+e7ByyJ3d3rx+
 Idf3FcouAUpdsF8GgvE9tNdGX50G8+09IohopaGZpFoOK1U7M3FzEn/2jDWfHkC1VAGHK6fOvVb
 Qrnzs++HDdlEX5p127UmNtt5hXhd7Bg3zDqQyTB/zi8Dl60u5tCis7Hiklcc3JhDglv0LW55289
 CHQUHsGSr0acBK5uijlFvT2LcMUsP444Fdo9jQNI2rZWbv4TdwXDBYtl+QkgMGOMnRwaYB7Keb4
 QYbScQW6QSE6D4/6xbCG/sgoV5RTeJ8Ynp9c+ttOvTIAT7xI6h6AebzX8J9p4Yd9V4K595puShs
 WSaE0ZqXsD17VDln4BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX3qOzSV1ZMVap
 atKjT4gYJ5Alot/l3o2NaNbWQe+A+NauJNFiOroHqsnz3koxbjV3oKzi36JKWdmj1xr6YulZPaP
 5CEI4oL8eSdQ1ztc47xfobkgiDDvXOE=
X-Proofpoint-GUID: vxvhFolCl30x7GYj05w9kIqbsI7hd2E5
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2c6c1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=W2XY7Ad4WFpPBbQoNBUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vxvhFolCl30x7GYj05w9kIqbsI7hd2E5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra IQS EVK board.
The Shikra IQS platform uses a third-party MAX98091 codec with
modem-DSP support.

IQS requires board-level DAPM widgets and pin-switch kcontrols
because the MAX98091 codec driver does not expose its own endpoint
topology, unlike the Qualcomm WSA885x/Rouleur codecs used on the
CQM/CQS variants.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 5bcdaa192704..0551110a685f 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -63,6 +63,20 @@ static const struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
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
 struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
@@ -543,6 +557,19 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
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
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -611,6 +638,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

