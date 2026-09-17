Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8579382F2F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611799; cv=none; b=aBM5VhOrUT10WPWRaaXfQ5A1QJ+Eup3RKmaufhLwMkEipYWx2kUAn2MPWjMfMth6jwgnn5aySeByLzQcnu+JTOhVDZ/w7ksyh0TbwLAWdBEIm5MntF2domZUcg6nRI5DjOiDbV+1mGNtzmAr4fZQz746xdaOwgwycvaZal4txvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611799; c=relaxed/simple;
	bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpPfVQIrkV3Sf6WPtR17odmekGU6Np//l6WxQP2J6LLt62ssbqKsN6X3BRDwS2gfi4FYbg/0S9HUfHvDvpCMR9ZKsVwOHX1RW42rHnFZOZJV0qHwaEd2cY0rPdGhGD3+p2IgIFg9u3gwVdWuP5VkDXwRmhlqQoAvq0q5/Est5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJx2GgIC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZo8mAtc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJx2GgIC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZo8mAtc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMdcKY1855013
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=; b=jJx2GgICayNbhav0
	mCa9kn5knQ/A8+Xoj9HhC9EzgPAF4wxx6boWCgC2FhJWi2JSXyk/r0bq6nW1yM2F
	JsUgLkKM87MwUZGkHXulkXYzTrpaO8AyDAIfL+OJgytJFeCBGs/p5Ew6TQ66y4kI
	pEnLwKVnH7e/MzDpS0thCGLhKAtAKyfNKpDPE1DbIBbUBnt9MeVmIwlNZ9N4J9nN
	VkT7eTHhys9LWFOVJxHQozof050uWjz+eXp8jzwjT5CJ+zjswK7udXNSyrITPJEM
	lRBPuy1TlHLIMHWj39AEYri4nykAxt+NGYXp1Pba3/4thnGneKJWlji/mGIzLhgJ
	MDMBAQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3v6yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:23:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so744451a91.1
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 19:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611796; x=1790216596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=HZo8mAtcYGdUx4UQPSm3F/M5dtdBHCoG5Ri8QJDbwh1P4sBU0ynHaWs+4R8Aj8KS7W
         R2bpEzELSPZF2RgZpf70BUMukHyfNV9jXyKo4N2Osx7OIyYrPmAPqIMFIwKYQu0jDSJ/
         oEQAU5d2eTkX6eFSfDfJBfoxecmsCJw0UGRPPLS6aIkCoiiB4o/dwFG83W/VnkDiMlhA
         ZV7oMJRpQNvnPYWRL9VOF3dI9+0/QC+Wpey5l2WYXJJnJIvpcz/zhD5H+t2wcVfMVe7c
         EaCqbi2A3TBhbrUzyAPNq11Bqe+yfD5B7p92CLsQn8rI+CcQGJXeGz8CoH/PrQ+VEI1H
         H4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611796; x=1790216596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5InIH9SA9XIaAcbkWSnsbw/NAVph5smayjy91m/6Qg=;
        b=ZDgrFC7Q5HHd6eXCmKYYo92P+tQOjG5Ll0jiUdG3DDKb3JQvzenlY7FGo0SDesaw3X
         6CTp7LzEiWz9uYUvGp6kyY14KX0vKGJNABOCNTdUoKbYthvWzbkWPz51k7TH/8sdMxDr
         PRY6KitYohbtxWo3KGSCOIp+yBwkD+UDNVGHvsUQ1sLwUe9gnbgzqX3On4CtaEoTNBeA
         27asjlmHZEozZ6pi6QiEM2QxHoR0/8mQoqmrz2QEzjQRsoNml6wEc4THWKngDS2kFvvM
         d/xtJIzFokDqbgrQqpwlirJM9hUYtMV/eVwy5DV2skqr64Y58DZVOl6KAMUqRhrXiD18
         Ubdw==
X-Forwarded-Encrypted: i=1; AKwUvBxnAYWH6BK/4pulnlTxzP+pe8mUg6+8/U0Zt318CXSbDP+c3AjNUEpWUGgsFSn0q0yO5tP2yKq3Qzdg@vger.kernel.org
X-Gm-Message-State: AFuF++muevqQ4hRa9qB6nnSsV3XDGTEfAB1gK5JxJvWBn80ZRmhP37bS
	VwvdYSHACUpiMB4h53myEFzICpFaeU2PfE2SPQTWa15RT32SdgQFVV/ilmB5/ohaImXfJ/IWpPj
	ukitID50PlvDKTokWfrB620PG7zDYO8LlwAGjCSbK3K9PuxcbZNpMQvcfjKzK/uuW
