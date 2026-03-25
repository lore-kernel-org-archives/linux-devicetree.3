Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE893DB642
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441044; cv=none; b=fpcVdsQqU9MogYpzDjLaLeoLGcXKOPPVC4IIZilIokQigc/DBXgM9cyqOWXY5wc3gci1jhqcE1yrwNuLMvUdDPY2Ni/pY85g6f64xtAkrBQj1Flaj3P3VF2ztu2/5s4bEFrhSA4lvPTtow9uvSRxleq27zC8cxPkyj3optUb+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441044; c=relaxed/simple;
	bh=QpPLeZ1cqQr3FzN2YLabhHgQTjAgivfc8dfYen/DG4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjyganEi3+7sBdHTHj8CcAH6LIXQ2CeNDRMLbiEfps6y1Wj20v7ukKT+p60haaFAf6JCAOXHjsN23ef9wfsDlYQD6/9CVXYa3LZwbBdRC6AvJF6eozXzXBQPtnZ71Agy89TBItUUQ8S8LiLMjTfYvuNg2HnIiKn/y+2H4TVV/ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eR+wV2a5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXGybaMB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eR+wV2a5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXGybaMB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGd0M1626591
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=; b=eR+wV2a51z456GOG
	+1RXTAvKbYFflBaHkyGprblzAgmFxqt6+TwATb4dRbUi6s/f1+YSh5QtiJiaHc6P
	nL0WyGYCl8fERgegPcy3uCwwjbipMi3RD1wJPl07o7URqi0BNqODPb9IwK0AL4xT
	79eh0cca7jea/S7kQeDxLv/36PFcUbYn5YAIenMyUlEdqqE56NqvMIXaMQXVGlg+
	/Vm9t7Los/rrmIBzdZmBnCyVtY3Cz3PpJxcqdYPviWM62oLiY/oEHiXLTQ1exvfl
	/BBsPwq/czV4FKbgWPv/F1tloI7WJBWjTGd0uY724mB5pr+nnwCD06phkRlvRH4b
	H6w9hQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whnsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:17:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so119935041cf.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441040; x=1775045840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=;
        b=MXGybaMBvEZ0ZIowdwe6AEqJN7YSH2HFSoIJVYAcPlPV57YJGwZGKLfDwovVb2PZE9
         pKnsbJSLkjRiPRx7EPJPVGQlE7p89nBpQU8p1Bpp2q2xgy+ugkqe1RJPjFKuEoqYP2+c
         7+ziq7U070tEP5t6o+ffVmq2WnZ+mORocM30QOVwsPeQz6Njjrk2R7QQ4yGYebHF3xXL
         5XRVUIs4PIIODdXaUi+DKkTD23nAkGltpxI1Jpl1AkYyieMOrRt+tEIWrpjM+86dAtaJ
         rqVRdam7Pl2KmOWXwT36CR5KZol6OPiA5AcVy4AVU6RutCorJfvHx+bLXanW7IuFNinx
         88Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441040; x=1775045840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JaWWNuEsgM30JPsQq/Un5nxrZosUzYeSlGe0mJTeQEY=;
        b=Q2cLQ8Te4f4Ds99j9/vN8rFOpMAwgyzxmbVcA1FOdMLkkE7q9uKkzkKb5cDj/NHY3T
         tyMsFFnM8hytJr85zjyKNkpdk2pduw+gpE4hJl2wy3u/K4J+CFMhc89q3MN4eB6pVFt4
         DDcm0AFeJ56F/KYLtotOI4t0G/d1UTeemyBW+I6TfKVDEocmPL84rOMu6syCnJnWNuNY
         UCX+t48ZaaKfcTOGspJr7O2enqxeW+5oWRs6sV1Na2DKk/uCpplcDxUtost4/ICtwbPc
         jDpD6XLU03Qt4USsdY+UYMOkq3xdkXij65cv7LNmv996+OHtTA2RYBB/4eQVxJvySY+W
         +csw==
X-Forwarded-Encrypted: i=1; AJvYcCU3/Pp9u618RkQiFlZhlvQI5SHk83bsvxGMtcTMjnxSdY3/Q0T+re6lQodeSoUMXZSC2+sTgnIjRHZc@vger.kernel.org
X-Gm-Message-State: AOJu0YzviKKbPslJm/nvH1mN01Z1cOi//b31wf+q5FO3ELbN611ynEbZ
	38wOsY8WMlnwHV54Rza10R1cNzh5Xy7PXO3hutSqLDZF/sn4CTMhc7oDQAUZMD2Qdf51MYqrJiS
	U1eEycgnRYFo+A7psikEVn7ChW8fA4abCg5VlyimJhY0/RvW1HmMNmhBVeAGc7Ltm
