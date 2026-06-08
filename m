Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D679C3DA7F6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939260; cv=none; b=RQqQGpP0DrZF0zU12nedkHc2kVjVP7E0cPy2dhxX4rljHTVLU8e8/LdvsufSEHTdksNrpuyBcYX71kwICXesPXjpJJoQFnsf+/Cok15kOqRkFRVIG1OBD1Vkw2MRqXXw8Fr0UDEkruz24aSTb1DXnKnga+CQXnoqzKZwD/fZSxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939260; c=relaxed/simple;
	bh=0jd7mihh8ACWVh4EcTW6xSrf8XmCjGByX2d8FT3LxWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eeZMPwaVPE2PyIMk9LeVLN/x+dPvMc2Z6MyjS8OAN9zXLUYMGZfBanj4RykcVvHP5Fbr7YCO7Kz0ioxRU9sfY0Bxvg9rlFQ9Lb73eFTizLTEFRU+YcVt7zjvElZ1Qo6pM/N9Y58pYg1prYiScbQ9Fb/hLezbsM95jSzmoDj9gaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9DjpZgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnTCjZJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9DjpZgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnTCjZJg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FKYwS4045927
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 17:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbxt1HAh8ZL
	N92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=; b=Y9DjpZgf4Dc960FTPhvH+A7uB0F
	14Rxv/MCkwLly0CRGU7KPTWlI5kF6Dvaovna7kNi0vRwSJNGRlJr6Wcjgvg7A4xT
	EyvLdxG4UX0FrAyh59WoRuvxvt3vGU1SmSnJq/3gSRg3wq1AkG0DJlhz/diabl0r
	EENyJ367HE8NsfwcaXQEa8x6Yu3qHdzGCgpDzlrWhZdj1uHPd70elEDnkJiq1vk5
	K39MGqBamazt+AkSDexBjxsh9SXxwizkLcnTvM24y5csDrKApv+j47AUykyuNSR9
	prY5DM7r1iftllLuI5m34rSkFVgV37fA9ghGdzywLOrAtl2blYtgiNPA66Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee199w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 17:20:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8425a9979e1so3109369b3a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939257; x=1781544057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbxt1HAh8ZLN92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=;
        b=XnTCjZJgH6qWgcXCv9y0SITTaz55BpdfMT2nUt+1uNONKgAjGRDT1piUxD1PKmS++8
         aYDHbsO+KgdydNHocnlBheCELnTpGL5XgEzZTe/QuLqh94y6+iN2vIL5qS/EvE2gH4xg
         qzYP2XoNtPpMAE66XKMKy3/JVy4t6G87R2CvM4iVS/3HgV+midBx2VlBAoMM0+XH9G8r
         QtjkCA6A6MVGVttggwRBQGLx1nP2IsfGEsAMN3bM0RCQeyt/SPTPdUjjSeP+HIk28ydW
         C9e9FlaQDitUG5PooKVzbKzRABNAsWcVdc9zHJbywaeBJXw5AAJ/E+DsfPxjRI+tHGaV
         yJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939257; x=1781544057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbxt1HAh8ZLN92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=;
        b=B8HyJpuVJMoub0GvLo5AHEQJ7YPE/Ov0CJOsnR209dxcgrMV/2hPznTR8wE5glZq7M
         Gz96O+NlNs52I9ojw+n/qDXU8/1U3OPovsxLWLSRQsuE/6cM00sXl4zOQPGo2RJDpA5g
         8dAXKOesvTKo0gvayI0hj0leLOEMLrvGlaFKqxde6+64SyTglsoY6/0Vow9rFTokNBxN
         DHC1t6r7zgYqMVh0u8yzukRJRWw5DUNOTzjN2gcx+HCGsrsf5wMbKbxhF0yq2441VJMB
         N9heF35wha4b4pucxVLx4x2iI/uBFoR8Hbif3QDbe3nXKLgZ0is6X0+nd9tADtUTApON
         Sp8A==
X-Forwarded-Encrypted: i=1; AFNElJ90UCGBmBfLnbUt4b5M8qPFROaZtjbaZ1FfjCcBxAMg+cmids2aA/b5yi5gblL8UolL5vwyiMH2v7vP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5/QKsEyXt45ByaKOOsx56CQtBFDy1G7ed+Bkb46DvgTYtlW5r
	mPd+Bf4s0gCgG4NaU8O3jl3Drvg+16LCjL6VTUlq4ZQD+eP/IrW03XlSkGJ0sB7trr2L97UdimS
	pbqCVQuWnpbioQ1mtsQZNAlXv31mNT7dcXnJVeFCwR9Upp4RpeDrbmmNbuM5oJXmk