X-Gm-Gg: AYBFou35v4U84MBNGXVquQ9i0j8rFfoHg5WBO4ud7bEATdpIGAA/uktJlEkltUga/ZP
	saDhlVO+dKIU+6ptSJv2lPyrLNfvjnCDWo/NH0U/UmoPygwurO76q3w85uHfVZgva2+7hRNVRIc
	084X3iw9PMOikaIrTMPbBePxHK7GLDkbuY6et0e8NV45m4SAu833xPRvF2NQGo0WFRGmIKlRGs7
	duKr5YL9dKwmqxau2Tio+nTl6QpScUrT5r2ipxFCXTcozDmV6aB6tQrbMiUgKs+BDGLz9/ZXdXf
	6fUHM4IRsGP4G0i5Pp4xr9bwLY6zX9WZEaayDgalQw7IASU3G0DGBT38ZZ7rrJIpYPxlCEblsOK
	WNZKkEo7vVsz7/+KsCke3/t4jmfeO72NFVmVF
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771252a91.0.1789611384843;
        Wed, 16 Sep 2026 19:16:24 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr10771187a91.0.1789611384299;
        Wed, 16 Sep 2026 19:16:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:23 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:34 +0530
Subject: [PATCH v3 v3 3/5] ASoC: qcom: lpass-rx-macro: Add shikra
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-3-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611366; l=4176;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=8C+D+unSEaRGl8AxrVeK0iFZsXPZ9fBEhD2PWma7i9w=;
 b=X9qkND0FMohlTB4T/7cCV3ZWxVLAuWzfnqtMWywSDzViKEmkD8nXRiOMuj+kJSpQ6zDmTlG1+
 lCawrUbHHmwBcmrxP6/yWZVu2MKwyIUXOEVoo3NIi0Cbysps4hORgli
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzMCBTYWx0ZWRfX8xQ8cAcCkLfq
 OGTZM+OMqbE/2GAYpcAcaYKBGRYREFQ2P5zvWp0JYcw3MmOqHGoyW6k890iyzOz+1+QcYAUPcFN
 NODLoSan7s43GFtCTTs2olCnJAcwoe99dsSGxsjtQcTq3ugyNT5UjO5uZjWyO78JablN15k98G+
 wv3fsFTdJ+rg8W3UT6od/eel/16WnjSCgzIcLkiqvKppvXt+pq7sO0e+7UjAQZ5ml0lQE+wnQ8S
 lqOGcHBBjFnuwNvBogW/X/hXuIQq4HsN4dgI3vfAvKSa50pKNtJXuf3TtFyXWbwZ9lzMGQGJ9pd
 EP6Y/g7dKdJ4RIixCtP94LawJvoFP5I/BZ8T+kSelDPRRs+LxRqBXdGIltGzKJajkAOjG7vTO4w
 8I6pVXkyH/T34bGdKbUGoEVEDgaZ0xmEZrg705PQSZ6ABgsV2iuUStB1W/SN8tD/XEaX6fGBT1t
 6pt+CzhFjmKyMRGfL/A==
X-Proofpoint-GUID: r2hEDBambaTCyHHPTr8e3jfYn1ANrp4W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzMCBTYWx0ZWRfX5nfGqb7diUNV
 dmIsyrhDZPFwMxTO8alU2/2in9qmko4KAzgxidSz4cqEeDxP9rd+LrMM9gAi3sd2z31CVH2S/x2
 a5iidf/o+TEgwtHY8Ao9CXiOgPSyzB0=
X-Proofpoint-ORIG-GUID: r2hEDBambaTCyHHPTr8e3jfYn1ANrp4W
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aab4f15 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o21owqKzMMMBH8jYOm0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170030

Add shikra RX macro compatible data and hook it into the LPASS codec
v4.1 flow.

The RX macro register layout of LPASS codec v4.1 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls
and widgets for it.

v4.1 additionally requires the FS counter to be bypassed before it is
enabled during MCLK enable. This is a property of the codec version and
not of the board, so key it off the version detected by the VA macro
rather than off match data.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 573b2145e..b52665b11 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -30,6 +30,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_1,
 };
 
 struct lpass_macro {
@@ -70,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_1:
+		return "v4.1";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index c41eb8de6..93ceee878 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -60,6 +60,7 @@
 #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
 #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
 #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_FS_CNT_BYPASS		BIT(7)
 #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
 #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
 #define CDC_RX_SWR_RESET_MASK		BIT(1)
@@ -652,6 +653,7 @@ struct rx_macro {
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
+	bool fs_cnt_bypass;
 	struct snd_soc_component *component;
 	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
 	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
@@ -1613,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2045,6 +2048,11 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->fs_cnt_bypass)
+				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						CDC_RX_FS_CNT_BYPASS);
+
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3652,6 +3660,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3837,8 +3846,10 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
+		rx->fs_cnt_bypass = (rx->codec_version == LPASS_CODEC_VERSION_4_1);
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_objs(struct reg_default, def_count);
 		if (!reg_defaults)
@@ -3951,6 +3962,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	},
 	{ }
 };

-- 
2.34.1

