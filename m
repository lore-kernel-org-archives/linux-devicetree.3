Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967B37E5CC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219373; cv=none; b=Bop92MeG1uheo+a3BT6dNiG/npI9+hSgdNsiyloCPfzr3Yg1tWQIWP6URqB6YGVbVv5MQmMC25JgqWxMLE2s1Fcz2kVMwlCv6dH/u0LKWP1097kPNhlnj2Iz/hbw/HWS0aG0X4YpTgqF1Fe/Vsvk21aYLpBghDodg7yDberebO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219373; c=relaxed/simple;
	bh=RiIunCof7qxDCCa2KLUOKvDMzS6DAZ+kl5SLXmkIh9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYy308oJCjSg9NCFrx7K7MumQ/ZuXWp6mSON24/E7WGwm2QyCA0B02am1X8/93KBVoLXThPgNvw1Xr2VQshfZgNenql9h6VNxKm9vMGJMYbCLOfgDHQX+P9wiAcKNpZyVaEuNeMLbofci6tJtshL8PmFWUQW95x6LMFMrCzns6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogBTnrdu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L2pIkQ8D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogBTnrdu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L2pIkQ8D"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSwpA3172368
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=; b=ogBTnrduOn73cG+h
	GEHKXcoNYObuD4t45x3xMmbtzQ2+QDvFS6o8gohTVfiUhdEXj1uWvS4d9tML0R7t
	BeUC7GWO5pnX+2rBj1vptdX+mnTmxLuQvtK4k5OvY/szpjpD/Fi1WYT+OqiDzaGW
	5JfpbWuyrJ01DgypWcgW6jqC90Wf2RBe+LJB2Gxc6+/9iUQ0Q+c12IlPFpEfobBi
	ekqoe5F8NVksnSPeC9gKLKozvAT/Fpww85EVnEoTrFfQC3SLAETwOPelUzab3mcs
	ZtelsF2evS7EIYDDsR57nfgNj1Ag2wYTzvXZnqFbozI45XlIb6z20usDtE3Qf1lB
	bXG0wA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1w0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so139176595ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219370; x=1784824170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=;
        b=L2pIkQ8Dd2+5xh8nx7Kexl9qrNRNxknGsHXND+aeo8elEFGLCXf7vdh81pFuV9Y1V2
         hm+3J+So7TuzQ+qivj7INoM9eh2IYU9Iv8976PnsmFYpAIZcnFsapXX0c9yeQ15Z0nu0
         hkYU9pp1fm2kHmLGpmqgBVLwKykebxe2McEG0hjHP6lFmhPoj5H7syd/W89HynhiH2hB
         O85+eyDv4HGHHL7sokTuQjoYOLD0fTC3cQa5tmdxisZIaroIc4pVyhX4owUhPWR8L/1D
         6lca+rp5GejcXUL3OWENqHVSXebIg5WyRRgj2HSONn2EVK1m2MTqM7oJgOscBlshZjf8
         PBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219370; x=1784824170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymEDHH3yD9InhXBpGw9YyvwKrOvNc/XZ1tYpQ9EQIZ0=;
        b=D6S487xpWpOjJDA4213rp/XXOO7j71xlvvqvLC5iE7usjl8zcMZ4wEQVt4FWFyZDdV
         h2/p6LZoK3o1CB3d+sKTpaNF7RGeX5phtPvtmgaycBcLMDEP3GbRozUtyjlbhfO/CV2f
         tCf+JixLMGslSYa4lAh7UwOsvs4TqoJTwgxh+eycghIQT6/6OoIxd0nYe/VUTKPPPuwh
         eviaNSZyd0ZSv6c5n89JAj3M9slV2SfNgOPpnQNLovLoTFJ1nkbQ5GHCY/jjx9/gMPpH
         f0l1UCke95y/y5MjX9cqHsNTSYbarD8AxWScSxpFLdjEozx7ri9zbzFQb4hK29MoYh/W
         G7bQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOctjmTiIKcgpftuj+KgPErGc/CKLOH2haiaeE9bekfK4Pvb++W4hYvWi01eyV2SsJ/bQF0yRzTM4V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/9+aUz4UBO4itw7PlNuNyqWy28+Nncx24b1zhidOD+jgqakso
	nn9hmma9uVr2j7Njs/oQb7z6ykwd+BFTsh3julfUBNzgDXfoKBKCkxP5cm0STPsElQHa03ZYXlc
	3Z2UqzmGhntuO/MdZoe2tW11ajp87MR3Q8OEmOJDaRUMWi1qtZIAFnSEQeddY8jAC