X-Gm-Gg: Acq92OF/phLjW9wxSy1ns2IzRqNCP9uYb/pHld6pugSn2BF56gDRF7xqLJkkBglE65Q
	2ggifzmS3f+hqyALvywgqD1mkvDBWCrij5Xg8LlzBiObR4MAN/qLOFdoBVEBqRu8eLY9HT/W8Bh
	I8jD+0t5zRzk88jhywEz4OAB4FPgBc78yLSEvmADnBb7G0rwZiry4FkygLkXeWFcmf6XTNXRcxT
	fv/ykl6NbYCYpy+4gxxh1gvNYtS/KNOB1mzourxW2roU3luCShnDbVNbRnF/niAi3kcYek7cF45
	EnQL2j1BGkQqAICpg6avtWGDwGsG0Rwkm9SeKsALZ6LynG9yLAYdOARXp/7YL+4AjurqQbkVB7A
	FYQ3+kZ1x6Gjd/SLs12W4vFMFbIF1eGVIkxwevEbcDbsWHYnr8ctPW3Dj335Oha2F7r3V
X-Received: by 2002:a05:6a00:2993:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-842b1007c0amr16327402b3a.26.1780939256811;
        Mon, 08 Jun 2026 10:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2993:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-842b1007c0amr16327366b3a.26.1780939256294;
        Mon, 08 Jun 2026 10:20:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:55 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Date: Mon,  8 Jun 2026 22:50:22 +0530
Message-Id: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX4YZQJWOOI6Ko
 sFKscRfWy5MaX64GGQlphfy+E5fbSPzj7RrPaeE37qAZJRDZyzLEtLdwYQA4ch+sGcQ97wrgw2Z
 Cy5Rzpnauk0K2XssjqewL3UPL+EHdm7kWF47l+mvPxFna/vtJsW04SeK+xfz0WhY8rHD77qI3Tx
 tciJX0UnWdBlH7JY9O+1YAAFzWj9Ks37vhBg46KFBFPY6XYhVhn4KykZRroR7uAVqv8Hy7LIu6M
 W1Sjit2Yfm5O0d4taUOGwZqC0IVJ7eLV60iSUa9HrUntwuf9QI+JCwNBOvMeIHAvp8VSyKA6w38
 T9kP9Z1dgJflX/r3nJzP7g3lKGowNr+7GjrYIHPi3lujfF/jG1OD2kSIRtjTXqs1KtTe1/r/Y3L
 6eq/Noj6jnY3nqAvx34EA5lkKK5xAAd6vflXdRvs/WXNGz9oZlSPYy4/LvMcnIlhLxOjSX52/sL
 /3FFgvuJOmERe/71vBQ==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a26f9f9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8B9EPOnZN0DhMybeGFQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hshYMGdLsjyA_EBdqWdXU9VlPz0qtAwi
X-Proofpoint-ORIG-GUID: hshYMGdLsjyA_EBdqWdXU9VlPz0qtAwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164

Add shikra RX macro compatible data and hook it into the existing
LPASS codec v4.0 flow.

Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
FS counter bypass bit during MCLK enable when the platform requests
LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  5 +++++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..86adad190a10 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -10,6 +10,8 @@
 #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
 /* The soundwire block should be internally reset at probe */
 #define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
+/* FS counter control bit[7] must be toggled (v4.0) */
+#define LPASS_MACRO_FLAG_BYPASS_FS_CONTROL	BIT(2)
 
 enum lpass_version {
 	LPASS_VER_9_0_0,
@@ -30,6 +32,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 };
 
 struct lpass_macro {
@@ -68,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..3a3dec6b14cd 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -646,6 +646,7 @@ struct rx_macro {
 	int clsh_users;
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
+	bool bypass_fs_control;
 	int rxn_reg_stride;
 	int rxn_reg_stride2;
 	bool is_ear_mode_on;
@@ -1612,6 +1613,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->bypass_fs_control)
+				regmap_update_bits(regmap,
+						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						   0x80, 0x80);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->codec_version = lpass_macro_get_codec_version();
+	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
 	struct reg_default *reg_defaults __free(kfree) = NULL;
 
 	switch (rx->codec_version) {
@@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
@@ -3961,6 +3971,10 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				LPASS_MACRO_FLAG_BYPASS_FS_CONTROL),
 	},
 	{ }
 };
-- 
2.34.1