X-Gm-Gg: ATEYQzyf89DpV71S/LjYOI5Cgu7M/jNbFI1nq/dCmFDFbt5sShnr3SSuxTKhnD3XmGf
	hgRtluqoJa7MSXyYCGea8ceciqivovhERVCP+6wYDIxzDx98luR7PadtShQ87AxmdbPUAu+Nqum
	Mmy2qLl1EraRt13ZUyF7GkTPTUA3bCDF0L1bY8kg9GyzMQcB7nEbmpoE6gLSuvpoFzYlR24MJd7
	Mm4ygaNq27eU3dDdCkTuIwh8FsAIMhW0A8wdTRnHlC9oJI2pjXTBkEt+1dEkTf4LIPopKJTKbQ8
	JOmdR6ADkegitSTpcHnoH+y8eZonuuanuw/Mmt2Yu1lJpSaN9x1YTukjmaxNSx0XNWe1/MZQ2kk
	F4pIM/tNfhPgMeeKNaoRCY7Da+nVuuNDTpPs7WmozAG71
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr46901471cf.43.1774441040417;
        Wed, 25 Mar 2026 05:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr46900611cf.43.1774441039749;
        Wed, 25 Mar 2026 05:17:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:17:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:16:49 +0100
Subject: [PATCH v3 8/8] soc: qcom: ubwc: Add configuration Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drm-display-eliza-v3-8-dc2b2f0c74a2@oss.qualcomm.com>
References: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
In-Reply-To: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QpPLeZ1cqQr3FzN2YLabhHgQTjAgivfc8dfYen/DG4w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9I2a+J0pjGAmk2+Lny/aKCD6LOagAIf61WE9
 TEYbIYeoteJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSNgAKCRDBN2bmhouD
 17vuD/9QS5FgUbK5hmT6VQaxuq5f9oHtrr6i2dqMuG9xEuhWta21qkW54rZd3HfyAjfUD6rcFTF
 W2efY5RshQmNFlCrH7+OEwjzkp+DsKzF7NLC1IhhGWjvM33HsXPL3B+dabBSBleM+J8JCA1QLbI
 I97cD81ad4nvYau1Go7JHqdSJFBlA1Z3GnOhLFgnLBmAV/Vfpd6dMvfgXQ5nzRphehCFMJOR9Om
 almvBxdKY77/to2cRVG3BM81fMCtK04ErNY/sU/7Qzdrg35vrG6YgL0nz++isdHHxZLJXqFs08s
 AFNlItUxrJtKJNzPByuiuzbhJzbCQ5ApVAjjv1Qpx+COSHB/XHP3t+1maUvBjm2xb2J0o0mN0Yg
 fGZ7VF0ctzyaZaPuDGjqj9+sC2W3s4LMLuTW8Luco3Q+gHnZf4WGOSBvM56OjbCpkkIZM1wspGu
 6XGpg8onA+nNlXw/7cg6L5egB0+qOpjTvAwrhEoZBFS1VMCcjV7JxZH1QLXw5Znf0XNV0R4V4TF
 WBvmUMrM+ZAxthHPGFEhcEukaVlaP99z7OOoyOIxfb+ebz22OHEPIHq+XgDhB7nbgMg1X2S44NO
 9M4Ggsp5X9xU/4Rpz5lmGrtKjWQr8RZKHmXXdPk2Egy4KkvTgK8hiERKXBnm/yADNcnQkN2VOSH
 TsY5lUlhKdkhcEQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: pLnW6Pq1o59EOvSJ7jQh0okJm92LPe4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX8CD5qNvYgRhh
 3r2u4xCHSxpleTqTKEZuUcvEmWbUIARQikDxoCM1s4/CnOdWuxgqOtxzbd2UKJmMdLRZdQDkBFg
 2V6Y5s9bH8jcw5peJig9WXDEbgAEY/85xYJ/IsNrzNtEKmpYkFjj+bWBs6jqRSbEfOVk9j7u0kU
 B8zMK0vA0lY2JxX+XZC1Jp8dMHJUX2uLQd0Tn0YFXeatlQ2zhy7m4FTcJx3q5+ObWNUc3kQ1FpO
 5xPHjqtiXHYfHbv/RocXNCfVeIkTsmkeTf83uOzqv1Pj2dTJnAY+jzCpQebogAcWmfhpTCmMLKz
 U5QNSg22mTwtu495mOxF42Wk1jXqETtPCQPJySXpgeVBrWq4sH4emAylMJecfvmBP5cjTs+lSmc
 SeIvx3w6Thv24VY1V/lzT85MwhBq6vXENeiI04stQv9ErVVkjTFJ3II2SkhbLF1QWsqqKh7ILaA
 Qfp4XWjtjrJlVGSeQTw==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3d251 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VWhB_nMSBEne6Ym2UFwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pLnW6Pq1o59EOvSJ7jQh0okJm92LPe4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087

Add configuration data and an entry to OF table for matching the Eliza
SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
   highest bank bits).
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 8304463f238a..134c7835e4cc 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data eliza_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
@@ -244,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &eliza_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0