X-Gm-Gg: AfdE7cnvjlRTT5mHOTuDk2VbLzHeKJZKaHITkTBbfcvfa4QICWG651ITWLxF9Kfste8
	dcm6MQIY/t/z+g/Ef6y9Wljd2Rc1yrEvmLU+5h753DgnyXHUo/1VysumO6cOl03wHyy40HkzKwP
	iyWQ9PY6/Jy/TKy7Mc/4TYow1mw7D78PaTaE/KhXiiVeCRcSMmM9O48x8Muz7DR24GskHH8vKFw
	goCN/UnYSJu3eOgRLdv2cN0oTEgwPOHZLdnvHPYuuurDFlPalNTES75Fp7M6EjU62vwE1FZkTHd
	YLRWVoj93fuv3zEOXhauQSk9m3GiVyXTK5DGO69eTNUKlxP/zpDFhI2mJI4iQQx+bQnw8uCNUC1
	niGHqH6NTsdMxnNbNo4Q0Khgwur6itY/0owssWFaIyyO43MJ/nyDLa20WWy6G42gT2/+0nQ==
X-Received: by 2002:a17:903:8c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2cf03dc8dd7mr74482595ad.35.1784219369628;
        Thu, 16 Jul 2026 09:29:29 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2cf03dc8dd7mr74482355ad.35.1784219369207;
        Thu, 16 Jul 2026 09:29:29 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:28 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:59:08 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQS platform
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-shikra-usb-dt-v3-v3-2-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=887;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=RiIunCof7qxDCCa2KLUOKvDMzS6DAZ+kl5SLXmkIh9o=;
 b=GiDNy7cbLuwW5ctj8xaQz7KiYErvNTfOiEsqoPbpvRBQhmtscpILt/kHzELQEBnfZPc8FAkIH
 TMvDt5hEWsTC7Jcqfyq8MuYLeX0Ucfz2a1bwIhttHD/fcvQIbzzISjD
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfXyLI9Y2lHKh+K
 wleki2o0NspJO+0SkyXMxGtnI2mrZ6V71VJjO4kcwvRjWHOxRYSMW0mtqdjTAhDEfDj659LaTv/
 AIGRDVNBl5vI6wuW4C7Cks3CX+WqlCMhXrLbXuNSlk1R6wI1c/r1aIgFtvtp83z5npa+gCZ+gRt
 DLcZRubGrV39gZH/bIMtzAldALzQTVKxrsDPXL1/Op+1PVq2VzYcNQ2vjKB9ozYr8Dhakit73+0
 RRa5Kk1StSTO9I60anYqTkBEaM1ES6Z438QHaWP5nLe01/aQD+KRPwMYpDdQKk9k7PBz1obYQOR
 FCiwYh8/+LnfR5pHOmMVGPDxWZXpO+xaT+R/wcTkVNd53ncKT1EXt0AHGd2tjV1CsA5S81grjxf
 UJ2c22VuwK6Pt9Jkue/oJH1txH3xcGJo8l6dttPbA7V380v+94sYA7pcc0dEz5UkUPaNVczNQ/Q
 rVf0B0T397WFC8SedPQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a5906ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QSxMXEsE6y_H_vlI6RcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8rjthDZFFgH9yeCWUfSEFFzWoZ0sHg0n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX7edtk6yTgaCc
 FESM9i8zI7VxWoJWsgYLneR2uMg+sA3JiR22/M1kNLbqPhPyHfLomp3cj+gmROh2ugLgV80+KBk
 QZZeazKyD7jYOuL0iRzCJQGsp1YodtU=
X-Proofpoint-ORIG-GUID: 8rjthDZFFgH9yeCWUfSEFFzWoZ0sHg0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Enable primary USB controller in device mode on Shikra CQS platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..2e96dadd650a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -38,3 +38,22 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};

-- 
2.34.1

