Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968451;
	b=VryZmCtvHIoe+DWrtaTPjCwPtwAdJ+/gwIyL3MkZc2SBglfpIoy48draSf90zlJoAv9x
	 czZU7wzy/os9mgQwwXlHcCM8e1ayEroWe4wLa6rBUD+Z/7YuoGTW1I3yY4ycSehK+vMxO
	 9smREr8pfznkO5rX4R0zp7zrFOyAkJF1QIyD4NYlqNI+T2in1N7zU4NGIyczISF7V3+Ac
	 mn8h4EPHTKevwBuzP/uis3WcBbITBJ+RiRafheozABmvvDH2MQYH4li9YyOBSIwyP2mvq
	 il3QyTGqRQZZxhSN/d7hLGp6WHUdiunAapBgbbZsPBJlIkS22QefqSLLXb4MSg/7EIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
	b=vCtZxoiJI4tInd/Sb07KLxbjhDK0YYclpnq5Ty1m5C1A5Dtmx5NWFRwxLtnB4KmPLzrp
	 ou8lvlV/RBEvhNw8E6JC42E03TeNUn8lKIYe5l8nhZen4jN5W0Prmu1/NdpMnfH++UOsz
	 xup6/tLIYDQBBddr+M38bKlHt6bq3HSCip1ju1z5s1d/rLryI0taokYFn1EaTA+/IgX1i
	 phhDyRkiIJFKyqRTxFzcEcmuE4fTnAHxW6MHxM863aJiHQkmCaZaR7EWoViXJGAKInTVC
	 z2mhzloQr7HOAoAtwkytcEZBhHevUWICBlPJ67HTzkmjnAp7aZrqGUyX1nJTGHXnKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrDQ0Pa3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVhEwr0r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63553606D801
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 12:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63553606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrDQ0Pa3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVhEwr0r
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APJ2p2593315
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 12:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=; b=YrDQ0Pa3w1BZy+l4
	751Jvbn9b3Ya5kMsporgP92mZAH55F6NalX98/CDS4yFSC5yI7udykDOQI9OAulN
	VpN/DnDc8TLFtNZCVAVBmNntOKcyqTpYZQHb6RC86QKVVadT0O37f57B4FwW4F80
	PHNb65Z8rdHVDRRp78T9KbQdRXfzNxbq/o+Bt6YdYC4Llfpv4QsWIRW+jg2JVnvH
	gYhrQ/1wfuaBLhm3p+r+DCxJHKNva9L2fN0yb2jMxpYOlncqhTod0nss151FwBAE
	7FpM245KJCvPMXcV8zfZDmiCaEUCjG3qPBsSS1ooRX+qRzQaqK+pEqLhHVuiPDsE
	PYrOiQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paar09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 12:34:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso811367eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968449; x=1794573249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
        b=HVhEwr0r81nzYV3pByUUfoKjEVB7IjRZMA+WlsRznIPFAK3MQWWAz8eI281BEz03T/
         X81E3m8qqfy77IuXsq3j2ynljczJCoB+l2s+tHvW57FBaq/kFNl0fqbvG5rKGZ4IaOhx
         UN0ItlNv9k9Dw7f7oncHSdh59ggceOj4NrOSAxD8EPaxT4+euJNv+ffDZ8mEe+iffUEk
         avLAItCEXnKA31Rrm1zTOWCEn4Ei/pydF5Tr7vlAOsvuyAFgskzUAAVUA4Mg4CYtSQoU
         kwkthxeQuG/ZXu2wC+3H6HrL3ZzQKTfWRA7c9nUvpGk256/SV8IyYS6JCRuFZUJJKiZ0
         kvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968449; x=1794573249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9uuC49uibIqzNvqYNHttoC/TaslJ2ksoflEWBqy/38=;
        b=wmIhRrgFsxpMgcN1uVW21+uo4WTeB/E+iddkI26Jlr/VXRQR3apj+v2F1tbpeBXHPk
         tQGC74wTn2MpG6Zn+6FKtoP4YaPC0OchsQZw0kOWyYyJd1jx1lP0/tq9jDCE+u85lz5z
         7LwEvOueF6ZZXVIociNTglTuCYQdeLtykpA116ZdJujqcefN8GPiCF3uoqNz47/FWfxx
         8fIJWGFQXvkpqc1rbpKjo432sGEr6AO7wzxktOnmD1Wfg12V3EYOJ0n1dxOo8938fSNR
         55syKta5ntHqn8uagvL333rRMUgYhKsJQSlnfK0BVVI6VYXdc6P+TQxeL566Bz1LUeBm
         GZsQ==
X-Forwarded-Encrypted: i=1; AL+hErG7oQE5ZS9LtJ1UvSlk7JcNzN06u4dcUFbQKEJOz2DIHOV20FNgXq+7yNRpQrzfVPX7EX92rSR41le1@vger.kernel.org
X-Gm-Message-State: APuU4Z/gHKc/KN8OfSKFkk/pKjCuCYBhPIBzDucITxUbNAigLTBVHloX
	779Q2j2UilQZEWIIjgH8SyQm6VkCrBBL9wydz0O9LbHX78Yw3P5UMKnrz50jufpdg9HeoWjqLvH
	kI5JjpMMSqZ9vXyjk+LFK6cwSPWG84R8vSRFiajfz/nvqNOefxDlZAucGvtMwRCok
X-Gm-Gg: AYBFou0kJTmkxhovAF/q2oe+KioSEUjMamULD+UjoTHNokzwXV/2kUyRPWGVDJlXn4x
	VReQZRFm+f3B7/93Ljwtc9IwkS4Jm3FlyRDFcvLZ8ksDs7rShn87wB0EqTaaEnjRCsgTt59Qqkn
	xCDRsjqQ8F69VQ+WhuexkCUgoIWL9Tu7nVFIOSEa1PUl+QIbZzZfrqJYz6ldKTbKs4GTqoVO4aj
	VKV6+Lbhoff+AFx7Fg3F+oBEsgRk0ChFkXHTU7F4OZUZ9LIrvCRQvA6bQzan9fP0S9JffkDDfg+
	upXfL9nIAICDwQDgiVf4y52A02Y8fIrgQ1FJksWLCOVAF8ynAN2msjDZ9kbfF+tJmyEQ1rREfok
	UHtmulzPjYpMMtSrp1+lmcCShwA3h3XAuWiYEccYgU+3UIARWNmZ5Sexv69AActbMr5MrJ0RR7y
	gUk6xdVMrK
X-Received: by 2002:a05:7300:cf91:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36f773f0683mr3318442eec.6.1793968449403;
        Fri, 06 Nov 2026 04:34:09 -0800 (PST)
X-Received: by 2002:a05:7300:cf91:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36f773f0683mr3318402eec.6.1793968448778;
        Fri, 06 Nov 2026 04:34:08 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:34:08 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:08 +0530
Subject: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968395; l=4318;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=0O/KQCzGRUPAuDFWuuYOS9c0YMN/OB+r75xvXVHjAJ4=;
 b=qzlx+BgMzvpuHVRmfrcoSf3x0U48qbH+mrQxTSuIUBcw8QKY7UAeQDEc7gSm+8B2Erm1OZOWN
 E6VUOR+v2G6CUet3zGQOQYWGzLW4CNkyuZ3CaRYb/elc8K420mlwsyx
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: W-JfDOoH-H7GdkWaT6nDtb19kPo42ReO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXx4kjacv0KpRn
 ZnGYaJnW0n9Yf7/m8y42RoT1LaTRZmwLtTLkoXf46ZA/zBHyIbUactVtXFlWvvc2/JbRt6njr8z
 f9v86qmZTeslWQcfeQXHkOhuyzo11pjlrS9pTrzY7V2+2mmrX6Tg4gBNFYJSCat8AR1w3ZNM5d7
 flnF1xBSLG4yG4fuI08KPEQK85SjImJVjKzFpm3/9HUg/sKoYn3vQBecj67T0H3y4++QzFMeK7b
 CDNiHZxHoDK+xKZGBMMULgEVaPLlz93UEu6Mqdtwq2j/W73jD+f8NKTMb7pLTg8y7v/7kiT+Hw+
 xKojdjyqSvap2PiZubjXrxY/V0bCD3wgD3+7hrReJUbyYcoyY9a5lxgGgwGXeAMtNxfp8F65Lc+
 dz/+Lau8UGnp6rtC2KIlOJ8qtCOCy689bfhenhvYWPkgODjdadZZHwFZgl/rE/xX3o60nGvXPN2
 oyLDZkicuA5d69lzILQ==
X-Proofpoint-ORIG-GUID: W-JfDOoH-H7GdkWaT6nDtb19kPo42ReO
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aedc942 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Pm4gKVr55SiOJ_VcJFcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX7bwZUDyPlhYi
 OCaNcdWJDprwDXdO47syOTJ3sTAKJ3hrJQkvgnPXzYs0J5oh4VjaDOmzGMAYb3z76zuhdy67rYC
 59dZ67ywk8LftN4xyBd9NWDH3s5ykQ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, which the macro drivers do not
yet recognise.

Add LPASS_CODEC_VERSION_4_0 and its "v4.0" version string, and detect it
in the VA macro when the hardware reports major version 4, minor 0.

The RX macro register layout of LPASS codec v4.0 matches the v2.5+
layout, so reuse the existing v2.5 register access helpers, controls,
widgets and register defaults for it. Unlike v4.1, v4.0 does not need
the FS counter bypass or the adaptive filter blocks, so those stay keyed
off v4.1 only.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 5 +++++
 sound/soc/codecs/lpass-va-macro.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 707b22a6bda6..a51a6012a7ec 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -31,6 +31,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 	LPASS_CODEC_VERSION_4_1,
 };
 
@@ -72,6 +73,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.8";
 	case LPASS_CODEC_VERSION_2_9:
 		return "v2.9";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	case LPASS_CODEC_VERSION_4_1:
 		return "v4.1";
 	default:
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 5fe06ce6b960..ab1b0d7c5dd4 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1615,6 +1615,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
@@ -3660,6 +3661,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
@@ -3846,6 +3848,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 	case LPASS_CODEC_VERSION_4_1:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
@@ -3959,6 +3962,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index a11347404058..0f94f445f082 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1901,6 +1901,9 @@ static int va_macro_set_lpass_codec_version(struct va_macro *va)
 		}
 	} else if (maj == 4) {
 		switch (min) {
+		case 0:
+			version = LPASS_CODEC_VERSION_4_0;
+			break;
 		case 1:
 			version = LPASS_CODEC_VERSION_4_1;
 			break;
@@ -2175,6 +2178,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

